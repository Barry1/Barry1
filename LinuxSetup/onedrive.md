# Using Microsoft OneDrive in Linux

## Installation

With the command `sudo apt install onedrive` the utility and daemon will be installed.

## Authentification

With the first run of `onedrive` you will be prompted to open a URL and authenticate the connection to your online account.
After enabling the access, you end in an empty website. Just copy the URI of that one and paste it into the awaiting command. 

## Configuration

The global (default) configuration resides in the file `/usr/lib/systemd/user/onedrive.service`.
The idea is to reduce the nicelevel and change nothing more.
With the command `systemctl --user edit onedrive.service` the editor pops up.
Now insert the following lines between the comments

```INI
[Service]
Nice = 15
```

With the command `systemctl --user cat onedrive.service` you can now see the _compiled_ configuration based on the default and our single change.

To see all configured settings, just ran `systemctl --user show onedrive.service`.
