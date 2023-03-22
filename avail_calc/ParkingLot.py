# ParkingLot Class

# This class is responsible for updating the current fullness metric of a parking lot,
# as well as updating the forecast of the parking lot (maybe.. not sure where were calculating forecast anymore tbh).

import pickle
from ParkingSpot import ParkingSpot
from Availability import Availability

class ParkingLot:
    
    # note: posListFilename is a pickled list of parking lot positions, constructor unpacks the list,
    # and instantiates a new parking spot object for each position.
    def __init__(self, lotID, lotName, lotType, posListFileName, parkingLotImage): 
        
        self.lotID = lotID # (int)
        self.lotName = lotName # (string)
        self.lotType = lotType # general/staff (0/1)
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

        lotAvailability = Availability(self.parkingSpotList, self.parkingLotImage).calcFullness() # instantiate new Availability object and run the calcFullness method
        return lotAvailability # not sure if i should return this or stick in the database now or what...
    