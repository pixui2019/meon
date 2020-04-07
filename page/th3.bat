@ECHO OFF
TITLE 处理中...
COLOR A
::===设置区===
::
set "file=list.html"
::指定要处理的文件.
set "wd=page"
::指定要查找的字符串.
set "rwd=123"
::如果查找到这个字符串,将它替换为...
::
::===设置区===
set "nf=NewFile(%random%-%random%-%random%-%random%-%random%-%random%-%random%)%file%"
set fso=CreateObject("Scripting.FileSystemObject")
findstr /c:"%wd%" "%file%">nul
if "%errorlevel%"=="1" goto ok
mshta.exe VBScript:%fso%.CreateTextFile("%nf%",True).Write(Replace(%fso%.OpenTextFile("%file%",1).ReadAll,"%wd%","%rwd%"))(Close)
for /f %%i in ("%file%") do set fn=%%~nxi
del /s /q /f "%file%">nul
rename "%nf%" "%fn%">nul
taskkill /f /im "mshta.exe">nul
:ok
cls
TITLE 处理完毕!
echo 处理完毕!
pause>nul