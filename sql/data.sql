/* INSERT: USER DATA
	userId				INTEGER
	userName 			TEXT NOT NULL
	userType 			INTEGER
	email				TEXT NOT NULL UNIQUE
	password			TEXT NOT NULL
	registrationDate	INTEGER
    
    PRIMARY KEY (userId)

    Notes
    -   50 users are created in this statement.
    -   userId is auto-incremented in SQLite, and does not need to be included in the insert statements. 
    -   userType = 1 represents a 'General Parking User', and userType = 2 represents a 'Staff Parking User'. 
    -   registrationDate stored as Unix Epoch time format, as time (seconds) elapsed since January 1, 1970, 00:00:00 UTC. 
        It can be converted to a formatted datetime string with a query like
        SELECT strftime('%Y-%m-%d %H:%M:%S', registrationDate) AS formattedDate FROM user;
*/
INSERT INTO user (userName, userType, email, password, registrationDate) VALUES ('gentest', 1, 'gentest@example.com', 'papaya', strftime('%s', 'now'));
INSERT INTO user (userName, userType, email, password, registrationDate) VALUES ('jane', 1, 'jane@example.com', 'papaya', strftime('%s', 'now'));
INSERT INTO user (userName, userType, email, password, registrationDate) VALUES ('bob', 1, 'bob@example.com', 'papaya', strftime('%s', 'now'));
INSERT INTO user (userName, userType, email, password, registrationDate) VALUES ('samantha', 1, 'samantha@example.com', 'papaya', strftime('%s', 'now'));
INSERT INTO user (userName, userType, email, password, registrationDate) VALUES ('michael', 1, 'michael@example.com', 'papaya', strftime('%s', 'now'));
INSERT INTO user (userName, userType, email, password, registrationDate) VALUES ('stafftest', 2, 'stafftest@example.com', 'papaya', strftime('%s', 'now'));
INSERT INTO user (userName, userType, email, password, registrationDate) VALUES ('toliver', 2, 'toliver@example.com', 'papaya', strftime('%s', 'now'));
INSERT INTO user (userName, userType, email, password, registrationDate) VALUES ('gia', 2, 'gia@example.com', 'papaya', strftime('%s', 'now'));
INSERT INTO user (userName, userType, email, password, registrationDate) VALUES ('emilio', 2, 'emilio@example.com', 'papaya', strftime('%s', 'now'));
INSERT INTO user (userName, userType, email, password, registrationDate) VALUES ('juliana', 2, 'juliana@example.com', 'papaya', strftime('%s', 'now'));
/* End USER */


/* INSERT: LOT DATA
	lotId				INTEGER
	lotName				TEXT
	lotType				INTEGER
	fullness			INTEGER
	location			TEXT
        
    PRIMARY KEY (lotId)

    Notes
    -   lotId is auto-incremented in SQLite, and does not need to be included in the insert statements. 
    -   fullness is being stored as a value between 0 and 100, representing the percentage full that a lot is.
    -   lotType = 1 represents a 'General Parking Lot', and lotType = 2 represents a 'Staff Parking Lot'. 
*/
INSERT INTO lot (lotName, lotType, fullness, location) VALUES ('Lot A', 1, 0, "Trades Building General Parking");
INSERT INTO lot (lotName, lotType, fullness, location) VALUES ('Lot B', 1, 0, "Gymnasium General Parking");
INSERT INTO lot (lotName, lotType, fullness, location) VALUES ('Lot C', 1, 0, "Upper Campus General Parking");
INSERT INTO lot (lotName, lotType, fullness, location) VALUES ('Lot D', 2, 0, "Cafeteria Staff Parking");
INSERT INTO lot (lotName, lotType, fullness, location) VALUES ('Lot E', 2, 0, "Library Staff Parking");
/* End LOT */ 


/* INSERT: SESSION DATA
	sessionId			INTEGER
	lotId				INTEGER
	userId				INTEGER
	startTime			INTEGER NOT NULL
	endTime				INTEGER NOT NULL

    FOREIGN KEY (lotId) REFERENCES lot(lotId)
	FOREIGN KEY (userId) REFERENCES user(userId)
	PRIMARY KEY (sessionId)

    Notes
    -   sessionId is auto-incremented in SQLite, and does not need to be included in the insert statements. 
    -   lotId must be present in the lot table for an availability record to be inserted with it. (Foreign key dependency).
    -   userId must be present in the lot table for an availability record to be inserted with it. (Foreign key dependency).
    -   fullness is being stored as a value between 0 and 100, representing the percentage full that a lot is.
    -   startTime and endTime stored as Unix Epoch time format, as time (seconds) elapsed since January 1, 1970, 00:00:00 UTC. 
        It can be converted to a formatted datetime string with a query like
        SELECT strftime('%Y-%m-%d %H:%M:%S', startTime) AS formattedDate FROM user;
*/

/* MONDAY */
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 1, strftime('%s', DATE('2023-01-02', '+0 day') || TIME('12:00:00')), strftime('%s', DATE('2023-01-02', '+0 day') || TIME('13:00:00')));
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 6, strftime('%s', DATE('2023-01-09', '+0 day') || TIME('10:30:00')), strftime('%s', DATE('2023-01-09', '+0 day') || TIME('11:30:00')));
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 2, strftime('%s', DATE('2023-01-16', '+0 day') || TIME('08:45:00')), strftime('%s', DATE('2023-01-16', '+0 day') || TIME('09:45:00')));
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 3, strftime('%s', DATE('2023-01-23', '+0 day') || TIME('10:15:00')), strftime('%s', DATE('2023-01-23', '+0 day') || TIME('11:15:00')));
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 8, strftime('%s', DATE('2023-01-30', '+0 day') || TIME('14:30:00')), strftime('%s', DATE('2023-01-30', '+0 day') || TIME('15:30:00')));

/* TUESDAY */
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 1, strftime('%s', DATE('2023-01-02', '+1 day') || TIME('12:00:00')), strftime('%s', DATE('2023-01-02', '+1 day') || TIME('13:00:00')));
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 6, strftime('%s', DATE('2023-01-09', '+1 day') || TIME('10:30:00')), strftime('%s', DATE('2023-01-09', '+1 day') || TIME('11:30:00')));
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 2, strftime('%s', DATE('2023-01-16', '+1 day') || TIME('08:45:00')), strftime('%s', DATE('2023-01-16', '+1 day') || TIME('09:45:00')));
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 3, strftime('%s', DATE('2023-01-23', '+1 day') || TIME('10:15:00')), strftime('%s', DATE('2023-01-23', '+1 day') || TIME('11:15:00')));
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 8, strftime('%s', DATE('2023-01-30', '+1 day') || TIME('14:30:00')), strftime('%s', DATE('2023-01-30', '+1 day') || TIME('15:30:00')));

/* WEDNESDAY */
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 1, strftime('%s', DATE('2023-01-02', '+2 day') || TIME('12:00:00')), strftime('%s', DATE('2023-01-02', '+2 day') || TIME('13:00:00')));
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 6, strftime('%s', DATE('2023-01-09', '+2 day') || TIME('10:30:00')), strftime('%s', DATE('2023-01-09', '+2 day') || TIME('11:30:00')));
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 2, strftime('%s', DATE('2023-01-16', '+2 day') || TIME('08:45:00')), strftime('%s', DATE('2023-01-16', '+2 day') || TIME('09:45:00')));
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 3, strftime('%s', DATE('2023-01-23', '+2 day') || TIME('10:15:00')), strftime('%s', DATE('2023-01-23', '+2 day') || TIME('11:15:00')));
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 8, strftime('%s', DATE('2023-01-30', '+2 day') || TIME('14:30:00')), strftime('%s', DATE('2023-01-30', '+2 day') || TIME('15:30:00')));

/* THURSDAY */
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 1, strftime('%s', DATE('2023-01-02', '+3 day') || TIME('12:00:00')), strftime('%s', DATE('2023-01-02', '+3 day') || TIME('13:00:00')));
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 6, strftime('%s', DATE('2023-01-09', '+3 day') || TIME('10:30:00')), strftime('%s', DATE('2023-01-09', '+3 day') || TIME('11:30:00')));
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 2, strftime('%s', DATE('2023-01-16', '+3 day') || TIME('08:45:00')), strftime('%s', DATE('2023-01-16', '+3 day') || TIME('09:45:00')));
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 3, strftime('%s', DATE('2023-01-23', '+3 day') || TIME('10:15:00')), strftime('%s', DATE('2023-01-23', '+3 day') || TIME('11:15:00')));
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 8, strftime('%s', DATE('2023-01-30', '+3 day') || TIME('14:30:00')), strftime('%s', DATE('2023-01-30', '+3 day') || TIME('15:30:00')));

/* FRIDAY */
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 1, strftime('%s', DATE('2023-01-02', '+4 day') || TIME('12:00:00')), strftime('%s', DATE('2023-01-02', '+4 day') || TIME('13:00:00')));
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 6, strftime('%s', DATE('2023-01-09', '+4 day') || TIME('10:30:00')), strftime('%s', DATE('2023-01-09', '+4 day') || TIME('11:30:00')));
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 2, strftime('%s', DATE('2023-01-16', '+4 day') || TIME('08:45:00')), strftime('%s', DATE('2023-01-16', '+4 day') || TIME('09:45:00')));
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 3, strftime('%s', DATE('2023-01-23', '+4 day') || TIME('10:15:00')), strftime('%s', DATE('2023-01-23', '+4 day') || TIME('11:15:00')));
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 8, strftime('%s', DATE('2023-01-30', '+4 day') || TIME('14:30:00')), strftime('%s', DATE('2023-01-30', '+4 day') || TIME('15:30:00')));

/* SATURDAY */
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 1, strftime('%s', DATE('2023-01-02', '+5 day') || TIME('12:00:00')), strftime('%s', DATE('2023-01-02', '+5 day') || TIME('13:00:00')));
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 6, strftime('%s', DATE('2023-01-09', '+5 day') || TIME('10:30:00')), strftime('%s', DATE('2023-01-09', '+5 day') || TIME('11:30:00')));
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 2, strftime('%s', DATE('2023-01-16', '+5 day') || TIME('08:45:00')), strftime('%s', DATE('2023-01-16', '+5 day') || TIME('09:45:00')));
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 3, strftime('%s', DATE('2023-01-23', '+5 day') || TIME('10:15:00')), strftime('%s', DATE('2023-01-23', '+5 day') || TIME('11:15:00')));
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 8, strftime('%s', DATE('2023-01-30', '+5 day') || TIME('14:30:00')), strftime('%s', DATE('2023-01-30', '+5 day') || TIME('15:30:00')));

/* SUNDAY */
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 1, strftime('%s', DATE('2023-01-02', '+6 day') || TIME('12:00:00')), strftime('%s', DATE('2023-01-02', '+6 day') || TIME('13:00:00')));
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 6, strftime('%s', DATE('2023-01-09', '+6 day') || TIME('10:30:00')), strftime('%s', DATE('2023-01-09', '+6 day') || TIME('11:30:00')));
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 2, strftime('%s', DATE('2023-01-16', '+6 day') || TIME('08:45:00')), strftime('%s', DATE('2023-01-16', '+6 day') || TIME('09:45:00')));
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 3, strftime('%s', DATE('2023-01-23', '+6 day') || TIME('10:15:00')), strftime('%s', DATE('2023-01-23', '+6 day') || TIME('11:15:00')));
INSERT INTO session (lotId, userId, startTime, endTime) VALUES (1, 8, strftime('%s', DATE('2023-01-30', '+6 day') || TIME('14:30:00')), strftime('%s', DATE('2023-01-30', '+6 day') || TIME('15:30:00')));

/* End SESSION */


/* INSERT: AVAILABILITY DATA
	lotId				INTEGER
	date				INTEGER NOT NULL
	fullness			INTEGER NOT NULL

    FOREIGN KEY (lotId) REFERENCES lot(lotId)
	PRIMARY KEY (lotId, date)

    Notes
    -   lotId must be present in the lot table for an availability record to be inserted with it. (Foreign key dependency).
    -   fullness is being stored as a value between 0 and 100, representing the percentage full that a lot is.
    -   date stored as Unix Epoch time format, as time (seconds) elapsed since January 1, 1970, 00:00:00 UTC. 
        It can be converted to a formatted datetime string with a query like
        SELECT strftime('%Y-%m-%d %H:%M:%S', date) AS formattedDate FROM user;
    -   Test dates only begin on January 02, 2023, and end on March 20, 2023. Additionally, the times exist only between 6am-6pm.
        So, data exists for every day between Jan 01, 2023 - Mar 20, 2023, at times betwen 6am-6pm.
        The times are separated by day of week and by time to simulate what the availability might actually be like for that given day and time.
        Each time slot (ie. Mondays between 6-7am) has 12 availability records, one record per week for that
        day, between January 02, 2023 and March 20, 2023.
        Additionally, the fullness is randomized between certain values that would be probable for that time of day, 
        with 20% jumps in percentage (ie 6-7am approx 0-20% full, while 10-11am approx 80-100% full).
*/

/*
Temporary placeholder values. Want to be able to have a constant, ie fullness6to7, where the value of
it can be customized in one spot rather than in every insert statement for that time.
This distribution effectively forms a bell curve.
#6to7fullness       = ABS(RANDOM())%21 + 00, between 0-20% full
#7to8fullness       = ABS(RANDOM())%21 + 20, between 20-40% full
#8to9fullness       = ABS(RANDOM())%21 + 40, between 40-60% full
#9to10fullness      = ABS(RANDOM())%21 + 60, between 60-80% full
#10to11fullness     = ABS(RANDOM())%21 + 80, between 80-100% full
#11to12fullness     = ABS(RANDOM())%21 + 80, between 80-100% full
#12to13fullness     = ABS(RANDOM())%21 + 80, between 80-100% full
#13to14fullness     = ABS(RANDOM())%21 + 80, between 80-100% full
#14to15fullness     = ABS(RANDOM())%21 + 60, between 60-80% full
#15to16fullness     = ABS(RANDOM())%21 + 40, between 40-60% full
#16to17fullness     = ABS(RANDOM())%21 + 20, between 20-40% full
#17to18fullness     = ABS(RANDOM())%21 + 00, between 0-20% full
*/

/* LOT A (lotId = 1) */
/* MONDAY */
-- 6-7am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+0 day') || TIME('06:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+0 day') || TIME('06:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+0 day') || TIME('06:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+0 day') || TIME('06:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+0 day') || TIME('06:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+0 day') || TIME('06:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+0 day') || TIME('06:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+0 day') || TIME('06:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+0 day') || TIME('06:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+0 day') || TIME('06:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+0 day') || TIME('06:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+0 day') || TIME('06:40:00')), ABS(RANDOM())%21 + 00);
-- 7-8am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+0 day') || TIME('07:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+0 day') || TIME('07:15:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+0 day') || TIME('07:45:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+0 day') || TIME('07:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+0 day') || TIME('07:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+0 day') || TIME('07:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+0 day') || TIME('07:45:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+0 day') || TIME('07:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+0 day') || TIME('07:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+0 day') || TIME('07:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+0 day') || TIME('07:15:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+0 day') || TIME('07:45:00')), ABS(RANDOM())%21 + 20);
-- 8-9am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+0 day') || TIME('08:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+0 day') || TIME('08:15:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+0 day') || TIME('08:45:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+0 day') || TIME('08:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+0 day') || TIME('08:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+0 day') || TIME('08:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+0 day') || TIME('08:45:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+0 day') || TIME('08:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+0 day') || TIME('08:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+0 day') || TIME('08:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+0 day') || TIME('08:15:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+0 day') || TIME('08:45:00')), ABS(RANDOM())%21 + 40);
-- 9-10am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+0 day') || TIME('09:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+0 day') || TIME('09:15:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+0 day') || TIME('09:45:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+0 day') || TIME('09:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+0 day') || TIME('09:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+0 day') || TIME('09:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+0 day') || TIME('09:45:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+0 day') || TIME('09:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+0 day') || TIME('09:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+0 day') || TIME('09:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+0 day') || TIME('09:15:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+0 day') || TIME('09:45:00')), ABS(RANDOM())%21 + 60);
-- 10-11am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+0 day') || TIME('10:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+0 day') || TIME('10:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+0 day') || TIME('10:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+0 day') || TIME('10:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+0 day') || TIME('10:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+0 day') || TIME('10:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+0 day') || TIME('10:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+0 day') || TIME('10:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+0 day') || TIME('10:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+0 day') || TIME('10:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+0 day') || TIME('10:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+0 day') || TIME('10:45:00')), ABS(RANDOM())%21 + 80);
-- 11am-12pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+0 day') || TIME('11:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+0 day') || TIME('11:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+0 day') || TIME('11:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+0 day') || TIME('11:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+0 day') || TIME('11:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+0 day') || TIME('11:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+0 day') || TIME('11:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+0 day') || TIME('11:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+0 day') || TIME('11:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+0 day') || TIME('11:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+0 day') || TIME('11:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+0 day') || TIME('11:45:00')), ABS(RANDOM())%21 + 80);
-- 12-1pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+0 day') || TIME('12:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+0 day') || TIME('12:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+0 day') || TIME('12:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+0 day') || TIME('12:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+0 day') || TIME('12:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+0 day') || TIME('12:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+0 day') || TIME('12:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+0 day') || TIME('12:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+0 day') || TIME('12:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+0 day') || TIME('12:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+0 day') || TIME('12:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+0 day') || TIME('12:45:00')), ABS(RANDOM())%21 + 80);
-- 1-2pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+0 day') || TIME('13:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+0 day') || TIME('13:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+0 day') || TIME('13:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+0 day') || TIME('13:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+0 day') || TIME('13:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+0 day') || TIME('13:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+0 day') || TIME('13:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+0 day') || TIME('13:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+0 day') || TIME('13:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+0 day') || TIME('13:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+0 day') || TIME('13:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+0 day') || TIME('13:45:00')), ABS(RANDOM())%21 + 80);
-- 2-3pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+0 day') || TIME('14:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+0 day') || TIME('14:15:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+0 day') || TIME('14:45:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+0 day') || TIME('14:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+0 day') || TIME('14:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+0 day') || TIME('14:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+0 day') || TIME('14:45:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+0 day') || TIME('14:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+0 day') || TIME('14:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+0 day') || TIME('14:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+0 day') || TIME('14:15:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+0 day') || TIME('14:45:00')), ABS(RANDOM())%21 + 60);
-- 3-4pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+0 day') || TIME('15:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+0 day') || TIME('15:15:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+0 day') || TIME('15:45:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+0 day') || TIME('15:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+0 day') || TIME('15:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+0 day') || TIME('15:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+0 day') || TIME('15:45:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+0 day') || TIME('15:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+0 day') || TIME('15:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+0 day') || TIME('15:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+0 day') || TIME('15:15:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+0 day') || TIME('15:45:00')), ABS(RANDOM())%21 + 40);
-- 4-5pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+0 day') || TIME('16:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+0 day') || TIME('16:15:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+0 day') || TIME('16:45:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+0 day') || TIME('16:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+0 day') || TIME('16:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+0 day') || TIME('16:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+0 day') || TIME('16:45:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+0 day') || TIME('16:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+0 day') || TIME('16:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+0 day') || TIME('16:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+0 day') || TIME('16:15:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+0 day') || TIME('16:45:00')), ABS(RANDOM())%21 + 20);
-- 5-6pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+0 day') || TIME('17:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+0 day') || TIME('17:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+0 day') || TIME('17:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+0 day') || TIME('17:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+0 day') || TIME('17:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+0 day') || TIME('17:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+0 day') || TIME('17:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+0 day') || TIME('17:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+0 day') || TIME('17:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+0 day') || TIME('17:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+0 day') || TIME('17:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+0 day') || TIME('17:45:00')), ABS(RANDOM())%21 + 00);

/* TUESDAY */
-- 6-7am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+1 day') || TIME('06:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+1 day') || TIME('06:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+1 day') || TIME('06:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+1 day') || TIME('06:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+1 day') || TIME('06:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+1 day') || TIME('06:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+1 day') || TIME('06:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+1 day') || TIME('06:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+1 day') || TIME('06:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+1 day') || TIME('06:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+1 day') || TIME('06:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+1 day') || TIME('06:40:00')), ABS(RANDOM())%21 + 00);
-- 7-8am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+1 day') || TIME('07:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+1 day') || TIME('07:15:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+1 day') || TIME('07:45:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+1 day') || TIME('07:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+1 day') || TIME('07:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+1 day') || TIME('07:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+1 day') || TIME('07:45:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+1 day') || TIME('07:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+1 day') || TIME('07:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+1 day') || TIME('07:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+1 day') || TIME('07:15:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+1 day') || TIME('07:45:00')), ABS(RANDOM())%21 + 20);
-- 8-9am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+1 day') || TIME('08:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+1 day') || TIME('08:15:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+1 day') || TIME('08:45:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+1 day') || TIME('08:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+1 day') || TIME('08:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+1 day') || TIME('08:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+1 day') || TIME('08:45:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+1 day') || TIME('08:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+1 day') || TIME('08:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+1 day') || TIME('08:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+1 day') || TIME('08:15:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+1 day') || TIME('08:45:00')), ABS(RANDOM())%21 + 40);
-- 9-10am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+1 day') || TIME('09:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+1 day') || TIME('09:15:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+1 day') || TIME('09:45:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+1 day') || TIME('09:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+1 day') || TIME('09:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+1 day') || TIME('09:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+1 day') || TIME('09:45:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+1 day') || TIME('09:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+1 day') || TIME('09:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+1 day') || TIME('09:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+1 day') || TIME('09:15:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+1 day') || TIME('09:45:00')), ABS(RANDOM())%21 + 60);
-- 10-11am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+1 day') || TIME('10:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+1 day') || TIME('10:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+1 day') || TIME('10:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+1 day') || TIME('10:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+1 day') || TIME('10:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+1 day') || TIME('10:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+1 day') || TIME('10:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+1 day') || TIME('10:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+1 day') || TIME('10:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+1 day') || TIME('10:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+1 day') || TIME('10:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+1 day') || TIME('10:45:00')), ABS(RANDOM())%21 + 80);
-- 11am-12pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+1 day') || TIME('11:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+1 day') || TIME('11:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+1 day') || TIME('11:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+1 day') || TIME('11:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+1 day') || TIME('11:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+1 day') || TIME('11:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+1 day') || TIME('11:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+1 day') || TIME('11:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+1 day') || TIME('11:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+1 day') || TIME('11:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+1 day') || TIME('11:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+1 day') || TIME('11:45:00')), ABS(RANDOM())%21 + 80);
-- 12-1pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+1 day') || TIME('12:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+1 day') || TIME('12:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+1 day') || TIME('12:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+1 day') || TIME('12:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+1 day') || TIME('12:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+1 day') || TIME('12:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+1 day') || TIME('12:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+1 day') || TIME('12:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+1 day') || TIME('12:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+1 day') || TIME('12:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+1 day') || TIME('12:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+1 day') || TIME('12:45:00')), ABS(RANDOM())%21 + 80);
-- 1-2pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+1 day') || TIME('13:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+1 day') || TIME('13:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+1 day') || TIME('13:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+1 day') || TIME('13:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+1 day') || TIME('13:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+1 day') || TIME('13:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+1 day') || TIME('13:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+1 day') || TIME('13:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+1 day') || TIME('13:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+1 day') || TIME('13:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+1 day') || TIME('13:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+1 day') || TIME('13:45:00')), ABS(RANDOM())%21 + 80);
-- 2-3pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+1 day') || TIME('14:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+1 day') || TIME('14:15:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+1 day') || TIME('14:45:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+1 day') || TIME('14:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+1 day') || TIME('14:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+1 day') || TIME('14:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+1 day') || TIME('14:45:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+1 day') || TIME('14:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+1 day') || TIME('14:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+1 day') || TIME('14:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+1 day') || TIME('14:15:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+1 day') || TIME('14:45:00')), ABS(RANDOM())%21 + 60);
-- 3-4pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+1 day') || TIME('15:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+1 day') || TIME('15:15:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+1 day') || TIME('15:45:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+1 day') || TIME('15:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+1 day') || TIME('15:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+1 day') || TIME('15:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+1 day') || TIME('15:45:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+1 day') || TIME('15:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+1 day') || TIME('15:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+1 day') || TIME('15:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+1 day') || TIME('15:15:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+1 day') || TIME('15:45:00')), ABS(RANDOM())%21 + 40);
-- 4-5pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+1 day') || TIME('16:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+1 day') || TIME('16:15:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+1 day') || TIME('16:45:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+1 day') || TIME('16:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+1 day') || TIME('16:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+1 day') || TIME('16:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+1 day') || TIME('16:45:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+1 day') || TIME('16:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+1 day') || TIME('16:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+1 day') || TIME('16:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+1 day') || TIME('16:15:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+1 day') || TIME('16:45:00')), ABS(RANDOM())%21 + 20);
-- 5-6pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+1 day') || TIME('17:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+1 day') || TIME('17:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+1 day') || TIME('17:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+1 day') || TIME('17:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+1 day') || TIME('17:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+1 day') || TIME('17:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+1 day') || TIME('17:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+1 day') || TIME('17:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+1 day') || TIME('17:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+1 day') || TIME('17:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+1 day') || TIME('17:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+1 day') || TIME('17:45:00')), ABS(RANDOM())%21 + 00);

/* WEDNESDAY */
-- 6-7am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+2 day') || TIME('06:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+2 day') || TIME('06:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+2 day') || TIME('06:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+2 day') || TIME('06:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+2 day') || TIME('06:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+2 day') || TIME('06:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+2 day') || TIME('06:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+2 day') || TIME('06:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+2 day') || TIME('06:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+2 day') || TIME('06:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+2 day') || TIME('06:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+2 day') || TIME('06:40:00')), ABS(RANDOM())%21 + 00);
-- 7-8am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+2 day') || TIME('07:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+2 day') || TIME('07:15:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+2 day') || TIME('07:45:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+2 day') || TIME('07:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+2 day') || TIME('07:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+2 day') || TIME('07:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+2 day') || TIME('07:45:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+2 day') || TIME('07:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+2 day') || TIME('07:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+2 day') || TIME('07:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+2 day') || TIME('07:15:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+2 day') || TIME('07:45:00')), ABS(RANDOM())%21 + 20);
-- 8-9am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+2 day') || TIME('08:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+2 day') || TIME('08:15:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+2 day') || TIME('08:45:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+2 day') || TIME('08:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+2 day') || TIME('08:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+2 day') || TIME('08:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+2 day') || TIME('08:45:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+2 day') || TIME('08:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+2 day') || TIME('08:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+2 day') || TIME('08:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+2 day') || TIME('08:15:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+2 day') || TIME('08:45:00')), ABS(RANDOM())%21 + 40);
-- 9-10am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+2 day') || TIME('09:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+2 day') || TIME('09:15:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+2 day') || TIME('09:45:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+2 day') || TIME('09:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+2 day') || TIME('09:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+2 day') || TIME('09:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+2 day') || TIME('09:45:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+2 day') || TIME('09:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+2 day') || TIME('09:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+2 day') || TIME('09:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+2 day') || TIME('09:15:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+2 day') || TIME('09:45:00')), ABS(RANDOM())%21 + 60);
-- 10-11am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+2 day') || TIME('10:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+2 day') || TIME('10:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+2 day') || TIME('10:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+2 day') || TIME('10:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+2 day') || TIME('10:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+2 day') || TIME('10:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+2 day') || TIME('10:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+2 day') || TIME('10:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+2 day') || TIME('10:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+2 day') || TIME('10:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+2 day') || TIME('10:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+2 day') || TIME('10:45:00')), ABS(RANDOM())%21 + 80);
-- 11am-12pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+2 day') || TIME('11:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+2 day') || TIME('11:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+2 day') || TIME('11:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+2 day') || TIME('11:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+2 day') || TIME('11:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+2 day') || TIME('11:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+2 day') || TIME('11:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+2 day') || TIME('11:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+2 day') || TIME('11:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+2 day') || TIME('11:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+2 day') || TIME('11:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+2 day') || TIME('11:45:00')), ABS(RANDOM())%21 + 80);
-- 12-1pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+2 day') || TIME('12:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+2 day') || TIME('12:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+2 day') || TIME('12:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+2 day') || TIME('12:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+2 day') || TIME('12:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+2 day') || TIME('12:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+2 day') || TIME('12:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+2 day') || TIME('12:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+2 day') || TIME('12:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+2 day') || TIME('12:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+2 day') || TIME('12:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+2 day') || TIME('12:45:00')), ABS(RANDOM())%21 + 80);
-- 1-2pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+2 day') || TIME('13:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+2 day') || TIME('13:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+2 day') || TIME('13:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+2 day') || TIME('13:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+2 day') || TIME('13:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+2 day') || TIME('13:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+2 day') || TIME('13:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+2 day') || TIME('13:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+2 day') || TIME('13:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+2 day') || TIME('13:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+2 day') || TIME('13:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+2 day') || TIME('13:45:00')), ABS(RANDOM())%21 + 80);
-- 2-3pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+2 day') || TIME('14:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+2 day') || TIME('14:15:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+2 day') || TIME('14:45:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+2 day') || TIME('14:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+2 day') || TIME('14:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+2 day') || TIME('14:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+2 day') || TIME('14:45:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+2 day') || TIME('14:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+2 day') || TIME('14:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+2 day') || TIME('14:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+2 day') || TIME('14:15:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+2 day') || TIME('14:45:00')), ABS(RANDOM())%21 + 60);
-- 3-4pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+2 day') || TIME('15:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+2 day') || TIME('15:15:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+2 day') || TIME('15:45:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+2 day') || TIME('15:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+2 day') || TIME('15:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+2 day') || TIME('15:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+2 day') || TIME('15:45:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+2 day') || TIME('15:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+2 day') || TIME('15:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+2 day') || TIME('15:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+2 day') || TIME('15:15:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+2 day') || TIME('15:45:00')), ABS(RANDOM())%21 + 40);
-- 4-5pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+2 day') || TIME('16:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+2 day') || TIME('16:15:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+2 day') || TIME('16:45:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+2 day') || TIME('16:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+2 day') || TIME('16:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+2 day') || TIME('16:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+2 day') || TIME('16:45:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+2 day') || TIME('16:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+2 day') || TIME('16:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+2 day') || TIME('16:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+2 day') || TIME('16:15:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+2 day') || TIME('16:45:00')), ABS(RANDOM())%21 + 20);
-- 5-6pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+2 day') || TIME('17:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+2 day') || TIME('17:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+2 day') || TIME('17:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+2 day') || TIME('17:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+2 day') || TIME('17:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+2 day') || TIME('17:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+2 day') || TIME('17:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+2 day') || TIME('17:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+2 day') || TIME('17:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+2 day') || TIME('17:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+2 day') || TIME('17:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+2 day') || TIME('17:45:00')), ABS(RANDOM())%21 + 00);

/* THURSDAY */
-- 6-7am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+3 day') || TIME('06:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+3 day') || TIME('06:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+3 day') || TIME('06:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+3 day') || TIME('06:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+3 day') || TIME('06:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+3 day') || TIME('06:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+3 day') || TIME('06:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+3 day') || TIME('06:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+3 day') || TIME('06:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+3 day') || TIME('06:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+3 day') || TIME('06:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+3 day') || TIME('06:40:00')), ABS(RANDOM())%21 + 00);
-- 7-8am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+3 day') || TIME('07:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+3 day') || TIME('07:15:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+3 day') || TIME('07:45:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+3 day') || TIME('07:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+3 day') || TIME('07:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+3 day') || TIME('07:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+3 day') || TIME('07:45:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+3 day') || TIME('07:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+3 day') || TIME('07:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+3 day') || TIME('07:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+3 day') || TIME('07:15:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+3 day') || TIME('07:45:00')), ABS(RANDOM())%21 + 20);
-- 8-9am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+3 day') || TIME('08:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+3 day') || TIME('08:15:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+3 day') || TIME('08:45:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+3 day') || TIME('08:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+3 day') || TIME('08:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+3 day') || TIME('08:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+3 day') || TIME('08:45:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+3 day') || TIME('08:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+3 day') || TIME('08:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+3 day') || TIME('08:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+3 day') || TIME('08:15:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+3 day') || TIME('08:45:00')), ABS(RANDOM())%21 + 40);
-- 9-10am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+3 day') || TIME('09:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+3 day') || TIME('09:15:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+3 day') || TIME('09:45:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+3 day') || TIME('09:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+3 day') || TIME('09:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+3 day') || TIME('09:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+3 day') || TIME('09:45:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+3 day') || TIME('09:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+3 day') || TIME('09:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+3 day') || TIME('09:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+3 day') || TIME('09:15:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+3 day') || TIME('09:45:00')), ABS(RANDOM())%21 + 60);
-- 10-11am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+3 day') || TIME('10:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+3 day') || TIME('10:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+3 day') || TIME('10:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+3 day') || TIME('10:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+3 day') || TIME('10:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+3 day') || TIME('10:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+3 day') || TIME('10:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+3 day') || TIME('10:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+3 day') || TIME('10:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+3 day') || TIME('10:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+3 day') || TIME('10:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+3 day') || TIME('10:45:00')), ABS(RANDOM())%21 + 80);
-- 11am-12pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+3 day') || TIME('11:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+3 day') || TIME('11:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+3 day') || TIME('11:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+3 day') || TIME('11:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+3 day') || TIME('11:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+3 day') || TIME('11:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+3 day') || TIME('11:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+3 day') || TIME('11:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+3 day') || TIME('11:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+3 day') || TIME('11:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+3 day') || TIME('11:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+3 day') || TIME('11:45:00')), ABS(RANDOM())%21 + 80);
-- 12-1pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+3 day') || TIME('12:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+3 day') || TIME('12:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+3 day') || TIME('12:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+3 day') || TIME('12:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+3 day') || TIME('12:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+3 day') || TIME('12:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+3 day') || TIME('12:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+3 day') || TIME('12:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+3 day') || TIME('12:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+3 day') || TIME('12:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+3 day') || TIME('12:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+3 day') || TIME('12:45:00')), ABS(RANDOM())%21 + 80);
-- 1-2pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+3 day') || TIME('13:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+3 day') || TIME('13:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+3 day') || TIME('13:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+3 day') || TIME('13:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+3 day') || TIME('13:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+3 day') || TIME('13:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+3 day') || TIME('13:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+3 day') || TIME('13:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+3 day') || TIME('13:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+3 day') || TIME('13:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+3 day') || TIME('13:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+3 day') || TIME('13:45:00')), ABS(RANDOM())%21 + 80);
-- 2-3pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+3 day') || TIME('14:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+3 day') || TIME('14:15:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+3 day') || TIME('14:45:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+3 day') || TIME('14:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+3 day') || TIME('14:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+3 day') || TIME('14:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+3 day') || TIME('14:45:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+3 day') || TIME('14:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+3 day') || TIME('14:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+3 day') || TIME('14:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+3 day') || TIME('14:15:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+3 day') || TIME('14:45:00')), ABS(RANDOM())%21 + 60);
-- 3-4pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+3 day') || TIME('15:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+3 day') || TIME('15:15:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+3 day') || TIME('15:45:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+3 day') || TIME('15:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+3 day') || TIME('15:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+3 day') || TIME('15:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+3 day') || TIME('15:45:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+3 day') || TIME('15:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+3 day') || TIME('15:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+3 day') || TIME('15:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+3 day') || TIME('15:15:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+3 day') || TIME('15:45:00')), ABS(RANDOM())%21 + 40);
-- 4-5pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+3 day') || TIME('16:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+3 day') || TIME('16:15:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+3 day') || TIME('16:45:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+3 day') || TIME('16:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+3 day') || TIME('16:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+3 day') || TIME('16:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+3 day') || TIME('16:45:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+3 day') || TIME('16:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+3 day') || TIME('16:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+3 day') || TIME('16:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+3 day') || TIME('16:15:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+3 day') || TIME('16:45:00')), ABS(RANDOM())%21 + 20);
-- 5-6pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+3 day') || TIME('17:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+3 day') || TIME('17:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+3 day') || TIME('17:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+3 day') || TIME('17:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+3 day') || TIME('17:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+3 day') || TIME('17:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+3 day') || TIME('17:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+3 day') || TIME('17:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+3 day') || TIME('17:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+3 day') || TIME('17:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+3 day') || TIME('17:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+3 day') || TIME('17:45:00')), ABS(RANDOM())%21 + 00);

/* FRIDAY */
-- 6-7am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+4 day') || TIME('06:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+4 day') || TIME('06:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+4 day') || TIME('06:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+4 day') || TIME('06:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+4 day') || TIME('06:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+4 day') || TIME('06:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+4 day') || TIME('06:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+4 day') || TIME('06:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+4 day') || TIME('06:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+4 day') || TIME('06:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+4 day') || TIME('06:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+4 day') || TIME('06:40:00')), ABS(RANDOM())%21 + 00);
-- 7-8am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+4 day') || TIME('07:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+4 day') || TIME('07:15:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+4 day') || TIME('07:45:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+4 day') || TIME('07:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+4 day') || TIME('07:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+4 day') || TIME('07:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+4 day') || TIME('07:45:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+4 day') || TIME('07:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+4 day') || TIME('07:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+4 day') || TIME('07:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+4 day') || TIME('07:15:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+4 day') || TIME('07:45:00')), ABS(RANDOM())%21 + 20);
-- 8-9am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+4 day') || TIME('08:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+4 day') || TIME('08:15:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+4 day') || TIME('08:45:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+4 day') || TIME('08:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+4 day') || TIME('08:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+4 day') || TIME('08:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+4 day') || TIME('08:45:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+4 day') || TIME('08:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+4 day') || TIME('08:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+4 day') || TIME('08:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+4 day') || TIME('08:15:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+4 day') || TIME('08:45:00')), ABS(RANDOM())%21 + 40);
-- 9-10am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+4 day') || TIME('09:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+4 day') || TIME('09:15:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+4 day') || TIME('09:45:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+4 day') || TIME('09:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+4 day') || TIME('09:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+4 day') || TIME('09:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+4 day') || TIME('09:45:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+4 day') || TIME('09:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+4 day') || TIME('09:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+4 day') || TIME('09:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+4 day') || TIME('09:15:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+4 day') || TIME('09:45:00')), ABS(RANDOM())%21 + 60);
-- 10-11am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+4 day') || TIME('10:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+4 day') || TIME('10:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+4 day') || TIME('10:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+4 day') || TIME('10:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+4 day') || TIME('10:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+4 day') || TIME('10:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+4 day') || TIME('10:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+4 day') || TIME('10:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+4 day') || TIME('10:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+4 day') || TIME('10:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+4 day') || TIME('10:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+4 day') || TIME('10:45:00')), ABS(RANDOM())%21 + 80);
-- 11am-12pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+4 day') || TIME('11:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+4 day') || TIME('11:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+4 day') || TIME('11:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+4 day') || TIME('11:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+4 day') || TIME('11:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+4 day') || TIME('11:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+4 day') || TIME('11:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+4 day') || TIME('11:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+4 day') || TIME('11:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+4 day') || TIME('11:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+4 day') || TIME('11:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+4 day') || TIME('11:45:00')), ABS(RANDOM())%21 + 80);
-- 12-1pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+4 day') || TIME('12:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+4 day') || TIME('12:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+4 day') || TIME('12:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+4 day') || TIME('12:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+4 day') || TIME('12:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+4 day') || TIME('12:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+4 day') || TIME('12:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+4 day') || TIME('12:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+4 day') || TIME('12:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+4 day') || TIME('12:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+4 day') || TIME('12:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+4 day') || TIME('12:45:00')), ABS(RANDOM())%21 + 80);
-- 1-2pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+4 day') || TIME('13:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+4 day') || TIME('13:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+4 day') || TIME('13:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+4 day') || TIME('13:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+4 day') || TIME('13:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+4 day') || TIME('13:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+4 day') || TIME('13:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+4 day') || TIME('13:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+4 day') || TIME('13:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+4 day') || TIME('13:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+4 day') || TIME('13:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+4 day') || TIME('13:45:00')), ABS(RANDOM())%21 + 80);
-- 2-3pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+4 day') || TIME('14:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+4 day') || TIME('14:15:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+4 day') || TIME('14:45:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+4 day') || TIME('14:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+4 day') || TIME('14:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+4 day') || TIME('14:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+4 day') || TIME('14:45:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+4 day') || TIME('14:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+4 day') || TIME('14:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+4 day') || TIME('14:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+4 day') || TIME('14:15:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+4 day') || TIME('14:45:00')), ABS(RANDOM())%21 + 60);
-- 3-4pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+4 day') || TIME('15:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+4 day') || TIME('15:15:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+4 day') || TIME('15:45:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+4 day') || TIME('15:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+4 day') || TIME('15:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+4 day') || TIME('15:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+4 day') || TIME('15:45:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+4 day') || TIME('15:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+4 day') || TIME('15:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+4 day') || TIME('15:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+4 day') || TIME('15:15:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+4 day') || TIME('15:45:00')), ABS(RANDOM())%21 + 40);
-- 4-5pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+4 day') || TIME('16:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+4 day') || TIME('16:15:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+4 day') || TIME('16:45:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+4 day') || TIME('16:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+4 day') || TIME('16:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+4 day') || TIME('16:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+4 day') || TIME('16:45:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+4 day') || TIME('16:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+4 day') || TIME('16:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+4 day') || TIME('16:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+4 day') || TIME('16:15:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+4 day') || TIME('16:45:00')), ABS(RANDOM())%21 + 20);
-- 5-6pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+4 day') || TIME('17:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+4 day') || TIME('17:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+4 day') || TIME('17:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+4 day') || TIME('17:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+4 day') || TIME('17:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+4 day') || TIME('17:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+4 day') || TIME('17:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+4 day') || TIME('17:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+4 day') || TIME('17:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+4 day') || TIME('17:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+4 day') || TIME('17:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+4 day') || TIME('17:45:00')), ABS(RANDOM())%21 + 00);

/* SATURDAY */
-- 6-7am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+5 day') || TIME('06:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+5 day') || TIME('06:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+5 day') || TIME('06:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+5 day') || TIME('06:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+5 day') || TIME('06:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+5 day') || TIME('06:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+5 day') || TIME('06:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+5 day') || TIME('06:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+5 day') || TIME('06:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+5 day') || TIME('06:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+5 day') || TIME('06:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+5 day') || TIME('06:40:00')), ABS(RANDOM())%21 + 00);
-- 7-8am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+5 day') || TIME('07:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+5 day') || TIME('07:15:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+5 day') || TIME('07:45:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+5 day') || TIME('07:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+5 day') || TIME('07:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+5 day') || TIME('07:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+5 day') || TIME('07:45:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+5 day') || TIME('07:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+5 day') || TIME('07:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+5 day') || TIME('07:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+5 day') || TIME('07:15:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+5 day') || TIME('07:45:00')), ABS(RANDOM())%21 + 20);
-- 8-9am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+5 day') || TIME('08:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+5 day') || TIME('08:15:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+5 day') || TIME('08:45:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+5 day') || TIME('08:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+5 day') || TIME('08:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+5 day') || TIME('08:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+5 day') || TIME('08:45:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+5 day') || TIME('08:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+5 day') || TIME('08:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+5 day') || TIME('08:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+5 day') || TIME('08:15:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+5 day') || TIME('08:45:00')), ABS(RANDOM())%21 + 40);
-- 9-10am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+5 day') || TIME('09:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+5 day') || TIME('09:15:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+5 day') || TIME('09:45:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+5 day') || TIME('09:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+5 day') || TIME('09:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+5 day') || TIME('09:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+5 day') || TIME('09:45:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+5 day') || TIME('09:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+5 day') || TIME('09:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+5 day') || TIME('09:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+5 day') || TIME('09:15:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+5 day') || TIME('09:45:00')), ABS(RANDOM())%21 + 60);
-- 10-11am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+5 day') || TIME('10:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+5 day') || TIME('10:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+5 day') || TIME('10:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+5 day') || TIME('10:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+5 day') || TIME('10:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+5 day') || TIME('10:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+5 day') || TIME('10:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+5 day') || TIME('10:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+5 day') || TIME('10:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+5 day') || TIME('10:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+5 day') || TIME('10:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+5 day') || TIME('10:45:00')), ABS(RANDOM())%21 + 80);
-- 11am-12pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+5 day') || TIME('11:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+5 day') || TIME('11:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+5 day') || TIME('11:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+5 day') || TIME('11:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+5 day') || TIME('11:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+5 day') || TIME('11:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+5 day') || TIME('11:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+5 day') || TIME('11:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+5 day') || TIME('11:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+5 day') || TIME('11:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+5 day') || TIME('11:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+5 day') || TIME('11:45:00')), ABS(RANDOM())%21 + 80);
-- 12-1pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+5 day') || TIME('12:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+5 day') || TIME('12:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+5 day') || TIME('12:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+5 day') || TIME('12:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+5 day') || TIME('12:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+5 day') || TIME('12:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+5 day') || TIME('12:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+5 day') || TIME('12:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+5 day') || TIME('12:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+5 day') || TIME('12:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+5 day') || TIME('12:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+5 day') || TIME('12:45:00')), ABS(RANDOM())%21 + 80);
-- 1-2pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+5 day') || TIME('13:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+5 day') || TIME('13:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+5 day') || TIME('13:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+5 day') || TIME('13:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+5 day') || TIME('13:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+5 day') || TIME('13:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+5 day') || TIME('13:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+5 day') || TIME('13:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+5 day') || TIME('13:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+5 day') || TIME('13:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+5 day') || TIME('13:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+5 day') || TIME('13:45:00')), ABS(RANDOM())%21 + 80);
-- 2-3pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+5 day') || TIME('14:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+5 day') || TIME('14:15:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+5 day') || TIME('14:45:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+5 day') || TIME('14:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+5 day') || TIME('14:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+5 day') || TIME('14:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+5 day') || TIME('14:45:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+5 day') || TIME('14:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+5 day') || TIME('14:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+5 day') || TIME('14:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+5 day') || TIME('14:15:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+5 day') || TIME('14:45:00')), ABS(RANDOM())%21 + 60);
-- 3-4pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+5 day') || TIME('15:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+5 day') || TIME('15:15:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+5 day') || TIME('15:45:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+5 day') || TIME('15:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+5 day') || TIME('15:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+5 day') || TIME('15:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+5 day') || TIME('15:45:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+5 day') || TIME('15:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+5 day') || TIME('15:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+5 day') || TIME('15:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+5 day') || TIME('15:15:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+5 day') || TIME('15:45:00')), ABS(RANDOM())%21 + 40);
-- 4-5pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+5 day') || TIME('16:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+5 day') || TIME('16:15:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+5 day') || TIME('16:45:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+5 day') || TIME('16:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+5 day') || TIME('16:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+5 day') || TIME('16:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+5 day') || TIME('16:45:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+5 day') || TIME('16:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+5 day') || TIME('16:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+5 day') || TIME('16:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+5 day') || TIME('16:15:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+5 day') || TIME('16:45:00')), ABS(RANDOM())%21 + 20);
-- 5-6pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+5 day') || TIME('17:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+5 day') || TIME('17:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+5 day') || TIME('17:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+5 day') || TIME('17:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+5 day') || TIME('17:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+5 day') || TIME('17:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+5 day') || TIME('17:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+5 day') || TIME('17:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+5 day') || TIME('17:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+5 day') || TIME('17:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+5 day') || TIME('17:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+5 day') || TIME('17:45:00')), ABS(RANDOM())%21 + 00);

/* SUNDAY */
-- 6-7am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+6 day') || TIME('06:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+6 day') || TIME('06:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+6 day') || TIME('06:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+6 day') || TIME('06:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+6 day') || TIME('06:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+6 day') || TIME('06:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+6 day') || TIME('06:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+6 day') || TIME('06:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+6 day') || TIME('06:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+6 day') || TIME('06:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+6 day') || TIME('06:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+6 day') || TIME('06:40:00')), ABS(RANDOM())%21 + 00);
-- 7-8am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+6 day') || TIME('07:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+6 day') || TIME('07:15:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+6 day') || TIME('07:45:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+6 day') || TIME('07:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+6 day') || TIME('07:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+6 day') || TIME('07:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+6 day') || TIME('07:45:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+6 day') || TIME('07:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+6 day') || TIME('07:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+6 day') || TIME('07:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+6 day') || TIME('07:15:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+6 day') || TIME('07:45:00')), ABS(RANDOM())%21 + 20);
-- 8-9am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+6 day') || TIME('08:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+6 day') || TIME('08:15:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+6 day') || TIME('08:45:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+6 day') || TIME('08:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+6 day') || TIME('08:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+6 day') || TIME('08:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+6 day') || TIME('08:45:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+6 day') || TIME('08:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+6 day') || TIME('08:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+6 day') || TIME('08:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+6 day') || TIME('08:15:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+6 day') || TIME('08:45:00')), ABS(RANDOM())%21 + 40);
-- 9-10am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+6 day') || TIME('09:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+6 day') || TIME('09:15:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+6 day') || TIME('09:45:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+6 day') || TIME('09:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+6 day') || TIME('09:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+6 day') || TIME('09:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+6 day') || TIME('09:45:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+6 day') || TIME('09:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+6 day') || TIME('09:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+6 day') || TIME('09:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+6 day') || TIME('09:15:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+6 day') || TIME('09:45:00')), ABS(RANDOM())%21 + 60);
-- 10-11am
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+6 day') || TIME('10:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+6 day') || TIME('10:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+6 day') || TIME('10:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+6 day') || TIME('10:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+6 day') || TIME('10:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+6 day') || TIME('10:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+6 day') || TIME('10:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+6 day') || TIME('10:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+6 day') || TIME('10:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+6 day') || TIME('10:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+6 day') || TIME('10:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+6 day') || TIME('10:45:00')), ABS(RANDOM())%21 + 80);
-- 11am-12pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+6 day') || TIME('11:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+6 day') || TIME('11:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+6 day') || TIME('11:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+6 day') || TIME('11:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+6 day') || TIME('11:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+6 day') || TIME('11:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+6 day') || TIME('11:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+6 day') || TIME('11:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+6 day') || TIME('11:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+6 day') || TIME('11:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+6 day') || TIME('11:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+6 day') || TIME('11:45:00')), ABS(RANDOM())%21 + 80);
-- 12-1pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+6 day') || TIME('12:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+6 day') || TIME('12:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+6 day') || TIME('12:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+6 day') || TIME('12:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+6 day') || TIME('12:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+6 day') || TIME('12:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+6 day') || TIME('12:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+6 day') || TIME('12:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+6 day') || TIME('12:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+6 day') || TIME('12:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+6 day') || TIME('12:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+6 day') || TIME('12:45:00')), ABS(RANDOM())%21 + 80);
-- 1-2pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+6 day') || TIME('13:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+6 day') || TIME('13:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+6 day') || TIME('13:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+6 day') || TIME('13:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+6 day') || TIME('13:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+6 day') || TIME('13:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+6 day') || TIME('13:45:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+6 day') || TIME('13:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+6 day') || TIME('13:00:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+6 day') || TIME('13:30:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+6 day') || TIME('13:15:00')), ABS(RANDOM())%21 + 80);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+6 day') || TIME('13:45:00')), ABS(RANDOM())%21 + 80);
-- 2-3pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+6 day') || TIME('14:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+6 day') || TIME('14:15:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+6 day') || TIME('14:45:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+6 day') || TIME('14:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+6 day') || TIME('14:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+6 day') || TIME('14:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+6 day') || TIME('14:45:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+6 day') || TIME('14:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+6 day') || TIME('14:00:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+6 day') || TIME('14:30:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+6 day') || TIME('14:15:00')), ABS(RANDOM())%21 + 60);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+6 day') || TIME('14:45:00')), ABS(RANDOM())%21 + 60);
-- 3-4pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+6 day') || TIME('15:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+6 day') || TIME('15:15:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+6 day') || TIME('15:45:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+6 day') || TIME('15:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+6 day') || TIME('15:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+6 day') || TIME('15:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+6 day') || TIME('15:45:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+6 day') || TIME('15:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+6 day') || TIME('15:00:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+6 day') || TIME('15:30:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+6 day') || TIME('15:15:00')), ABS(RANDOM())%21 + 40);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+6 day') || TIME('15:45:00')), ABS(RANDOM())%21 + 40);
-- 4-5pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+6 day') || TIME('16:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+6 day') || TIME('16:15:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+6 day') || TIME('16:45:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+6 day') || TIME('16:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+6 day') || TIME('16:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+6 day') || TIME('16:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+6 day') || TIME('16:45:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+6 day') || TIME('16:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+6 day') || TIME('16:00:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+6 day') || TIME('16:30:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+6 day') || TIME('16:15:00')), ABS(RANDOM())%21 + 20);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+6 day') || TIME('16:45:00')), ABS(RANDOM())%21 + 20);
-- 5-6pm
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-02', '+6 day') || TIME('17:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-09', '+6 day') || TIME('17:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-16', '+6 day') || TIME('17:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-23', '+6 day') || TIME('17:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-01-30', '+6 day') || TIME('17:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-06', '+6 day') || TIME('17:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-13', '+6 day') || TIME('17:45:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-20', '+6 day') || TIME('17:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-02-27', '+6 day') || TIME('17:00:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-06', '+6 day') || TIME('17:30:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-13', '+6 day') || TIME('17:15:00')), ABS(RANDOM())%21 + 00);
INSERT INTO availability (lotId, date, fullness) VALUES (1, strftime('%s', DATE('2023-03-20', '+6 day') || TIME('17:45:00')), ABS(RANDOM())%21 + 00);
/* END LOT A */

/* LOT B (lotId = 2) */
/* MONDAY */
-- 6-7am
-- 7-8am
-- 8-9am
-- 9-10am
-- 10-11am
-- 11-12pm
-- 12-1pm
-- 1-2pm
-- 2-3pm
-- 3-4pm
-- 4-5pm
-- 5-6pm
/* TUESDAY */
-- 6-7am
-- 7-8am
-- 8-9am
-- 9-10am
-- 10-11am
-- 11-12pm
-- 12-1pm
-- 1-2pm
-- 2-3pm
-- 3-4pm
-- 4-5pm
-- 5-6pm
/* WEDNESDAY */
-- 6-7am
-- 7-8am
-- 8-9am
-- 9-10am
-- 10-11am
-- 11-12pm
-- 12-1pm
-- 1-2pm
-- 2-3pm
-- 3-4pm
-- 4-5pm
-- 5-6pm
/* THURSDAY */
-- 6-7am
-- 7-8am
-- 8-9am
-- 9-10am
-- 10-11am
-- 11-12pm
-- 12-1pm
-- 1-2pm
-- 2-3pm
-- 3-4pm
-- 4-5pm
-- 5-6pm
/* FRIDAY */
-- 6-7am
-- 7-8am
-- 8-9am
-- 9-10am
-- 10-11am
-- 11-12pm
-- 12-1pm
-- 1-2pm
-- 2-3pm
-- 3-4pm
-- 4-5pm
-- 5-6pm
/* SATURDAY */
-- 6-7am
-- 7-8am
-- 8-9am
-- 9-10am
-- 10-11am
-- 11-12pm
-- 12-1pm
-- 1-2pm
-- 2-3pm
-- 3-4pm
-- 4-5pm
-- 5-6pm
/* SUNDAY */
-- 6-7am
-- 7-8am
-- 8-9am
-- 9-10am
-- 10-11am
-- 11-12pm
-- 12-1pm
-- 1-2pm
-- 2-3pm
-- 3-4pm
-- 4-5pm
-- 5-6pm
/* END LOT B */

/* LOT C (lotId = 3) */
/* MONDAY */
-- 6-7am
-- 7-8am
-- 8-9am
-- 9-10am
-- 10-11am
-- 11-12pm
-- 12-1pm
-- 1-2pm
-- 2-3pm
-- 3-4pm
-- 4-5pm
-- 5-6pm
/* TUESDAY */
-- 6-7am
-- 7-8am
-- 8-9am
-- 9-10am
-- 10-11am
-- 11-12pm
-- 12-1pm
-- 1-2pm
-- 2-3pm
-- 3-4pm
-- 4-5pm
-- 5-6pm
/* WEDNESDAY */
-- 6-7am
-- 7-8am
-- 8-9am
-- 9-10am
-- 10-11am
-- 11-12pm
-- 12-1pm
-- 1-2pm
-- 2-3pm
-- 3-4pm
-- 4-5pm
-- 5-6pm
/* THURSDAY */
-- 6-7am
-- 7-8am
-- 8-9am
-- 9-10am
-- 10-11am
-- 11-12pm
-- 12-1pm
-- 1-2pm
-- 2-3pm
-- 3-4pm
-- 4-5pm
-- 5-6pm
/* FRIDAY */
-- 6-7am
-- 7-8am
-- 8-9am
-- 9-10am
-- 10-11am
-- 11-12pm
-- 12-1pm
-- 1-2pm
-- 2-3pm
-- 3-4pm
-- 4-5pm
-- 5-6pm
/* SATURDAY */
-- 6-7am
-- 7-8am
-- 8-9am
-- 9-10am
-- 10-11am
-- 11-12pm
-- 12-1pm
-- 1-2pm
-- 2-3pm
-- 3-4pm
-- 4-5pm
-- 5-6pm
/* SUNDAY */
-- 6-7am
-- 7-8am
-- 8-9am
-- 9-10am
-- 10-11am
-- 11-12pm
-- 12-1pm
-- 1-2pm
-- 2-3pm
-- 3-4pm
-- 4-5pm
-- 5-6pm
/* END LOT C */

/* LOT D (lotId = 4) */
/* MONDAY */
-- 6-7am
-- 7-8am
-- 8-9am
-- 9-10am
-- 10-11am
-- 11-12pm
-- 12-1pm
-- 1-2pm
-- 2-3pm
-- 3-4pm
-- 4-5pm
-- 5-6pm
/* TUESDAY */
-- 6-7am
-- 7-8am
-- 8-9am
-- 9-10am
-- 10-11am
-- 11-12pm
-- 12-1pm
-- 1-2pm
-- 2-3pm
-- 3-4pm
-- 4-5pm
-- 5-6pm
/* WEDNESDAY */
-- 6-7am
-- 7-8am
-- 8-9am
-- 9-10am
-- 10-11am
-- 11-12pm
-- 12-1pm
-- 1-2pm
-- 2-3pm
-- 3-4pm
-- 4-5pm
-- 5-6pm
/* THURSDAY */
-- 6-7am
-- 7-8am
-- 8-9am
-- 9-10am
-- 10-11am
-- 11-12pm
-- 12-1pm
-- 1-2pm
-- 2-3pm
-- 3-4pm
-- 4-5pm
-- 5-6pm
/* FRIDAY */
-- 6-7am
-- 7-8am
-- 8-9am
-- 9-10am
-- 10-11am
-- 11-12pm
-- 12-1pm
-- 1-2pm
-- 2-3pm
-- 3-4pm
-- 4-5pm
-- 5-6pm
/* SATURDAY */
-- 6-7am
-- 7-8am
-- 8-9am
-- 9-10am
-- 10-11am
-- 11-12pm
-- 12-1pm
-- 1-2pm
-- 2-3pm
-- 3-4pm
-- 4-5pm
-- 5-6pm
/* SUNDAY */
-- 6-7am
-- 7-8am
-- 8-9am
-- 9-10am
-- 10-11am
-- 11-12pm
-- 12-1pm
-- 1-2pm
-- 2-3pm
-- 3-4pm
-- 4-5pm
-- 5-6pm
/* END LOT D */

/* LOT E (lotId = 5) */
/* MONDAY */
-- 6-7am
-- 7-8am
-- 8-9am
-- 9-10am
-- 10-11am
-- 11-12pm
-- 12-1pm
-- 1-2pm
-- 2-3pm
-- 3-4pm
-- 4-5pm
-- 5-6pm
/* TUESDAY */
-- 6-7am
-- 7-8am
-- 8-9am
-- 9-10am
-- 10-11am
-- 11-12pm
-- 12-1pm
-- 1-2pm
-- 2-3pm
-- 3-4pm
-- 4-5pm
-- 5-6pm
/* WEDNESDAY */
-- 6-7am
-- 7-8am
-- 8-9am
-- 9-10am
-- 10-11am
-- 11-12pm
-- 12-1pm
-- 1-2pm
-- 2-3pm
-- 3-4pm
-- 4-5pm
-- 5-6pm
/* THURSDAY */
-- 6-7am
-- 7-8am
-- 8-9am
-- 9-10am
-- 10-11am
-- 11-12pm
-- 12-1pm
-- 1-2pm
-- 2-3pm
-- 3-4pm
-- 4-5pm
-- 5-6pm
/* FRIDAY */
-- 6-7am
-- 7-8am
-- 8-9am
-- 9-10am
-- 10-11am
-- 11-12pm
-- 12-1pm
-- 1-2pm
-- 2-3pm
-- 3-4pm
-- 4-5pm
-- 5-6pm
/* SATURDAY */
-- 6-7am
-- 7-8am
-- 8-9am
-- 9-10am
-- 10-11am
-- 11-12pm
-- 12-1pm
-- 1-2pm
-- 2-3pm
-- 3-4pm
-- 4-5pm
-- 5-6pm
/* SUNDAY */
-- 6-7am
-- 7-8am
-- 8-9am
-- 9-10am
-- 10-11am
-- 11-12pm
-- 12-1pm
-- 1-2pm
-- 2-3pm
-- 3-4pm
-- 4-5pm
-- 5-6pm
/* END LOT E */

/* End AVAILABILITY */