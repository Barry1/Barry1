rem for /D %%D in (*) do pushd %%D & git pull & popd
rem ====================================================
rem c:\Users\EBELIN_B\bin\pueue\pueue-x86_64-pc-windows-msvc.exe group add --parallel 8 PullGroup

rem "c:\Program Files (x86)\RSMGMT\APPS\RSEMS\RSEMSExec.exe" /system "c:\Windows\System32\cmd.exe"
rem mklink pullall.bat Barry1\Windows\pullall.bat

for /D %%D in (*) do c:\Users\EBELIN_B\bin\pueue\pueue-x86_64-pc-windows-msvc.exe add --group PullGroup --working-directory C:\Users\EBELIN_B\GitHub\%%D "git pull"
c:\Users\EBELIN_B\bin\pueue\pueue-x86_64-pc-windows-msvc.exe status --group PullGroup

