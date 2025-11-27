import pyautogui
import time

while True:
    x, y = pyautogui.position()
    pyautogui.moveTo(x + 10, y + 10, duration=0.2)
    pyautogui.moveTo(x, y, duration=0.2)
    time.sleep(3)
