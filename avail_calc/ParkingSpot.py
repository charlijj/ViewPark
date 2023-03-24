from dataclasses import dataclass
# ParkingSpot Class
# This file contains a class which descibes a parking spot as a rectangle in space.

@dataclass
class ParkingSpot:
    # note: x and y positions describe the point of the top left corner of the rectangle
    xPos: int
    yPos: int
    spotWidth: int
    spotHeight: int