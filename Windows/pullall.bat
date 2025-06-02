rem for /D %%D in (*) do pushd %%D & git pull & popd
rem ====================================================
rem c:\Users\EBELIN_B\bin\pueue\pueue-x86_64-pc-windows-msvc.exe group add --parallel 8 PullGroup
for /D %%D in (*) do c:\Users\EBELIN_B\bin\pueue\pueue-x86_64-pc-windows-msvc.exe add --group PullGroup --working-directory C:\Users\EBELIN_B\GitHub\%%D "git pull"
c:\Users\EBELIN_B\bin\pueue\pueue-x86_64-pc-windows-msvc.exe status --group PullGroup

