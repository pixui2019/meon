@ECHO OFF
TITLE ������...
COLOR A
::===������===
::
set "file=list.html"
::ָ��Ҫ������ļ�.
set "wd=page"
::ָ��Ҫ���ҵ��ַ���.
set "rwd=123"
::������ҵ�����ַ���,�����滻Ϊ...
::
::===������===
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
TITLE �������!
echo �������!
pause>nul