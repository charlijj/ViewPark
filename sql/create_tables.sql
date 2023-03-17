CREATE TABLE IF NOT EXISTS user(
	userId				INTEGER,
	userName 			TEXT NOT NULL,
	userType 			INTEGER,
	email				TEXT NOT NULL UNIQUE,
	password			TEXT NOT NULL,
	registrationDate	INTEGER,

	PRIMARY KEY (userId)
);

CREATE TABLE IF NOT EXISTS lot(
	lotId				INTEGER,
	lotName				TEXT,
	lotType				INTEGER,
	fullness			INTEGER,
	location			TEXT,

	PRIMARY KEY (lotId)
);

CREATE TABLE IF NOT EXISTS availability(
	lotId				INTEGER,
	date				INTEGER NOT NULL,
	fullness			INTEGER NOT NULL,

	FOREIGN KEY (lotId) REFERENCES lot(lotId),
	PRIMARY KEY (lotId, date)
);

CREATE TABLE IF NOT EXISTS session(
	sessionId			INTEGER,
	lotId				INTEGER,
	userId				INTEGER,
	startTime			INTEGER NOT NULL,
	endTime				INTEGER NOT NULL,

	FOREIGN KEY (lotId) REFERENCES lot(lotId),
	FOREIGN KEY (userId) REFERENCES user(userId),
	PRIMARY KEY (sessionId)
);
