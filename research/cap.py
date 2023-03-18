import cv2
import sys
import pytesseract
import time


VIDEO_URL = "https://live.football-master.net/live/sd-1-3749538.m3u8?auth_key=1677431650-0-0-21b33287b2a5be8abacdbd28cd9e9a2c"

cap = cv2.VideoCapture(VIDEO_URL)
if (cap.isOpened() == False):
    print('!!! Unable to open URL')
    sys.exit(-1)

# retrieve FPS and calculate how long to wait between each frame to be display
# fps = cap.get(cv2.CAP_PROP_FPS)
# wait_ms = int(1000/fps)
# print('FPS:', fps)

# while(True):
    # read one frame
ret, frame = cap.read()

    # TODO: perform frame processing here
cv2.imwrite("stream.jpg", frame)

    # display frame
    # cv2.imshow('frame',frame)
    # if cv2.waitKey(wait_ms) & 0xFF == ord('q'):
    #     break

cap.release()

time.sleep(1)

img = cv2.imread('stream.jpg')   

text = pytesseract.image_to_string(img)

print(text)
