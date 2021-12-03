# Windows Subsystem for linux

Just a collection of facts around this windows solution.

## Configuration

You can finde many descriptions [here](https://docs.microsoft.com/en-us/windows/wsl/wsl-config) or within the text below.

### Global configuration

For global settings the `.wslconfig` file is to be used. It has to be placed at `%USERPROFILE%\.wslconfig`

The documentation is placed [here](https://docs.microsoft.com/en-us/windows/wsl/wsl-config#wsl-2-settings).

See the example

```text
[wsl2]
kernel=C:\\temp\\myCustomKernel
memory=4GB # Limits VM memory in WSL 2 to 4 GB
processors=2 # Makes the WSL 2 VM use two virtual processors
```

### Configuration per Distribution

There is the `/etc/wsl.conf` file in which some options could be set, in every distribution.

The documentation on the options is to be found [here](https://docs.microsoft.com/en-us/windows/wsl/wsl-config#configuration-options).

This is only slightly commented. Have a look at the following links.

* [https://docs.microsoft.com/de-de/windows/wsl/wsl-config\#configure-per-distro-launch-settings-with-wslconf](https://docs.microsoft.com/de-de/windows/wsl/wsl-config#configure-per-distro-launch-settings-with-wslconf)
* [https://itnext.io/wsl2-tips-limit-cpu-memory-when-using-docker-c022535faf6f\#:~:text=Open,service](https://itnext.io/wsl2-tips-limit-cpu-memory-when-using-docker-c022535faf6f#:~:text=Open,service)
* [https://github.com/MicrosoftDocs/WSL.de-DE/blob/live/WSL/wsl-config.md](https://github.com/MicrosoftDocs/WSL.de-DE/blob/live/WSL/wsl-config.md)
* [https://github.com/MicrosoftDocs/WSL.de-DE/blob/live/WSL/wsl-config.md\#konfigurieren-globaler-optionen-mit-wslconfig](https://github.com/MicrosoftDocs/WSL.de-DE/blob/live/WSL/wsl-config.md#konfigurieren-globaler-optionen-mit-wslconfig)

```text
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

for a general description on installation and further, have a look at [https://www.windowscentral.com/how-install-wsl2-windows-10](How to install Linux WSL2 on Windows 10 and Windows 11)
