@echo off
:: ��鵱ǰ·���Ƿ����C:
set cu_path=%~dp0
if "%cu_path:~0,2%" == "C:" (
echo ��ֹ��C�����б�������! ��ǰ·������C:����ֹ���д�������
pause
exit /b
)
cd /d %~dp0
if not "%SystemDrive%" == "C:" echo WinPE&&goto start 
:: ��ȡ����ԱȨ������������
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs" 1>nul 2>nul
exit /b
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" ) 1>nul 2>nul
cd /d %~dp0
:start
mode con cols=65 lines=30
set bootwim=sources\boot.wim
title TFTP�������ʵ���,��ǰ����:"\%bootwim%"
set "result=!path:~0,2!"
if exist %~dp0Boot\BCD del /q /f %~dp0Boot\BCD
:bd_bcd
set pxeid={19260817-6666-8888-f00d-caffee000009}
bcdedit.exe /createstore Boot\BCD
bcdedit.exe /store Boot\BCD /create {ramdiskoptions} /d "Ramdisk options"
bcdedit.exe /store Boot\BCD /set {ramdiskoptions} ramdisksdidevice boot
bcdedit.exe /store Boot\BCD /set {ramdiskoptions} ramdisksdipath \Boot\boot.sdi
bcdedit.exe /store Boot\BCD /create %pxeid% /d "winpe boot image" /application osloader
bcdedit.exe /store Boot\BCD /set %pxeid% device ramdisk=[boot]\%bootwim%,{ramdiskoptions} 
rem bcdedit.exe /store Boot\BCD /set %pxeid% path \windows\system32\winload.exe 
bcdedit.exe /store Boot\BCD /set %pxeid% osdevice ramdisk=[boot]\%bootwim%,{ramdiskoptions} 
bcdedit.exe /store Boot\BCD /set %pxeid% systemroot \windows
bcdedit.exe /store Boot\BCD /set %pxeid% detecthal Yes
bcdedit.exe /store Boot\BCD /set %pxeid% winpe Yes
bcdedit.exe /store Boot\BCD /set %pxeid% highestmode Yes
bcdedit.exe /store Boot\BCD /create {bootmgr} /d "boot manager"
bcdedit.exe /store Boot\BCD /set {bootmgr} timeout 30 
bcdedit.exe /store Boot\BCD -displayorder %pxeid% -addlast
rem �ر�metro����
bcdedit /store Boot\BCD /set %pxeid% bootmenupolicy legacy
:menu_init
cls
echo ����BCD�����˵����...
:tftpblocksizemenu
title TFTP�������ʵ���,��ǰ����:"\%bootwim%"
echo �޸Ĵ������ʣ���ѡ��һ��ѡ��!
echo --------------------- 
echo 1. ������ [���ܲ��ȶ�]
echo ---------------------
echo 2. ����   [�Ƽ�]
echo ---------------------  
echo 3. �е�
echo ---------------------   
echo 4. ����   [���粻�ȶ�ѡ��]
echo ---------------------  
echo 5. ��������PE ��ǰ:"\%bootwim%"   [��ʱ��֧��WIM]
echo ---------------------

set /p choice=���������ѡ��1-5��Ȼ�󰴻س���:
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' set blocksize=16384
if '%choice%'=='2' set blocksize=8192
if '%choice%'=='3' set blocksize=4096
if '%choice%'=='4' set blocksize=512
if '%choice%'=='5' goto selbootwim
if '%choice%'=='' echo ��Ч��ѡ��, ����������. &&goto menu
bcdedit /store Boot\BCD /set {ramdiskoptions} ramdisktftpblocksize %blocksize%
echo �޸����
timeout 2 /nobreak
exit /b

:selbootwim
cls
echo ��ѡ��WIM�ļ���ΪPE��RamOS����
echo __________________________________
setlocal enabledelayedexpansion
set n=0
for /f %%i in ('dir /b /s %~dp0*.wim') do (
set /a n+=1
set pc!n!=%%i
@echo !n!.%%i  
)
echo __________________________________
echo [ʷ����ΰ������Ϲ�㹤���ҳ�Ʒ]
set /p sel=��ѡ������:
set bootwim=!pc%sel%!
:: ���õ�ǰ·����bootwim����
set "currentPath=%~dp0"
set "bootwim=!bootwim:%currentPath%=!
bcdedit.exe /store Boot\BCD /set %pxeid% device ramdisk=[boot]\%bootwim%,{ramdiskoptions}
bcdedit.exe /store Boot\BCD /set %pxeid% osdevice ramdisk=[boot]\%bootwim%,{ramdiskoptions} 
goto menu_init
exit /b


