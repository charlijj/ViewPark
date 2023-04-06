import os
from database import Database, UserEntry, LotEntry, AvailabilityEntry


test_db_file = 'test.db'


if __name__ == '__main__':
	db = Database(test_db_file)
	db.run_script('create_tables.sql')
	
	# -----------------------------------------------------

	# Add user
	addUser = UserEntry(
		userId = 0,
		userName = 'TEST',
		userType = 1,
		email = 'test@example.com',
		password = '1234'
	)
	db.create_user(addUser)
	print('Added test user, expected result: SUCCESS')

	# Get user
	success, results = db.get_users(UserEntry(userId = 0))

	if len(results) == 1:

		if results[0] == addUser:
			print('SUCCESS')
		else:
			print('FAIL')
	else:
		print('FAIL')

	# -----------------------------------------------------

	# Add lot
	addLot = LotEntry(
		lotId = 0,
		lotName = 'Test Lot',
		lotType = 1,
	)
	db.create_lot(addLot)
	print('Added test lot, expected result: SUCCESS')

	# Get lot
	success, results = db.get_lots(LotEntry(lotName = 'Test Lot'))

	if len(results) == 1:

		if results[0] == addLot:
			print('SUCCESS')
		else:
			print('FAIL')
	else:
		print('FAIL')

	# -----------------------------------------------------

	# Get invalid lot
	print('Get invalid lot, expected result: FAIL')
	success, results = db.get_lots(LotEntry(lotName = 'No lot with name'))

	if len(results) > 0:
		print('SUCCESS')
	else:
		print('FAIL')

	# -----------------------------------------------------

	# Add availability
	addAval = AvailabilityEntry(
		lotId = 0,
		fullness = 100
	)
	db.create_availability(addAval)
	print('Added availability entry, expected result: SUCCESS')

	# Get availability
	success, results = db.get_availabilities(AvailabilityEntry(fullness=100))

	if len(results) == 1:

		if results[0] == addAval:
			print('SUCCESS')
		else:
			print('FAIL')
	else:
		print('FAIL')

	# -----------------------------------------------------

	# Update lot
	db.update_lots(LotEntry(lotId=0), LotEntry(lotName='Updated lot name'))
	success, results = db.get_lots()
	print('Update lot, expected result: SUCCESS')

	if len(results) == 1:
		
		if results[0].lotName == 'Updated lot name':
			print('SUCCESS')
		else:
			print('FAIL')
	else:
		print('FAIL')

	# Don't need the test database anymore
	os.remove(test_db_file)
