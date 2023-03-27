import cv2 as cv
import sys
import time 
from itertools import cycle


# has (self, lotID, lotName, lotType, posListFileName, parkingLotImage)
from ParkingLot import ParkingLot 

# importing sql/databse.py to query/insert/update the databse
sys.path.append('../sql')
from sql.database import Database, LotEntry

db = Database #trying to instantaite the databse

# grab lot A info
lot_entryA = LotEntry(lotId=2)
pos_list_file_nameA = './img/lotA/posList' #use this value for all 'lotA' images

# define the list of lotA images to loop through
lotA_images = cycle(['./img/lotA/lotA1.jpg', './img/lotA/lotA2.jpg', './img/lotA/lotA3.jpg'])

#parking_lot_imageA1 = './img/lotA/lotA1.jpg'

# calculate lot A avail and return it to here
while True:

    # iterate throug each image in a circular way
    parking_lot_imageA = next(lotA_images)

    parking_lotA = ParkingLot(lot_entryA, pos_list_file_nameA, parking_lot_imageA)
    avail_lotA = parking_lotA.updateFullness()

    # need to update and insert to database instead of printing
    print(avail_lotA)

    # waits 5 min before processing next image
    time.sleep(300)






 
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


#print("Good to here maybe")






