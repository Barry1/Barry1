---
title: Information for using QNAP NAS
date: 17. August 2024
authro: Dr. Bastian Ebeling
---

## Setting fs2ck

I propose to do regular checking of EXT-filesystem.
In my opinion, the most elegant way is, to set in the EXT-Metadata

```sh
tune2fs -c 10 /dev/md0 # mount count 10
tune2fs -c 10 /dev/md9 # mount count 10
tune2fs -i 25d /dev/md0 # mount interval 25 days
tune2fs -i 25d /dev/md9
```

Explanations on these commands could be found [here](https://man7.org/linux/man-pages/man8/tune2fs.8.html).
