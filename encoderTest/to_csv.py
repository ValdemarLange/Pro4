# import serial
# import csv
# import time

# # Define serial port and baud rate
# serial_port = 'COM5'  # Replace 'COMX' with your Arduino's serial port (e.g., COM3)
# baud_rate = 115200

# # Open serial port
# ser = serial.Serial(serial_port, baud_rate, timeout=1)

# # Create CSV file and writer
# csv_file = open('serial_log.csv', 'w', newline='')
# csv_writer = csv.writer(csv_file)
# csv_writer.writerow(['Timestamp (s.ms)', 'Input Pin State', 'Output Pin State'])

# # Start time
# start_time = time.time()

# try:
#     while True:
#         # Read line from serial port
#         line = ser.readline().decode('utf-8').strip()
#         timestamp = "{:.3f}".format(time.time() - start_time)  # Current timestamp in seconds with milliseconds

#         # Write to CSV
#         csv_writer.writerow([timestamp] + line.split(','))

# except KeyboardInterrupt:
#     ser.close()
#     csv_file.close()


import serial
import csv
import struct
import keyboard
import binascii

# Define serial port and baud rate
serial_port = "/dev/ttyACM0"  # Replace 'COMX' with your Arduino's serial port (e.g., COM3)
baud_rate = 115200

# Open serial port
ser = serial.Serial(serial_port, baud_rate, timeout=1)

fileName = str(input("Enter name of file: "))



while True:
        # Read line from serial port
        #line = ser.readline().decode('utf-8').strip()
    #encoderData = ser.read(2)[::-1]
    encoderData = ser.read(2)

    encoderData = binascii.hexlify(encoderData).decode()
    #change from hex to int
    encoderDataDec = int(encoderData, 16)
    encoderDataDec -= 1024
    #encoderData = int.from_bytes(ser.read(2), byteorder='big')
        
    with open(f'{fileName}.csv', 'a', newline='') as file:
        writer = csv.writer(file)
        writer.writerow([encoderData, encoderDataDec])
        
        
        # Write to CSV
        #csv_writer.writerow(line.split(','))
    
    #break while loop when pressing q
    #if keyboard.is_pressed('q'):
     #   break