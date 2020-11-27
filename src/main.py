# import sys
from notifypy import Notify

# def sendnofity(title,message):
def sendnofity():
    with open('Record.txt','r',encoding='utf-8') as f:
        # print(f.readline())
        # print(f.readline())
        notification = Notify()
        # notification.title = f.readline()
        t = '我我'
        t = t.encode('gbk')
        t = t.decode('gbk')
        notification.title = t
        notification.message = f.readline()
        notification.icon = "./logo.png"
        # notification.audio = ""
        notification.send()




if __name__ == "__main__":
    # sendnofity(sys.argv[1],sys.argv[2])
    sendnofity()
    # sendnofity(1,2)

