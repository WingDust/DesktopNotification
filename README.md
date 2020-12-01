<!--
 * @Author: your name
 * @Date: 2020-11-10 15:21:11
 * @LastEditTime: 2020-12-01 21:55:41
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
  使用写入文件后再运行命令行程序来运行，不用传参数，通过文件读写来传信息

  > @LastEdit:2020年11月11日 星期三 19:22:43

## notify-py 源码学习过程
  - __init__.py 文件作用
    - 用来控制当前目录为 python 包的文件范围
  - Reference
    - [Python __init__.py文件的作用](https://www.cnblogs.com/wcwnina/p/9329086.html)
  - f字符串
    - 格式化字符串
  - Reference
    - [python字符串前加 f 的含义](https://blog.csdn.net/qq_43463045/article/details/93890436)
  - 

## notify-py PR 参考
  > @startDate:2020年11月28日 星期六 13:03:24

  - 在 notify-py 中对 windows 系统的桌面通知通过写入的 powershell 文件来执行通知
    > 当下面的代码**带有中文或者emoji表情时**中 open() 写入的 powershell 会乱码 
    > 原因：写入文件没有 BOM 标识
    ```python
    -  with open(
    +  with codecs.open(
        f"{temp_dir}/{generated_uuid_file}.ps1", "w", 'utf_8_sig'
    ) as ps1_file:
          ps1_file.write(generated_file)
    ```
  - 解决方案[python写utf-8文件的问题](https://segmentfault.com/q/1010000000131965)
    - Reference
    -[python 检测文件编码是否是utf-8无bom](https://blog.csdn.net/shuryuu/article/details/80564074)

## Elisp Reference
  - [Emacs Lisp 速成](https://segmentfault.com/a/1190000004910645)
    - w32-shell-execute
      > 经过测试在 buffer 中调用的函数中包含使用了 w32-shell-execute 会使它运行路径为 buffer 文件目录
    - f-write-text
      > 经过测试 f-write-text 在读写 C盘文件时会被管理员权限限制，
      > 可能解决方案：Emacs 以管理员运行
  > @lastEdit:2020年12月01日 星期二 21:55:33
