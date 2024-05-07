import cv2
import numpy as np
#import kalman filter
from pykalman import KalmanFilter

cap = cv2.VideoCapture(4)

#Print resolution
print(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
print(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))

#Set framerate to 30 FPS
cap.set(cv2.CAP_PROP_FPS, 30)

#print fps
print(cap.get(cv2.CAP_PROP_FPS))

#Kalman filter
#kf = KalmanFilter(initial_state_mean=0, n_dim_obs=1)

test = True
#create global value testxy to store pixel colour
testxy = None
colorRef = None

angleHorizontalFactor = 33/320
angleVertivalFactor = 19.3/240

counter = 0

    #save pixel colour by mouse click
def getPixel(event, x, y, flags, param):
    global testxy
    if event == cv2.EVENT_LBUTTONDOWN:
        testxy = y, x


while(test):
    testFrame = cap.read()[1]
    cv2.imshow('testFrame', testFrame)
    
    #call getPixel when clicking
    cv2.setMouseCallback('testFrame', getPixel)
    
    if(testxy != None):
        colorRef = testFrame[testxy]
        print(testFrame[testxy])
        cv2.destroyAllWindows()
        break
    
    if(cv2.waitKey(1) & 0xFF == ord('q')):
        break
        

measurementsx = []
measurementsy = []


colorRef = cv2.cvtColor(np.uint8([[colorRef]]), cv2.COLOR_BGR2HSV)
colorRef = colorRef[0][0]
print(colorRef)
tolerance = int(input("Enter tolerance: "))

while(True):    
    #Make live video feed
    frame = cap.read()[1]    

    
    
    # Adjust color balance - new camera colour temperatures are too cold
   # b, g, r = cv2.split(frame)
   # r = r - 20
   # r = np.clip(r, 0, 255)
   # b = b + 10
   # b = np.clip(b, 0, 255)
   # frame = cv2.merge((b, g, r))
    
    #Convert to hsv
    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
    
    #Errode
    erode = cv2.erode(hsv, None, iterations=2)

    #dilate
    dilate = cv2.dilate(erode, None, iterations=2)

    #Find thresholds in range for a red colour in hsv
    lower_red = np.array([colorRef[0]-tolerance, colorRef[1]-tolerance, colorRef[2]-tolerance]) 
    upper_red = np.array([colorRef[0]+tolerance, colorRef[1]+tolerance, colorRef[2]+tolerance])
    maskRed = cv2.inRange(dilate, lower_red, upper_red)
    
    findContours = cv2.findContours(maskRed, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)

    maxRadius = 0
    maxCenter = (0, 0)

    frameCenter = (320, 240)
    
    #draw circle around contours
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
    
    if maxRadius > 0:        
        cv2.circle(frame, maxCenter, maxRadius, (0, 255, 0), 2)
        measurementsx.append(maxCenter[0])
        measurementsy.append(maxCenter[1]) 

         # Define the box boundaries
        box_x_min, box_y_min = 100, 80
        box_x_max, box_y_max = 540, 400
        # Check if the measurements are within the box
        if maxCenter[0] < box_x_min or maxCenter[0] > box_x_max or maxCenter[1] < box_y_min or maxCenter[1] > box_y_max:
            #print x and y
            print("X: ", maxCenter[0], "Y: ", maxCenter[1])
            
            #Check if we are too much to the right
            if maxCenter[0] > box_x_max:                
                turnAngleHorizontal = (maxCenter[0]-frameCenter[0])*angleHorizontalFactor
                print(f"Too much right go left by {turnAngleHorizontal}")
            #Check if we are too much to the left
            elif maxCenter[0] < box_x_min:
                turnAngleHorizontal = (frameCenter[0]-maxCenter[0])*angleHorizontalFactor
                print(f"Too much left go right by {turnAngleHorizontal}")
            
            #Check if we are too much to the bottom
            if maxCenter[1] > box_y_max:
                turnAngleVertical = (maxCenter[1]-frameCenter[1])*angleVertivalFactor
                print(f"Too low go up by {turnAngleVertical}")
            
            elif maxCenter[1] < box_y_min:
                turnAngleVertical = (frameCenter[1]-maxCenter[1])*angleVertivalFactor
                print(f"Too high go down by {turnAngleVertical}")
            
    else:
        measurementsx.clear()
        measurementsy.clear()


    if len(measurementsx) > 4:
        lengthx = measurementsx[4] - measurementsx[0]
        lengthy = measurementsy[4] - measurementsy[0]

        #print(lengthx, lengthy)

        if(abs(lengthx) > 100 or abs(lengthy) > 100):
            print("Moving too fast")

        measurementsx.clear()
        measurementsy.clear()

    #print(len(measurementsx))

    #draw box that the ball should stay in
    cv2.rectangle(frame, (150, 120), (490, 360), (255, 0, 0), 2)
    
    #draw line from top to bottom of the image in center
    #cv2.line(frame, (320, 0), (320, 480), (0, 255, 0), 2) 

    cv2.imshow('frame', frame)
    if(cv2.waitKey(1) & 0xFF == ord('q')):
        break