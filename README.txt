-------------------------------------------------------------------

VIU Parking Lot Occupancy Tracker (viewpark.ca)

By: Team Papaya

 - Adam 
 - David
 - Ethan
 - Jasper 
 - Matt

Table of contents:

├── How To Run                   line: 30           
│   ├── Dependencies
|   ├── Setup                    
│   └── Run                 
├── Directory Layout             line: 91
│  
└── Key Files                    line: 185
    ├── Setup Files:             
    ├── Availability Calculator  
    ├── Account Management       
    ├── Session Management       
    ├── Availability View Layer  
    └── Database Files           

-------------------------------------------------------------------

How To Run:

  Dependencies:

    Python 3.9.2 or newer
    Python libraries: 
      opencv-contrib-python
      cvzone
      pickle-mixin

  Setup:

    clone repository 

    pip install -r requirements.txt

  Run:

    Step 1 - Execute: 
    
    ./run.py

    options:

    --help: Print all of the flag options for run.py 

    --init-database: Drops all tables if they exist, creates new tables, and populates with test data.

    --interval <custom_interval>: Specify custom interval in minutes for updating images and availability, the default interval is 5 minutes.

    --database <db_file>: Specify custom database path.

    --stop: Stop program after initializing database, does not enter interval loop.

    Step 2 - Go to ViewPark website:

    run: ssh -N -L 8080:wwwstu.csci.viu.ca:80 csci375b@csci.viu.ca

    password: Papaya

    in a browser open: http://localhost:8080/~csci375b/project/

    (note: page must be refreshed to see updated availability)

    Step 3 - Log In:

    for testing general user:

    username: gentest

    for testing staff user:

    username: stafftest

    password for both: papaya

    or create a new account

-------------------------------------------------------------------

Directory Layout:
.
├── LICENSE
├── README.txt
├── todo.txt
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
│   └── viewpark.db
|
└── www
    ├── index.php
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

  Setup File: located in root 
  │
  │  - run.py
  |    initializes database when run for the first time, starts an interval, and calls availability calculator to update availability for each parking lot on the interval,
  |    also calculates the availability forecast for each lot and writes it into the corresponding lot JSON file. 
  │
  Availability Calculator: located in avail_calc/ 
  │
  |  - ParkingSpot.py
  |    a data class that stores the dimensions of a parking spot as an (x,y) point, width, and height.
  |
  │  - Availability.py
  |    class which contains methods for calculating the fullness of a parking lot from an image and a list of ParkingSpot objects.
  |
  |  - ParkingLot.py
  │    class which unpacks the position list into a list of ParkingSpot objects as input for an Availability instance,
  |    contains method that returns an AvailabilityEntry object to be added to the database.
  |
  Position List Generator: located in avail_calc/img/
  |
  |  - poslist_generator.py
  |    script that is used to generate the position lists for each lot, these position lists will be used by the system to calculate the fullness of each lot.
  |    it takes the path to a parking lot image as an argument when ran.
  |            
  |        example usage from avail_calc/img: python3 poslist_generator.py lotA/lotA1.jpg
  |
  |    when ran a window will open displaying the specified lot image, left clicking on the image will create a spot rectangle whos dimensions will be read from spot_dimensions.txt
  |    in the same directory. right clicking inside of a rectange will delete it from the list. The posList file is updated after each click.
  |
  Account Management: located in www/
  │
  │  - account.php
  │    verifies user credentials provided in the login modal and logs user in if valid.
  │
  │  - create_account.php
  │    allows user to create a new account, if provided information is valid new account will be inserted into the database.
  │
  │  - edit_account.php
  │    allows user to edit account information or delete account.
  │
  │
  Session Management: located in www/include/
  │
  │  - park.php
  │    allows user to create a new session after clicking on a parking lot, selecting a start and end time, and clicking the park button. 
  │
  │  - session.php 
  │    displays users current session, showing current user's username, the lot they are parking in, and their start and end times.   
  │
  │
  Availability View Layer and Forecast: located in www/include/
  │
  │  - availability.php
  │    displays all parking lots the user can park in, including the lot name, lot ID, and fullness as a %. The fullness is updated on each interval. 
  |    also contains the script for generating the forecast bar graph. 
  │
  │  - forecast.php
  │    displays a bar graph representing the parking lot availability forecast as well as an option to select a day. 
  │
  │ 
  Database Files: located in sql/
  │
  │  - database.py and database.php (database.php is located in www/include/)
  |    initializes the connection to viewpark database and contains data class definitions for each table entry,
  |    as well as prepared statements for getting, creating, and updating each table.
  │
  │  - create_tables.sql
  |    contains all table definitions.
  │ 
  │  - data.sql
  |    contains all test data insert statements. 
-------------------------------------------------------------------

