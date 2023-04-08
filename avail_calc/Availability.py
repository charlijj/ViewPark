import cv2 as cv
from typing import List
from ParkingSpot import ParkingSpot

# Availability Class

# This class will determine the fullness of a parking lot.
# Given a list of spatial positions of each spot in the parking lot,
# and an image of the parking lot, it will crop each spot into a new image,
# convert it to a grayscale image, and then convert the grayscale image into a threshold image.

# It will then count the number of pixels in each threshold image.
# If the number of pixels inside the spot is high, then the spot is likely full.

class Availability:
    
    # initialize with a list of parking spots, and the path/filename of an image
    def __init__(self, parkingSpotList: List[ParkingSpot], imagePath: str) -> int:
        
        self.parkingSpotList = parkingSpotList
        self.imagePath = imagePath
        
        # coefficient to multiply with the dimensions of a parking spot when counting non-zero pixels from threshold image
        self.countCoefficient = 0.2 # (apparently 20% is the magic number)
        
    def calcFullness(self):
        
        if (len(self.parkingSpotList) == 0):
            return 0
        
        # read the image file, convert it to grayscale, then convert grayscale image to threshold image
        parkingLotImage = cv.imread(self.imagePath)
        grayImage = cv.cvtColor(parkingLotImage, cv.COLOR_BGR2GRAY) # covert to grayscale
        imageThreshold = cv.adaptiveThreshold(grayImage, 255, cv.ADAPTIVE_THRESH_GAUSSIAN_C, cv.THRESH_BINARY_INV, 25, 15) # convert image to threshold
        
        numFullSpots = 0
        
        # for each spot in the list of parking spots
        for spot in self.parkingSpotList:
            
            imageCrop = imageThreshold[spot.yPos:spot.yPos+spot.spotHeight, spot.xPos:spot.xPos+spot.spotWidth] # crop image into the rectangle described by the parking spot
            
            count = cv.countNonZero(imageCrop) # count number of pixels in cropped spot image
            
            if count > (self.countCoefficient * spot.spotWidth * spot.spotHeight): # if a certain percent of the total pixels in the spot are non-zero, spot is likely occupied
                numFullSpots += 1
        
        lotFullness = round(numFullSpots / len(self.parkingSpotList) * 100) # display fullness metric as a percentage of capacity
        return lotFullness # not sure if we should return this or stick it in the database at this point or what..
    
