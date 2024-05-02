import cv2
import numpy as np

cap = cv2.VideoCapture(4)

#Print resolution
print(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
print(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))

#Set framerate to 30 FPS
cap.set(cv2.CAP_PROP_FPS, 30)

#print fps
print(cap.get(cv2.CAP_PROP_FPS))


measurementsx = []
measurementsy = []

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
    lower_red = np.array([0, 150, 50])
    upper_red = np.array([60, 255, 255])
    maskRed = cv2.inRange(dilate, lower_red, upper_red)
    

    findContours = cv2.findContours(maskRed, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)

    maxRadius = 0
    maxCenter = (0, 0)


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
            print("O.B.")
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