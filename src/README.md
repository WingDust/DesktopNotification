<!--
 * @Author: your name
 * @Date: 2020-11-10 15:21:11
 * @LastEditTime: 2020-11-27 16:31:53
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \project\README.md
-->
## Notify
  > 使用 [notify-py](https://github.com/ms7m/notify-py) 来向桌面通知
  -  pyinstaller 编译
    - `$ pyinstaller -F -n notify -w -c -i .\ajdz6-njjvx-001.ico main.py`
  - 运行依赖
    - python38.dll
  - 由于通知使用了图标所以同路径下需要 `logo.png`
  > @LastEdit:2020年11月11日 星期三 19:22:43
  使用写入文件后再运行命令行程序来运行，不用传参数，通过文件读写来传信息

## notify-py 源码学习过程
  - __init__.py 文件作用
    - 用来控制当前目录为 python 包的文件范围
  - Reference
    - [Python __init__.py文件的作用](https://www.cnblogs.com/wcwnina/p/9329086.html)
  - f字符串
    - 格式化字符串
  - Reference
    - [python字符串前加 f 的含义](https://blog.csdn.net/qq_43463045/article/details/93890436)
