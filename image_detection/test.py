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
    
    
    cv2.imshow('frame', frame)
    if(cv2.waitKey(1) & 0xFF == ord('q')):
        break