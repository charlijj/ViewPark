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
.
├── install.sh
├── LICENSE
├── README.txt
├── requirements.txt
├── run.py
├── avail_calc
│   ├── Availability.py
│   ├── img
│   │   ├── lotA
│   │   │   ├── lotA1.jpg
│   │   │   ├── lotA2.jpg
│   │   │   ├── lotA3.jpg
│   │   │   ├── posList
│   │   │   └── spot_dimensions.txt
│   │   ├── lotB
│   │   │   ├── lotB1.jpg
│   │   │   ├── lotB2.jpg
│   │   │   ├── lotB3.jpg
│   │   │   ├── posList
│   │   │   └── spot_dimensions.txt
│   │   ├── lotC
│   │   │   ├── lotC1.jpg
│   │   │   ├── lotC2.jpg
│   │   │   ├── lotC3.jpg
│   │   │   ├── posList
│   │   │   └── spot_dimensions.txt
│   │   ├── lotD
│   │   │   ├── lotD1.jpg
│   │   │   ├── lotD2.jpg
│   │   │   ├── lotD3.jpg
│   │   │   ├── posList
│   │   │   └── spot_dimensions.txt
│   │   ├── lotE
│   │   │   ├── lotE1.jpg
│   │   │   ├── lotE2.jpg
│   │   │   ├── lotE3.jpg
│   │   │   ├── posList
│   │   │   └── spot_dimensions.txt
│   │   └── poslist_generator.py
│   ├── __init__.py
│   ├── ParkingLotController.py
│   ├── ParkingLot.py
│   ├── ParkingSpot.py
│   └── UnitTests.py
|
├── documentation
│   ├── AnalysisModels.pdf
│   ├── ProjectPlan.pdf
│   ├── Requirements.pdf
│   └── TeamFormation.pdf
|
├── sql
│   ├── create_tables.sql
│   ├── database.py
│   ├── data.sql
│   ├── drop_tables.sql
│   ├── __init__.py
│   ├── __pycache__
│   │   ├── database.cpython-39.pyc
│   │   ├── __init__.cpython-35.pyc
│   │   └── __init__.cpython-39.pyc
│   └── viewpark.db
├── todo.txt
|
└── www
    ├── account.php
    ├── create_account.php
    ├── edit_account.php
    ├── include
    │   ├── availability.php
    │   ├── database.php
    │   ├── defines.php
    │   ├── forecast.php
    │   ├── head.php
    │   ├── login_modal.php
    │   ├── logout.php
    │   ├── park.php
    │   ├── session.php
    │   ├── start_session.php
    │   └── tail.php
    ├── index.php
    ├── lots
    │   ├── 1
    │   ├── 2
    │   ├── 3
    │   ├── 4
    │   ├── 5
    │   └── README
    └── style
        ├── create_account_style.css
        ├── img
        │   └── repeated-square-dark.jpg
        ├── index_style.css
        └── style.css

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

