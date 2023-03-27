import cv2 as cv

# has (self, lotID, lotName, lotType, posListFileName, parkingLotImage)
from ParkingLot import ParkingLot 

# importing sql/databse.py to query/insert/update the databse
import sys
sys.path.append('../sql')
from sql.database import Database, LotEntry
#generate_select_query, generate_insert_query, generate_update_query

db = Database #trying to instantaite the databse


# create the select query to grab the lot A info
lot_entry = LotEntry(lotId=2)
pos_list_file_name = './img/lotA/posList'
parking_lot_imageA1 = './img/lotA/lotA1.jpg'

parking_lot = ParkingLot(lot_entry, pos_list_file_name, parking_lot_imageA1)
avail = ParkingLot.updateFullness(parking_lot)
print(parking_lot) #prints "fullness=none"




 
"""
lot_entry = LotEntry()
lot_entry.lot_name = "lot A"
"""





"""
query = "lot"
args = ["lotName", "Lot A", ]
select_query = my_instance.generate_select_query(query, args)
"""

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






