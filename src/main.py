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
    notification.send()




if __name__ == "__main__":
    sendnofity(sys.argv[1],sys.argv[2])
    # sendnofity(1,2)
