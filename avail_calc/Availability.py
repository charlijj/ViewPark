import cv2 as cv

# Availability Class

# This class will determine the fullness of a parking lot.
# Given a list of spatial positions of each spot in the parking lot,
# and an image of the parking lot, it will crop each spot into a new image,
# convert it to a grayscale image, and then convert the grayscale image into a threshold image.

# It will then count the number of pixels in each threshold image.
# If the number of pixels inside the spot is high, then the spot is likely full.

class Availability:
    
    # initialize with a list of parking spots, and the path/filename of an image
    def __init__(self, parkingSpotList, imagePath):
        self.parkingSpotList = parkingSpotList
        self.imagePath = imagePath
        
    def calcFullness(self):
        
        # read the image file, convert it to grayscale, then convert grayscale image to threshold image
        parkingLotImage = cv.imread(self.imagePath)
        grayImage = cv.cvtColor(parkingLotImage, cv.COLOR_BGR2GRAY) # covert to grayscale
        imageThreshold = cv.adaptiveThreshold(grayImage, 255, cv.ADAPTIVE_THRESH_GAUSSIAN_C, cv.THRESH_BINARY_INV, 25, 15) # convert image to threshold
        
        numFullSpots = 0
        
        # for each spot in the list of parking spots
        for spot in self.parkingSpotList:
            
            imageCrop = imageThreshold[spot.yPos:spot.yPos+spot.spotHeight, spot.xPos:spot.xPos+spot.spotWidth] # crop image into the rectangle described by the parking spot
            
            count = cv.countNonZero(imageCrop) # count number of pixels in cropped spot image
            
            if count > 130: # if more than 130 pixels are counted, spot is occupied
                numFullSpots += 1
        
        lotFullness = round(numFullSpots / len(self.parkingSpotList) * 100, 2) # display fullness metric as a percentage of capacity
        return lotFullness # not sure if we should return this or stick it in the database at this point or what..
    