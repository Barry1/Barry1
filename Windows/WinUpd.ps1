#https://itigic.com/de/how-to-update-windows-10-from-cmd-or-powershell/?expand_article=1
Install-Module PSWindowsUpdate
Set-ExecutionPolicy Unrestricted
Get-WindowsUpdate
Get-WindowsUpdate -KBArticleID KB2267602, KB4533002 -Install
