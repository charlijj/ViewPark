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

#pos_list_file_nameA = './img/lotA/posList' #use this value for all 'lotA' images

# define the list of lotA images to loop through
#lotA_images = cycle(['./img/lotA/lotA1.jpg', './img/lotA/lotA2.jpg', './img/lotA/lotA3.jpg'])

#parking_lot_imageA1 = './img/lotA/lotA1.jpg'

# calculate lot A avail and return it to here
while True:
    for i in range(1, 6): #loop thru the 5 lotx1's 
        lot_id = i + 1 #lotA1 has lot_id 2, lotB1 has lot_id 3, lotC1 has lot_id 4
        lot_entry = LotEntry(lotId=lot_id) # starts at lot_Id = 2
        name = chr(64+i)
        pos_list_file_name = f'./img/lot{name}/posList' # value for all 'lotA' images
        lot_images = [f'./img/lot{name}/lot{name}{j}.jpg' for j in range(1, 4)] # get all 3 images for this lot

        avail_list = []
        for image in lot_images:
            parking_lot = ParkingLot(lot_entry, pos_list_file_name, image)
            avail_lot = parking_lot.updateFullness()


    # need to update and insert to database instead of printing
        print(f'Lot {chr(64+i)}:')
        for j, avail in enumerate(avail_list):
                print(f'\tImage {j+1}: {avail}')

    # waits 5 sec before processing next image. Change to 5 min after testing 
    time.sleep(5)

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






