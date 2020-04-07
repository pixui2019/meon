@echo off

rem 进入批处理文件所在的路径
cd C:\page\page

echo ***** Replace "123" as "abc" *****
rem 定义要替换的新旧字符串
set strOld=target=_blank>C:\page\page\
set strNew=target=_blank>

rem 定义变量修改本地化延期
setlocal enabledelayedexpansion

rem 循环取出要处理的文件名
for /f "tokens=*" %%i in ('dir C:\page\page\list.txt /b /s') do (
    set "var=%%i"
    if not !var!.==. (
rem 单个文件一行行处理，将旧字段替换成新字段
    for /f "tokens=*" %%j in (!var!) do (
        set "tmp=%%j"
        if not !tmp!.==. (
          set "tmp=!tmp:%strOld%=%strNew%!"
          rem 将处理后的每一行记录追加到temp.txt文件中
          echo !tmp!>>temp.txt
        )
    )
    rem 在单个文件的每一行经过替换操作后，将处理后的文本从temp.txt临时文件剪贴到目标处理文件中(剪贴后临时文件会自动删除)
    move temp.txt !var!
    )
)

pause