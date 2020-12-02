
import os
import sys

from notifypy import Notify

def sendnofy():
    #print(os.path.split(os.path.realpath(sys.argv[0])))
    #print(os.getcwd()) # 运行路径在调用函数的 buffer 文件目录下
    with open('E:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\notify\\Record.txt','r',encoding='utf-8') as f:
        notification = Notify()
        notification.title = f.readline()
        notification.message = f.readline()
        notification.icon = "E:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\notify\\logo.png"
        # notification.audio = ""
        notification.send()

if __name__ == "__main__":
    sendnofy()