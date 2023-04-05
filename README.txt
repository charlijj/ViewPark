-------------------------------------------------------------------

VIU Parking Lot Occupancy Tracker (viewpark.ca)

By: Team Papaya

 - Adam 
 - David
 - Ethan
 - Jasper 
 - Matt

Table of contents:

├── How To Run                   line: 31           
│   ├── Setup                    
│   └── Run                 
├── Directory Layout             line: 39
│  
└── Key Files                    line: 50
    ├── Setup Files:             
    ├── Availability Calculator  
    ├── Account Management       
    ├── Session Management       
    ├── Availability View Layer  
    └── Database Files           

-------------------------------------------------------------------

How To Run:

  Setup:

  Run:

-------------------------------------------------------------------

Directory Layout:

// insert tree here 

-------------------------------------------------------------------

Key Files:

  Setup Files: located in root 
  │
  │  - install.sh
  │
  │  - run.py
  │
  │
  Availability Calculator: located in avail_calc/ 
  │
  │  - 
  │
  Account Management: located in www/
  │
  │  - account.php
  │    verifies user credentials provided in the login modal and logs user in if valid.
  │
  │  - create_account.php
  │    allows user to create a new general or staff user, if provided information is valid inserts new account into the database.
  │
  │  - edit_account.php
  │    allows user to edit account information or delete account.
  │
  │
  Session Management: located in www/include/
  │
  │  - park.php
  │    allows user to create a new session after clicking on a parking lot and selecting a start and end time. 
  │
  │  - session.php 
  │    displays users current session, showing current users username, the lot they are parking in, and their start and end times.   
  │
  │
  Availability View Layer and Forecast: located in www/include/
  │
  │  - availability.php
  │    displays all parking lots the user can park in, including the lot name, lot ID, and fullness as a % 
  │
  │  - forecast.php
  │    displays a bar graph representing the parking lot availability forecast for a selected day. 
  │
  │ 
  Database Files: located in sql/
  │
  │  - database.py
  │
  │  - create_tables.sql
  │ 
  │  - data.sql
-------------------------------------------------------------------

