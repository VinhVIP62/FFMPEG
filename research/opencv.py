import cv2
import pytesseract

# gray = cv2.imread('stream.jpg', cv2.IMREAD_GRAYSCALE)
# img = cv2.GaussianBlur(gray, (3, 3), .5)
img = cv2.imread('stream.jpg')   

bgr_image = cv2.imread('stream.jpg')
gray_image = cv2.cvtColor(bgr_image, cv2.COLOR_BGR2GRAY)
thresh = cv2.threshold(gray_image, 127, 255, cv2.THRESH_BINARY_INV + cv2.THRESH_OTSU)[1]
    

config = "--psm 6"
text = pytesseract.image_to_string(img, config=config)


print(text)

