@echo off

rem �����������ļ����ڵ�·��
cd C:\page\page

echo ***** Replace "123" as "abc" *****
rem ����Ҫ�滻���¾��ַ���
set strOld=target=_blank>C:\page\page\
set strNew=target=_blank>

rem ��������޸ı��ػ�����
setlocal enabledelayedexpansion

rem ѭ��ȡ��Ҫ������ļ���
for /f "tokens=*" %%i in ('dir C:\page\page\list.txt /b /s') do (
    set "var=%%i"
    if not !var!.==. (
rem �����ļ�һ���д��������ֶ��滻�����ֶ�
    for /f "tokens=*" %%j in (!var!) do (
        set "tmp=%%j"
        if not !tmp!.==. (
          set "tmp=!tmp:%strOld%=%strNew%!"
          rem ��������ÿһ�м�¼׷�ӵ�temp.txt�ļ���
          echo !tmp!>>temp.txt
        )
    )
    rem �ڵ����ļ���ÿһ�о����滻�����󣬽��������ı���temp.txt��ʱ�ļ�������Ŀ�괦���ļ���(��������ʱ�ļ����Զ�ɾ��)
    move temp.txt !var!
    )
)

pause