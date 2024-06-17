import cv2
import numpy as np

#import UARTfrom machine import UART
import serial

import csv

#import math lib
import math

#setup serial communication
ser = serial.Serial("/dev/ttyACM0",9600)


fileName = str(input("Enter name of file: "))

cap = cv2.VideoCapture(4)

# Print resolution
print(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
print(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))

# Set framerate to 30 FPS
cap.set(cv2.CAP_PROP_FPS, 30)

# print fps
print(cap.get(cv2.CAP_PROP_FPS))


test = True
# create global value testxy to store pixel colour
testxy = None
colorRef = None

xErrorFromBox = 0
yErrorFromBox = 0
frameCounter = 0


#degree to radians
bHorizontal = int(320/math.tan(math.radians(33)))
#prov mindre vinkel
bVertical = int(240/math.tan(math.radians(18)))

print(bHorizontal)
print(bVertical)

counter = 0
colourSamples = []


# save pixel colour by mouse click
def getPixel(event, x, y, flags, param):
    global testxy
    if event == cv2.EVENT_LBUTTONDOWN:
        testxy = y, x


ser.write((int(0)).to_bytes(1, byteorder='big'))
ser.write((int(128)).to_bytes(1, byteorder='big'))


while (test):
    testFrame = cap.read()[1]
    cv2.imshow('testFrame', testFrame)

    # call getPixel when clicking
    cv2.setMouseCallback('testFrame', getPixel)

    if (testxy != None):
        colorRef = testFrame[testxy]
        colourSamples.append(colorRef)
        testxy = None
        #print(testFrame[testxy])
        if len(colourSamples) > 2:
            cv2.destroyAllWindows()
            break

    if (cv2.waitKey(1) & 0xFF == ord('q')):
        break


colourSamples = np.array(colourSamples)

# Convert to hsv
for i in range(len(colourSamples)):
    colourSamples[i] = cv2.cvtColor(np.uint8([[colourSamples[i]]]), cv2.COLOR_BGR2HSV)

print(colourSamples)

maxHue = np.amax(colourSamples[:, 0])+0
minHue = np.amin(colourSamples[:, 0])+0

maxSat = np.amax(colourSamples[:, 1])
minSat = np.amin(colourSamples[:, 1])

maxVal = np.amax(colourSamples[:, 2])
minVal = np.amin(colourSamples[:, 2])

#increment maxHue
maxHue += 10

#print tolerances
print(f"Hue tolerance: {maxHue-minHue}")
print(f"Sat tolerance: {maxSat-minSat}")
print(f"Val tolerance: {maxVal-minVal}")


#boxx = int(130)
boxx = int(40)
#boxy = int(100)
boxy = int(30)
# Define the box boundaries
box_x_min, box_y_min = 320-boxx, 240-boxy
box_x_max, box_y_max = 320+boxx, 240+boxy


while (True):
    #increment frame counter
    frameCounter += 1
    
    # Make live video feed
    frame = cap.read()[1]

    # Convert to hsv
    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)

    # Find thresholds in range for a red colour in hsv
    lower_red = np.array([minHue, minSat, minVal])
    upper_red = np.array([maxHue, maxSat, maxVal])
    maskRed = cv2.inRange(hsv, lower_red, upper_red)
    
    # dilate
    dilate = cv2.dilate(maskRed, None, iterations=2)
    #erode = cv2.erode(dilate, None, iterations=2)
    findContours = cv2.findContours(dilate, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)

    cv2.imwrite('Before.png', frame)
    cv2.imwrite('AfterMask.png', maskRed)
    cv2.imwrite('AfterOperation.png', dilate)

    maxRadius = 0
    maxCenter = (0, 0)

    frameCenter = (320, 240)

    # draw circle around contours
    if len(findContours) == 2:
        contours = findContours[0]
        hierarchy = findContours[1]
        for contour in contours:
            (x, y), radius = cv2.minEnclosingCircle(contour)
            center = (int(x), int(y))
            radius = int(radius)

            if radius > maxRadius:
                maxRadius = radius
                maxCenter = center

    if maxRadius > 5:
        #print(f"max radius: {maxRadius}")   
        cv2.circle(frame, maxCenter, maxRadius, (0, 255, 0), 2)
        #save image of circle around object
        cv2.imwrite('circle.png', frame)

        # Check if the measurements are within the box
        if maxCenter[0] < box_x_min or maxCenter[0] > box_x_max or maxCenter[1] < box_y_min or maxCenter[1] > box_y_max:

            # Check if we are too much to the right
            if maxCenter[0] > box_x_max:
                turnAngleHorizontal = int(math.degrees(math.atan2((maxCenter[0] - frameCenter[0]), bHorizontal)))
                print(f"Go right by {turnAngleHorizontal}")
                #Send angle over UART      
                turnAngleHorizontal |= (1<<6)
                ser.write((int(turnAngleHorizontal)).to_bytes(1, byteorder='big'))
                
                
                xErrorFromBox = maxCenter[0] - box_x_max
                
                
                if(maxCenter[1]>box_y_max):
                    yErrorFromBox = maxCenter[1]-box_y_max
                elif(maxCenter[1]<box_y_min):
                    yErrorFromBox = box_y_min - maxCenter[1]
                else :
                    yErrorFromBox = 0
                
                
                
            # Check if we are too much to the left
            elif maxCenter[0] < box_x_min:
                turnAngleHorizontal = int(math.degrees(math.atan2((frameCenter[0] - maxCenter[0]), bHorizontal)))
                print(f"Go left by {turnAngleHorizontal}")
                #Send angle over UART
                ser.write((int(turnAngleHorizontal)).to_bytes(1, byteorder='big'))
                
                # Calculate error from box                
                xErrorFromBox = box_x_min - maxCenter[0]
                
                if(maxCenter[1]>box_y_max):
                    yErrorFromBox = maxCenter[1]-box_y_max
                elif(maxCenter[1]<box_y_min):
                    yErrorFromBox = box_y_min - maxCenter[1]
                else :
                    yErrorFromBox = 0
                                    
            else:
                xErrorFromBox = 0
                yErrorFromBox = 0
                
            # Check if we are too low to the bottom
            if maxCenter[1] > box_y_max:
                turnAngleVertical = int(math.degrees(math.atan2((maxCenter[1] - frameCenter[1]), bVertical)))
                print(f"Go down by {turnAngleVertical}")
                #Send angle over UART
                turnAngleVertical |= (1<<7) | (1<<6)
                ser.write((int(turnAngleVertical)).to_bytes(1, byteorder='big'))
                
                # Calculate error from box
                if(maxCenter[0]>box_x_max):
                    xErrorFromBox = maxCenter[0] - box_x_max
                elif(maxCenter[0]<box_x_min):
                    xErrorFromBox = box_x_min - maxCenter[0]
                else :
                    xErrorFromBox = 0
                    
                yErrorFromBox = maxCenter[1] - box_y_max
                
            elif maxCenter[1] < box_y_min:
                turnAngleVertical = int(math.degrees(math.atan2((frameCenter[1] - maxCenter[1]), bVertical)))
                print(f"Go up by {turnAngleVertical}")
                #Send angle over UART
                turnAngleVertical |= (1<<7)
                ser.write((int(turnAngleVertical)).to_bytes(1, byteorder='big'))

                                    
                #error from box
                if(maxCenter[0]>box_x_max):
                    xErrorFromBox = maxCenter[0] - box_x_max
                elif(maxCenter[0]<box_x_min):
                    xErrorFromBox = box_x_min - maxCenter[0]
                else :
                    xErrorFromBox = 0
                yErrorFromBox = box_y_min - maxCenter[1]            
            else :
                xErrorFromBox = 0
                yErrorFromBox = 0
            
            #Calculate error from center
            errorFromCenter = math.sqrt((maxCenter[0] - 320)**2 + (maxCenter[1] - 240)**2)
            
            # Write to CSV file
            with open(f'{fileName}.csv', 'a', newline='') as file:
                writer = csv.writer(file)
                writer.writerow([frameCounter, errorFromCenter, xErrorFromBox, yErrorFromBox])
                
    else:
        ser.write(int(0).to_bytes(1, byteorder='big'))
        ser.write(int(128).to_bytes(1, byteorder='big'))

        
    # draw box that the ball should stay in
    cv2.rectangle(frame, (box_x_min, box_y_min), (box_x_max, box_y_max), (255, 0, 0), 2)

    # draw line from center of image to center of object
    if maxCenter[0] != 0 and maxCenter[1] != 0:
        cv2.line(frame, (320, 240), (maxCenter[0], maxCenter[1]), (0, 255, 0), 2)
        
    

    cv2.imshow('frame', frame)
    if (cv2.waitKey(1) & 0xFF == ord('q')):
        break

        
