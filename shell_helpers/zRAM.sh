#!/bin/sh
# https://www.linux-community.de/ausgaben/linuxuser/2018/07/sauber-entlueftet/2/
sudo modprobe zram
# sudo zramctl --find --size 3500MiB
zDEVICE=$(sudo zramctl --find --size 3,5GiB)
sudo mkswap "${zDEVICE}"
sudo swapon "${zDEVICE}" --priority 4478
sudo zramctl --output-all
