import cv2 as cv

# importing sql/databse.py to query/insert/update the databse
import sys
sys.path.append('../sql')
from database import Database
"""
need to make file path dynamic?
or maybe '../sql' works fine everywhere?
"""
from ParkingLot import ParkingLot # has (self, lotID, lotName, lotType, posListFileName, parkingLotImage)

my_instance = Database #trying to instantaite the databse

# create the select query to grab the lot info
query = "lot"
args = ["lotId", "lotName"]
select_query = my_instance.generate_select_query(query, args)

# then pass the lot info to the ParkingLot class
# call that classes method and store the update availabilty in a variable here

# Then, using the methods from database.py:
# UPDATE fullness in the DB table that just need and UPDATE.
# and INSERT fullness in the other table that creates a row every 5 mins.









""" DONT MIND THIS, JUST TRYING TO MAKE SENSE OF IT

no need to call availability --> "ParkingLot" already calls her, baby...

Might not need to call this one --> ParkingSpot(self, xPos, yPos, spotWidth, spotHeight)

ParkingLot(self, lotID, lotName, lotType, posListFileName, parkingLotImage)


PL = ParkingLot() # needs to have parameters
fullness = PL.updateFullness()
"""
#query the database for parking lot info


print("Good to here maybe")






