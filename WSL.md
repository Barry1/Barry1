# Windows Subsystem for linux

Just a collection of facts around this windows solution.

## Configuration

There is the `/etc/wsl.conf` file in which some options could be set, in every distribution.

This is only slightly commented. Have a look at the following links.

- <https://docs.microsoft.com/de-de/windows/wsl/wsl-config#configure-per-distro-launch-settings-with-wslconf>
- <https://itnext.io/wsl2-tips-limit-cpu-memory-when-using-docker-c022535faf6f#:~:text=Open,service>
- <https://github.com/MicrosoftDocs/WSL.de-DE/blob/live/WSL/wsl-config.md>
- <https://github.com/MicrosoftDocs/WSL.de-DE/blob/live/WSL/wsl-config.md#konfigurieren-globaler-optionen-mit-wslconfig>

```
# Enable extra metadata options by default
[automount]
enabled = true
root = /windir/
options = "metadata,umask=22,fmask=11"
mountFsTab = false

# Enable DNS – even though these are turned on by default, we'll specify here just to be explicit.
[network]
generateHosts = true
generateResolvConf = true
```
