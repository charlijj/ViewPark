#!/usr/bin/python3
import sys, time
from sql.database import Database
#from avail_calc.ParkingLotController import *


if __name__ == '__main__':

	# Config Setup
	db_file = 'sql/viewpark.db'
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
				print("TODO: Implement help function");
				halt_execution = True

			elif arg == '--init-db':
				init_db = True

			elif arg == '--db':
				db_file = arg2

			elif arg == '--stop':
				halt_execution = True

	# Start execution of the application components
	print('Connecting to ' + db_file)
	db = Database(db_file)
	
	if init_db:
		print('Initializing ' + db_file)
		db.reset_tables();

	if halt_execution:
		print('Done')
		sys.exit(0)

	print('Using interval time: ' + str(interval_minutes) + ' minutes')
	print('Running server maintainer use CTRL+Z to stop')

	while(True):
		time.sleep(interval_minutes * 60)
