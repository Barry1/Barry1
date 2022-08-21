# Just hints for running, using and administering Windows

## Repair Windows, Boot problems

### Links

[src1]: https://www.pcwelt.de/2058900 "PC-Welt: Windows-Reparatur: System ohne Neuinstallation retten"
[is1]: https://archive.is/siXtb "Windows-Reparatur: System ohne Neuinstallation retten"
[org1]: https://web.archive.org/web/https://www.pcwelt.de/2058900 "Windows-Reparatur: System ohne Neuinstallation retten"
[src2]: https://www.heise.de/tipps-tricks/Windows-10-reparieren-so-geht-s-4208457.html "Heise: Windows 10 reparieren - so geht's"
[is2]: https://archive.is/bqmyg "Windows 10 reparieren - so geht's"
[org2]: https://web.archive.org/web/https://www.heise.de/tipps-tricks/Windows-10-reparieren-so-geht-s-4208457.html "Windows 10 reparieren - so geht's"

| Source                                                        | archive.is | archive.org |
| ------------------------------------------------------------- | ---------- | ----------- |
| [Windows-Reparatur: System ohne Neuinstallation retten][src1] | [is1]      | [org1]      |
| [Windows 10 reparieren - so geht's][src2]                     | [is2]      | [org2]      |

### Essentials

#### Make Dummy Menu Entry to get time for selection of boot options

```cmd
bcdedit /copy {current} /d "Dummy"
bcdedit /timeout 3
```

#### Fix Boot Manager etc.

```cmd
bootrec /fixmbr
bootrec /fixboot
bootrec /rebuildbcd
```

#### SFC

```cmd
sfc /scannow
```

#### DISM

```cmd
dism /Online /Cleanup-Image /ScanHealth
dism /Online /Cleanup-Image /CheckHealth
dism /Online /Cleanup-Image /RestoreHealth
```
