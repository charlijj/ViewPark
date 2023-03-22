# ParkingSpot Class
# This file contains a class which descibes a parking spot as a rectangle in space.

class ParkingSpot:
    
    # note: x and y positions describe the point of the top left corner of the rectangle
    def __init__(self, xPos, yPos, spotWidth, spotHeight):
        self.xPos = xPos
        self.yPos = yPos
        self.spotWidth = spotWidth
        self.spotHeight = spotHeight
        