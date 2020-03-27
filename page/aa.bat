@echo off
setlocal
 
set LISTFILE=list.html
echo MAKING LISTFILE … (PLEASE WAIT)
echo ^<!doctype html^>         > %LISTFILE%
echo ^<html^>      >> %LISTFILE%
echo ^<head^>      >> %LISTFILE%
echo ^<meta charset="GB2312"^>  >> %LISTFILE%
echo ^<title^>显示当前文件夹目录下文件列表^</title^>   >> %LISTFILE%
echo ^<style type=text/css^>A:link{FONT-SIZE:9pt;COLOR:#000000;TEXT-DECORATION: none}      >> %LISTFILE%
echo A:visited{FONT-SIZE:9pt;COLOR:#000000;TEXT-DECORATION:none}A:hover{COLOR:#ff0000; >> %LISTFILE%
echo TEXT-DECORATION: underline}BODY{FONT-SIZE:9pt}TABLE{FONT-SIZE:9pt}^</style^>     >> %LISTFILE%
echo ^</head^>     >> %LISTFILE%
echo ^<body^>     >> %LISTFILE%
echo [PROCESSED BY %0]^<br^> >> %LISTFILE%
for /f "tokens=* delims=" %%i in ('dir *.* /a:-d/s/b') do (
echo ^<a href="%%i" target=_blank^>%%i^</a^>^<br^> >> %LISTFILE%
)
echo ^</body^>    >> %LISTFILE%
echo ^</html^>      >> %LISTFILE%
start .\%LISTFILE%