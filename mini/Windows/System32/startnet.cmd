@echo off
mode con cols=16 lines=1
cd /d %systemroot%\system32

::::��ʼ
set desktop=%USERPROFILE%\desktop
set QuickLaunch=X:\users\Default\AppData\Roaming\Microsoft\internet Explorer\Quick Launch\User Pinned\TaskBar
set StartMenu=X:\users\Default\AppData\Roaming\Microsoft\windows\Start Menu
set root=X:\windows\system32
set wait=pecmd wait 1000 
::::������ʾ
if not exist "X:\Program Files\WinXShell.exe" (
set say=%root%\pecmd.exe TEAM TEXT "
set hello=echo ...
set font="L300 T300 R768 B768 $30^|wait 800 
set wait=echo ...
set xsay=echo ...
set show=echo ...
set xshow=echo ...
) else (
set font=
set say=start "" "X:\Program Files\WinXShell.exe" -ui -jcfg wxsUI\UI_led.zip -text
set hello=start "" "X:\Program Files\WinXShell.exe" -ui -jcfg wxsUI\UI_led.zip -wait 2 -scroll -text
set show=start "" "X:\Program Files\WinXShell.exe" -ui -jcfg wxsUI\UI_show.zip -top -text
set xsay=start "" "X:\Program Files\WinXShell.exe" -code "QuitWindow(nil,'UI_LED')"
set xshow=start "" "X:\Program Files\WinXShell.exe" -code "QuitWindow(nil,'UI_show')"
set wait=%root%\pecmd.exe wait 800
)
if not "%2" == "" set args1=%1&&set args2=%2&&goto startjob
::���ýű�1����

echo ע��32λ�� msi.dll
echo Regsvr32.exe /s %WinDir%\System32\Msi.dll
echo if exist "%WinDir%\SysWOW64\Msi.dll" %WinDir%\SysWOW64\Regsvr32.exe /s %WinDir%\SysWOW64\Msi.dll

::����ʱ������ݷ�ʽ winxShell�ӹ�����ͼ��
::pecmd LINK %StartMenu%\����С����BOOTICE,%ProgramFiles%\OTHERS\BOOTICE.EXE
::pecmd LINK %StartMenu%\�ļ�����,%ProgramFiles%\EVERYTHING\EVERYTHING.EXE
::pecmd LINK %StartMenu%\��������DiskGenius,%ProgramFiles%\DiskGenius\DiskGenius.exe 
if exist "X:\Program Files\wifi.wcs" start "" %root%\pecmd.exe LINK "%QuickLaunch%\����wifi",%root%\pecmd.exe,%programfiles%\wifi.wcs,%root%\ico\wifi.ico
::start "" "X:\Program Files\WinXShell.exe" -ui -jcfg wxsUI\UI_WIFI\main.jcfg -hidewindow


::Ԥ���ؿ�ݷ�ʽ
start "" %root%\pecmd.exe LINK %Desktop%\iSCSI �������,%root%\iscsicpl.exe,,%root%\ico\iscsicli.ico
start "" %root%\pecmd.exe LINK %Desktop%\iSCSI �����,%ProgramFiles%\Others\iscsiconsole.exe
start "" %root%\pecmd.exe LINK %Desktop%\PE �������,%ProgramFiles%\PENetwork\PENetwork.exe
start "" %root%\pecmd.exe LINK %Desktop%\SkyIAR ����ע��,%ProgramFiles%\Others\skyiar.exe
start "" %root%\pecmd.exe LINK %Desktop%\SoftMgr ��������,%ProgramFiles%\SoftMgr\QQPCSoftMgr.exe
start "" %root%\pecmd.exe LINK %Desktop%\Զ�̹���,"%ProgramFiles%\winxshell.exe","%ProgramFiles%\Remote Control Tool",%root%\ico\remote.ico
start "" %root%\pecmd.exe LINK "%Desktop%\BatchTools ��ɫС����","%ProgramFiles%\winxshell.exe","%ProgramFiles%\BatchTools",%root%\ico\batch.ico
start "" %root%\pecmd.exe LINK "%ProgramFiles%\Remote Control Tool\mstscԶ��_console","%WinDir%\mstsc.exe",/console,"%WinDir%\mstsc.exe"
start "" %root%\pecmd.exe LINK "%ProgramFiles%\Remote Control Tool\mstscԶ��","%WinDir%\mstsc.exe",,"%WinDir%\mstsc.exe"
start "" %root%\pecmd.exe LINK "%Desktop%\Microsoft Edge","%ProgramFiles%\edge\edge.bat",,"%ProgramFiles%\edge\edge.ico"
start "" %root%\pecmd.exe LINK "%Desktop%\��ѶQQ","%ProgramFiles%\qq\qq.bat",,"%ProgramFiles%\QQ\QQ.ico"
start "" %root%\pecmd.exe LINK "%Desktop%\΢��","%ProgramFiles%\Wechat\Wechat.bat",,"%ProgramFiles%\Wechat\WeChat.ico"

:startmenu
%say% "���ؿ�ʼ�˵�..."
if exist "X:\Program Files\Classic Shell\ClassicStartMenu.exe" (
regedit /s "X:\Program Files\Classic Shell\cs.reg"
start "" "X:\Program Files\Classic Shell\ClassicStartMenu.exe"
)
%xsay%


::����ע�������ʼ��
regedit /s pe.reg
wpeinit



echo �ļ������
set pcname=%time:~3,2%%random:~0,2%
%say% "�޸ļ������ΪPE%pcname%..." %font%
reg add "HKLM\SYSTEM\ControlSet001\Control\ComputerName\ComputerName" /f /v "ComputerName" /t REG_SZ /d "PE%pcname%"
reg add "HKLM\SYSTEM\ControlSet001\Control\ComputerName\ActiveComputerName" /f /v "ComputerName" /t REG_SZ /d "PE%pcname%"
reg add "HKLM\SYSTEM\ControlSet001\services\Tcpip\Parameters" /f /v "hostname" /t REG_SZ /d "PE%pcname%"
reg add "HKLM\SYSTEM\ControlSet001\services\Tcpip\Parameters" /f /v "NV Hostname" /t REG_SZ /d "PE%pcname%"
reg add "HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName" /f /v "ComputerName" /t REG_SZ /d "PE%pcname%"
reg add "HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ActiveComputerName" /f /v "ComputerName" /t REG_SZ /d "PE%pcname%"
reg add "HKLM\SYSTEM\CurrentControlSet\services\Tcpip\Parameters" /f /v "hostname" /t REG_SZ /d "PE%pcname%"
reg add "HKLM\SYSTEM\CurrentControlSet\services\Tcpip\Parameters" /f /v "NV Hostname" /t REG_SZ /d "PE%pcname%"
%xsay%
::����LED��ʾ 
%show% �������:PE%pcname%

goto installdrivers
:resetcom
%say% "����COM��LPT��..."
:::(0400 0401 0500 0501 0502 0A05 0B00 0200 0800 0100 0001)
for %%a in (0400 0401 0500 0501 0502) do (
devcon disable *pnp%%a*
devcon enable *pnp%%a*
)
::start "" /min devcon rescan
%xsay%

::%say% "�������繲����ط���..." %font%
::net start lanmanserver>nul
::net start lanmanworkstation>nul
::%xsay%

:installdrivers
%say% "���ڰ�װ����..."
echo ��ѹ��������
if exist %systemroot%\system32\drivers.7z  (
:::::7z x drivers.7z -o%temp%\pe-driver\drivers
DriverIndexer.exe load-driver drivers.7z drivers.index
)
%xsay%



:mklinktoipxefm
%say% "�����ļ���Ipxefm"
mklink "X:\ipxefm\app\inject\default\DiskGeniusx86.exe" "X:\Program Files\DiskGenius\DiskGenius.exe"
mklink "X:\ipxefm\app\inject\default\cgix64.exe" "X:\Program Files\GhostCGI\CGI-plus_x64.exe"
mklink "X:\ipxefm\app\inject\default\ghostx64.exe" "X:\Program Files\GhostCGI\ghost64.exe" 
mklink "X:\ipxefm\app\inject\default\ShowDrives_Gui_x64.exe" "X:\Windows\System32\pecmd.exe" 
mklink "X:\ipxefm\app\inject\default\drivers.7z" "X:\Windows\System32\drivers.7z" 
::����ipxefm���ļ���PE����
mklink "X:\Program Files\Remote Control Tool\TightVNC-Զ�̿���.exe" "%SystemDrive%\ipxefm\bin\tvnviewer.exe" 
%xsay%
if exist "X:\ipxefm\app\inject\default\sysx64.exe" start "" /w "X:\ipxefm\app\inject\default\sysx64.exe"
reg add "HKCU\SOFTWARE\TightVNC\Server" /v UseVncAuthentication /t REG_DWORD /d 0x0 /f
reg add "HKCU\SOFTWARE\TightVNC\Server" /v UseControlAuthentication /t REG_DWORD /d 0x0 /f
reg add "HKCU\SOFTWARE\TightVNC\Server" /v DisconnectClients /t REG_DWORD /d 0x0 /f
reg add "HKCU\SOFTWARE\TightVNC\Server" /v DisconnectAction /t REG_DWORD /d 0x0 /f
if exist %root%\tightvnc\tvnserver.exe start "" %root%\tightvnc\tvnserver.exe -run
::��������ģʽstart "" "%root%\tightvnc\tvnserver.exe" -controlapp -connect %ip%
::start "" pecmd.exe --imdisk-S
::start "" pecmd.exe --UnReg-System
%xsay%

:regright
%say% "ע���Ҽ�..."
rem ע���Ҽ�
:::start "" pecmd.exe --Reg-All
::start "" pecmd --Reg-2REG
%xsay%

echo �Ҽ��˵�
reg delete "HKLM\SOFTWARE\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\services" /f 
reg delete "HKLM\SOFTWARE\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\�������" /f 
echo ��DriverIndexer��װ����
reg add "HKCR\*\shell\��DriverIndexer��װ����" /f /v "icon" /t REG_SZ /d "X:\Windows\System32\ico\mycomput.ico"
reg add "HKCR\*\shell\��DriverIndexer��װ����\command" /f /ve /t REG_SZ /d "\"X:\windows\system32\Driverindexer\" load-driver \"%%1\""
reg add "HKCR\7-Zip.7z\shell\��DriverIndexer��װ����" /f /v "icon" /t REG_SZ /d "X:\Windows\System32\ico\mycomput.ico"
reg add "HKCR\7-Zip.7z\shell\��DriverIndexer��װ����\command" /f /ve /t REG_SZ /d "\"X:\windows\system32\Driverindexer\" load-driver \"%%1\""
reg add "HKCR\folder\shell\��DriverIndexer��װ����" /f /v "icon" /t REG_SZ /d "X:\Windows\System32\ico\mycomput.ico"
reg add "HKCR\folder\shell\��DriverIndexer��װ����\command" /f /ve /t REG_SZ /d "\"X:\windows\system32\Driverindexer\" load-driver \"%%1\""

echo Smb��������
::reg add "HKCR\*\shell\ӳ������������(N)" /f /v "icon" /t REG_SZ /d "X:\Windows\System32\ico\mycomput.ico"
reg add "HKCR\folder\shell\ӳ������������(N)\command" /f /ve /t REG_SZ /d "X:\windows\smb.bat"
reg add "HKCR\folder\shell\ӳ������������(N)" /f /v "Position" /t REG_SZ /d "Middle"

reg add "HKCR\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\ӳ������������(N)\command" /f /ve /t REG_SZ /d "X:\windows\smb.bat"
reg add "HKCR\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\ӳ������������(N)" /f /v "Position" /t REG_SZ /d "Middle"

::reg add "HKCR\*\shell\�Ͽ�����������������(C)" /f /v "icon" /t REG_SZ /d "X:\Windows\System32\ico\mycomput.ico"
reg add "HKCR\folder\shell\�Ͽ�����������������(C)\command" /f /ve /t REG_SZ /d "net use * /delete /y"
reg add "HKCR\folder\shell\�Ͽ�����������������(C)" /f /v "Position" /t REG_SZ /d "Middle"
reg add "HKCR\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}shell\�Ͽ�����������������(C)\command" /f /ve /t REG_SZ /d "net use * /delete /y"

echo ����Ŀ��Ŀ¼
reg add "HKCR\folder\shell\����\command" /f /ve /t REG_SZ /d "X:\windows\smb.bat netshare %%1"
reg add "HKCR\folder\shell\����" /f /v "Position" /t REG_SZ /d "Middle"

echo ʹ��&Notepad++ �༭
reg add "HKCR\*\shell\NotePad++" /f /ve /t REG_SZ /d "ʹ��&Notepad++ �༭"
reg add "HKCR\*\shell\NotePad++" /f /v "Icon" /t REG_SZ /d "X:\Program Files\Notepad++\notepad++.exe"
reg add "HKCR\*\shell\NotePad++\Command" /f /ve /t REG_SZ /d "X:\Program Files\Notepad++\notepad++.exe \"%%1\""


echo �ü��±��򿪸��ļ�
reg add "HKCR\*\shell\Notepad" /f /ve /t REG_SZ /d "�ü��±��򿪸��ļ�(&F)"
reg add "HKCR\*\shell\Notepad" /f /v "Icon" /t REG_SZ /d "notepad.exe"
reg add "HKCR\*\shell\Notepad\Command" /f /ve /t REG_SZ /d "notepad \"%%1\""

echo 5�󹤾�ȫע���
reg add "HKCR\.reg\shell\reg2cmd" /f /ve /t REG_SZ /d "ת��Ϊcmd�ļ�"
reg add "HKCR\.reg\shell\reg2cmd" /f /v "Icon" /t REG_SZ /d "\"X:\Windows\System32\pecmd.exe\",6"
reg add "HKCR\.reg\shell\reg2cmd\command" /f /ve /t REG_SZ /d "\"X:\Windows\System32\pecmd.exe\" --reg2cmd \"%%1\""
reg add "HKCR\.reg\shell\reg2inf" /f /ve /t REG_SZ /d "ת��Ϊinf�ļ�"
reg add "HKCR\.reg\shell\reg2inf" /f /v "Icon" /t REG_SZ /d "\"X:\Windows\System32\pecmd.exe\",6"
reg add "HKCR\.reg\shell\reg2inf\command" /f /ve /t REG_SZ /d "\"X:\Windows\System32\pecmd.exe\" --reg2inf \"%%1\""
reg add "HKCR\.reg\shell\reg2wcs" /f /ve /t REG_SZ /d "ת��Ϊwcs�ļ�"
reg add "HKCR\.reg\shell\reg2wcs" /f /v "Icon" /t REG_SZ /d "\"X:\Windows\System32\pecmd.exe\",6"
reg add "HKCR\.reg\shell\reg2wcs\command" /f /ve /t REG_SZ /d "\"X:\Windows\System32\pecmd.exe\" --reg2wcs \"%%1\""
reg add "HKCR\Directory\shell\MaxCab" /f /ve /t REG_SZ /d "CAB���ѹ��"
reg add "HKCR\Directory\shell\MaxCab" /f /v "Icon" /t REG_SZ /d "\"X:\Windows\System32\pecmd.exe\",9"
reg add "HKCR\Directory\shell\MaxCab\command" /f /ve /t REG_SZ /d "\"X:\Windows\System32\pecmd.exe\" --MaxCab \"%%1\""



%say% "���ڼ�������..."
if exist %systemroot%\pecmd.ini  (
start "" pecmd load %systemroot%\pecmd.ini
%xsay%
)
%xsay%

:sharex
%say% "��ȫ����X��ΪX..."
::����ͼ��ָʾ
net start netprofm
start "" pecmd exec! net share X=X:\ /grant:everyone,full /y

if exist %systemroot%\system32\startup.bat start "" %systemroot%\system32\startup.bat
%xsay%
%xsay%
exit
