'''
Author: your name
Date: 2020-10-07 21:41:18
LastEditTime: 2020-11-19 10:23:05
LastEditors: Please set LastEditors
Description: In User Settings Edit
FilePath: \electron-vue-vitec:\Users\Administrator\Desktop\notification\project\src\main.py
'''
import sys
import os
from notifypy import Notify
# notification = Notify()
# notification.title = "Cool "
# notification.message = "Event "

def sendnofity(title,message):
    notification = Notify()
    notification.title = title
    notification.message = message
    notification.icon = "./logo.png"
    # notification.audio = ""
    notification.send()




if __name__ == "__main__":
    sendnofity(sys.argv[1],sys.argv[2])
    # sendnofity(1,2)

