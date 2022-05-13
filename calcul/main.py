import serial
import time

res = bytes('hi' ,'utf-8')
print(res)
arduino = serial.Serial('COM6', 115200, timeout=.1)
time.sleep(1)
arduino.write(b'heyyyyy')

while True:
    data = arduino.readline()
    if data:
        print(data.rstrip('\n'))
    time.sleep(1)