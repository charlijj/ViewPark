# ParkingLot Class

# This class is responsible for updating the current fullness metric of a parking lot,
# as well as updating the forecast of the parking lot (maybe.. not sure where were calculating forecast anymore tbh).

import pickle
from .ParkingSpot import ParkingSpot
from .Availability import Availability
import sys
import time

sys.path.append('../')
from sql.database import AvailabilityEntry, LotEntry


class ParkingLot:
    
    # note: posListFilename is a pickled list of parking lot positions, constructor unpacks the list,
    # and instantiates a new parking spot object for each position.
    def __init__(self, lotEntry: LotEntry, posListFileName: str, parkingLotImage: str) -> AvailabilityEntry: 
        
        self.lotEntry = lotEntry
        self.parkingLotImage = parkingLotImage # filename/path of parking lot image (string)
        self.parkingSpotList = [] # empty list for parking spot objects
        
        # open posList file and unpickle it
        with open(posListFileName, 'rb') as file:
            spotPositionList = pickle.load(file) # unpickle into a list variable
        
        # for every position in un pickled list
        for pos in spotPositionList:
            
            # append a new parking spot object to the list
            xPos, yPos, spotWidth, spotHeight = pos
            self.parkingSpotList.append(ParkingSpot(xPos, yPos, spotWidth, spotHeight))
            
    def updateFullness(self):

        availability = Availability(self.parkingSpotList, self.parkingLotImage) # instantiate new Availability object and run the calcFullness method
        fullness = availability.calcFullness()
        
        return AvailabilityEntry(
            self.lotEntry.lotId,
            int(time.time()), # current epoch
            fullness
        )
    
