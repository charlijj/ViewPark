#!/usr/bin/python3
import os, sys, time
from sql import Database
from avail_calc import getFullness

if __name__ == '__main__':
	dir = os.path.dirname(os.path.realpath(__file__))

	# Config Setup
	db_file = f'{dir}/sql/viewpark.db'
	init_db = False
	interval_minutes = 5

	halt_execution = False
	
	# Read system run args and edit config as appropriate
	if len(sys.argv) > 1:
	
		for i in range(1, len(sys.argv)):
			arg = sys.argv[i]
			arg2 = ''
			
			if(len(sys.argv) > i+1):
				arg2 = sys.argv[i+1]

			if arg == '--help':
				print("Options:\n\n--init-database:\nDrops all tables if they exist, creates new tables, and populates with test data.\n\n--interval <custom_interval>:\nSpecify custom interval in minutes for updating images and availability, the default interval is 5 minutes.\n\n--database <db_file>:\nSpecify custom database path.\n\n--stop:\nStop program after initializing database, does not enter interval loop.\n")
				halt_execution = True

			elif arg == '--init-database':
				init_db = True

			elif arg == '--database':
				db_file = arg2

			elif arg == '--stop':
				halt_execution = True

			elif arg == '--interval':
				interval_minutes = float(arg2)

	# Start execution of the application components
	if not os.path.isfile(db_file):
		init_db = True

	print('Connecting to ' + db_file)
	db = Database(db_file)
	
	if init_db:
		print('Initializing ' + db_file)
		db.reset_tables()

	if halt_execution:
		print('Done')
		sys.exit(0)

	print('Using interval time: ' + str(interval_minutes) + ' minutes')
	print('Running server maintainer use CTRL+Z to stop')

	while(True):

		print('Checking each lot\'s camera for fullness')
		avals = getFullness()

		for aval in avals:
			print('Adding ' + str(aval))
			db.create_availability(aval)

			# Generate JSON lot data
			with open(f'{dir}/www/lots/'+str(aval.lotId), 'w') as file:
		
				days = []
				for day in range(0, 7):
					hours = []

					for hour in range(6, 17):
						q_day = str(day)
						q_hour = str(hour).rjust(2, '0')

						query = "															\
							SELECT ROUND(AVG(fullness)) as avg_fullness						\
							FROM availability												\
							WHERE lotId = :lotId											\
							AND strftime('%w', date, 'unixepoch') = :day					\
							AND strftime('%H', date, 'unixepoch') = :hour					\
							AND strftime('%M', date, 'unixepoch') BETWEEN '00' AND '59'"

						params = {'lotId': aval.lotId, 'day': q_day, 'hour': q_hour}

						success, results = db.run(query, params)

						if(len(results) == 1 and results[0][0] != None):
							hours.append(results[0][0])
						else:
							hours.append(0)					

					days.append('"day'+str(day)+'": ' + str(hours))
				
				data = '{ "lot": {' + str(days)[1:-2].replace('\'', '') + '} }'	

				file.write(data)

		print ('\n', '-' * 32, '\n         Interval Started\n', '-' * 32)
		time.sleep(interval_minutes * 60)
							

