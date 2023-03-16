#!/bin/sh
sudo modprobe zram
sudo zramctl --find --size 1G
sudo mkswap /dev/zram0
sudo swapon /dev/zram0 --priority 4478
#https://www.linux-community.de/ausgaben/linuxuser/2018/07/sauber-entlueftet/2/
