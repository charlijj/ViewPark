import cv2 as cv
import sys
#import time 
#from itertools import cycle


# has (self, lotID, lotName, lotType, posListFileName, parkingLotImage)
from ParkingLot import ParkingLot 

# importing sql/databse.py to get the LotEntry info
sys.path.append('../sql')
from sql.database import Database, LotEntry

""" global variable that gets incremented by 1 every time that the functuion gets
    called, and goes back to 1 after it reaches 3, to make it loop
    circularly through the lot images
"""
counter = 1

# function that loops and calculates the availabilties of all lot images
def getFullness(self):

    for j in range(1, 6):
        lot_id = j + 1 #lotA has lot_id 2, lotB has lot_id 3, lotC has lot_id 4, etc...
        lot_entry = LotEntry(lotId=lot_id) # starts at lot_Id = 2
        name = chr(64+j) # value for lot name in ascii: Lot 65 = Lot A
        pos_list_file_name = f'./img/lot{name}/posList' # value for all 'lotX' images
        lot_images = [f'./img/lot{name}/lot{name}{counter}.jpg'] # put the lot images in a list

        #avail_list = []

        # send each image from each lot the ParkingLot class
        for image in lot_images:
            parking_lot = ParkingLot(lot_entry, pos_list_file_name, image)

            # get the availabilities and return
            avail_lot = parking_lot.updateFullness()
            return avail_lot

    counter +=1

    if counter > 3:
        counter = 1



