---
title: Information for using QNAP NAS
date: 17. August 2024
authro: Dr. Bastian Ebeling
---

## Setting fs2ck

I propose to do regular checking of EXT-filesystem.
In my opinion, the most elegant way is, to set in the EXT-Metadata

```sh
tune2fs -c 10 /dev/md0
tune2fs -c 10 /dev/md9
tune2fs -i 25 /dev/md0
tune2fs -i 25 /dev/md9
```
