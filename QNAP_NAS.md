---
title: Information for using QNAP NAS
date: 17. August 2024
authro: Dr. Bastian Ebeling
---

## Setting fs2ck

Getting information on last check details by `sudo tune2fs -l /dev/sda1 | egrep -i "mount count|Check interval|Last|Next"`.

I propose to do regular checking of EXT-filesystem.
In my opinion, the most elegant way is, to set in the EXT-Metadata

```sh
tune2fs -c 10 -i 25d /dev/sda4 # mount count 10, interval 25 days
tune2fs -c 10 -i 25d /dev/md0 # mount count 10, interval 25 days
tune2fs -c 10 -i 25d /dev/md9 # mount count 10, interval 25 days
```

Explanations on these commands could be found [here](https://man7.org/linux/man-pages/man8/tune2fs.8.html).

### Manual

The following commands are inspired by [this](https://maciej.lasyk.info/2023/Jan/05/unmounting-qnap-system-volume-to-perform-e2fsck/).

```sh
cd /
/etc/init.d/services.sh stop
/etc/init.d/opentftp.sh stop
/etc/init.d/Qthttpd.sh stop
umount /dev/md0 && e2fsck -p -v -C 0 /dev/md0 && mount /dev/md0 /share/MD0_DATA
```
