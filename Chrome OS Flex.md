<https://chromiumdash.appspot.com/serving-builds?deviceCategory=Chrome%20OS%20Flex>

<https://dl.google.com/dl/edgedl/chromeos/recovery/chromeos_15183.69.0_reven_recovery_stable-channel_mp-v2.bin.zip>

<https://dl.google.com/dl/edgedl/chromeos/recovery/linux_recovery.sh>

<https://chromium.googlesource.com/chromiumos/user-recovery-tools/+/master/linux/recovery.sh>

Quelle: <https://support.google.com/chromeosflex/thread/153768896/chrome-os-flex-iso?hl=en>

## Anleitung Script

Here are the instructions for the Linux script:

On the Linux computer, download the Recovery Tool.
Change the script permissions to allow execution with the following command:
sudo chmod 755 linux_recovery.sh
Run the script with root privileges with the following command:
sudo bash linux_recovery.sh --config https://dl.google.com/dl/edgedl/chromeos/recovery/cloudready_recovery.conf
Follow the on-screen instructions to create recovery media.
To continue to recover your Chromebook, follow the steps above.

I added the `--config https://dl.google.com/dl/edgedl/chromeos/recovery/cloudready_recovery.conf` part above so it would get the 'reven' image.

## ISO aus GRUB

<https://www.linux-community.de/blog/iso-images-mit-grub-2-booten/>

## andere

<https://forum.xda-developers.com/t/guide-dual-boot-chromeos-with-linux-or-windows-on-almost-any-device.4394815/>

<https://github.com/sebanc/brunch/releases>
