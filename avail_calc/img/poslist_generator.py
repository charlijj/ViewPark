import pickle
import cv2 as cv
import cvzone
import sys

# This program will generate position lists for the locations of parking spots in a lot.
# Must pass the folder name that contains both the images and dimensions file as an argument.
# Probably don't run it from outside the directory its in, who knows..

# if no args, exit
if (len(sys.argv) < 2):
    print('Must specify folder name. eg: trades_upper')
    exit(1)

imageFile = (sys.argv[1] + '/' + sys.argv[1] + '1.jpg') # create filename string based off user argument

# try to open the file
try:
    open(imageFile, 'rb')
except:
    print('Could not open file', imageFile)
    exit(1)
    
# try to open and read spot_dimensions file
try:
    spotDimensions = open((sys.argv[1]) + '/spot_dimensions.txt', 'r')
except:
    print('Could not read file ' + sys.argv[1] + '/spot_dimensions.txt')
    exit(1)
    
# read first two lines of dimensions file as spot width and height respectively
spotWidth = int(spotDimensions.readline())
spotHeight = int(spotDimensions.readline())

# coefficient to multiply with the dimensions of a parking spot when counting non-zero pixels from threshold image. (apparently 25% is the magic number)
countCoefficient = 0.25

cvImage = cv.imread(imageFile) # open lot image (but in a cool opencv way)
cvGrayImage = cv.cvtColor(cvImage, cv.COLOR_BGR2GRAY) # covert image to grayscale
cvThresholdImage = cv.adaptiveThreshold(cvGrayImage, 255, cv.ADAPTIVE_THRESH_GAUSSIAN_C, cv.THRESH_BINARY_INV, 25, 15) # convert image to threshold

try:
    with open((sys.argv[1] + '/' + sys.argv[1] + '_posList'), 'rb') as file: # try to open position list file from previous session 

        posList = pickle.load(file) # fill position list with previously selected spots
except:
    posList = []
    
def checkParkingSpace():
# crops selected spot and determines the pixel count from threshold image,
# calculates occupancy based on the count of non-zero pixels in the image.

    numFullSpots = 0

    for pos in posList:

        x,y,w,h = pos

        imgCrop = cvThresholdImage[y:y+h, x:x+w] # crop this bad boy

        # cv.imshow(str(x * y), imgCrop) # will open a new window for all cropped parking spot images (uncomment at your own risk)

        count = cv.countNonZero(imgCrop) # count number of pixels in selected spot

        # cvzone.putTextRect(parkingLot, str(count), (x, y+h-10), scale = 1, thickness=1, offset=0) # display pixel count

        if count > (countCoefficient * spotWidth * spotHeight): # if parking spot is occupied
            # cvzone.putTextRect(parkingLot, 'FULL', (x+w+6, y+h), scale = 1, thickness=1, offset=0) # display FULL status
            numFullSpots += 1 

        availability = round(numFullSpots / len(posList) * 100, 2)

        cvzone.putTextRect(parkingLot, str(availability) + '% FULL', (0, parkingLot.shape[0]), scale = 1, thickness=1, offset=0) 



def mouseClick (event, x, y, flage, params):

    if event == cv.EVENT_LBUTTONDOWN: # add new spot selection to positions list
        posList.append((x, y, spotWidth, spotHeight))

    if event == cv.EVENT_RBUTTONDOWN: # remove spot from positions list

        for i, pos in enumerate(posList):

            clkX, clkY, rectWidth, rectHeight = pos
            if clkX < x < clkX + rectWidth and clkY < y< clkY + rectHeight: # if right mouse click is in the area of a selected spot

                posList.pop(i)

        
    with open((sys.argv[1] + '/' + sys.argv[1] + '_posList'), 'wb') as file: # add updated position list to posList record file

        pickle.dump(posList, file)

while True:

    parkingLot = cv.imread(imageFile) # update original image

    for pos in posList:

        checkParkingSpace()

        cv.rectangle(parkingLot, (pos[0], pos[1]), (pos[0]+pos[2], pos[1]+pos[3]), (255, 0, 233), 2) # draw rectangle around all selected spots

    cv.imshow('parkingLotImage', parkingLot) # show original image
    # cv.imshow('parking-lot', imgThreshold) # show threshold image

    cv.setMouseCallback('parkingLotImage', mouseClick) # mouse click event listener
    
    key = cv.waitKey(1)
    
    if key == ord(" "): # if key press is the space bar, end program

        break