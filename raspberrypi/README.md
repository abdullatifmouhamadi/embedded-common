https://archlinuxarm.org/platforms/armv6/raspberry-pi
https://archlinuxarm.org/platforms/armv6/raspberry-pi


## setup 
## __________________________________________________________________________________________
https://github.com/Jguer/yay
```
pacman -S git
pacman -S base-devel go
```
-> kernel tools
```
pacman -S dtc asp

```
-> extra
```
pacman -S screenfetch
```





## installing Wifi: netctl 
## __________________________________________________________________________________________
https://wiki.archlinux.fr/netctl
https://wiki.archlinux.org/index.php/Netctl
https://raspberrypi.stackexchange.com/questions/7987/wifi-configuration-on-arch-linux-arm
```
install -m640 examples/wireless-wpa wirelesshome
netctl start wirelesshome
netctl enable wirelesshome
```

## MRAA
## __________________________________________________________________________________________
https://docs.labs.mediatek.com/resource/linkit-smart-7688/en/tutorials/peripheral-support-on-linkit-smart-7688-development-board/using-mraa-in-python

https://github.com/eclipse/mraa/blob/master/docs/building.md


```
sudo pacman -S python python-pip
git clone https://github.com/abdullatifmouhamadi/archlinux.git
makepkg -si

```

## RF24
## __________________________________________________________________________________________
http://tmrh20.github.io/RF24/
https://github.com/nRF24/RF24
https://tmrh20.github.io/RF24/Linux.html
https://tmrh20.github.io/RF24/CrossCompile.html


CrossCompile:
```
sudo pacman -S expect dejagnu
yay -S arm-linux-gnueabihf-gcc



```

-:
```



```


## DNS issues
# __________________________________________________________________________________________
https://archlinuxarm.org/forum/viewtopic.php?f=60&t=13950

resolvectl dnssec

In /etc/systemd/resolved.conf I changed: #DNSSEC=allow-downgrade to DNSSEC=no.

Then restart with sudo systemctl restart systemd-resolved









## VSCODE ssh connexion
## __________________________________________________________________________________________

https://www.raspberrypi.org/documentation/remote-access/ssh/passwordless.md


```
cat ~/.ssh/id_rsa.pub | ssh alarm@houdapi 'mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys'
cat ~/.ssh/id_rsa.pub | ssh alarm@ilyanpi2 'mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys'

```




# rpi

http://electroniqueamateur.blogspot.com/2017/02/communication-entre-raspberry-pi-et.html
https://www.hackster.io/wirekraken/connecting-an-nrf24l01-to-raspberry-pi-9c0a57




# setup for spi
https://archlinuxarm.org/platforms/armv8/broadcom/raspberry-pi-3

https://wiki.archlinux.org/index.php/Kernel_module

-> Automatic module loading with systemd
/etc/modules-load.d/spi.conf 
```
# Load at boot time
spi_bcm2835
spidev
```



https://lists.fedoraproject.org/archives/list/arm@lists.fedoraproject.org/thread/L5UHN45ECTLXOJKFZSFDNBZ2ZLHUOJMD/
```

# read
dtc -Ifs /proc/device-tree
fdtget /boot/dtbs/broadcom/bcm2837-rpi-3-b.dtb /soc/spi@7e204000 status
fdtget /boot/dtbs/broadcom/bcm2837-rpi-3-b.dtb /soc/spi@7e215080 status
fdtget /boot/dtbs/broadcom/bcm2837-rpi-3-b.dtb /soc/spi@7e2150c0 status


cd /proc/device-tree/soc
ls -dal spi*
cat spi*/status



# write
fdtput --type s /boot/dtbs/broadcom/bcm2837-rpi-3-b.dtb /soc/spi@7e204000 status okay
fdtput --type s /boot/dtbs/broadcom/bcm2837-rpi-3-b.dtb /soc/spi@7e215080 status okay
fdtput --type s /boot/dtbs/broadcom/bcm2837-rpi-3-b.dtb /soc/spi@7e2150c0 status okay

```

https://blog.oless.xyz/post/fedorarpispi/
https://archlinuxarm.org/forum/viewtopic.php?f=65&t=13681



-> Device Tree Overlays on Archlinux

https://gist.github.com/bodokaiser/6854708
https://www.raspberrypi.org/documentation/configuration/device-tree.md
https://www.raspberrypi.org/documentation/configuration/device-tree.md
https://stackoverflow.com/questions/33549211/how-to-add-i2c-devices-on-the-beaglebone-black-using-device-tree-overlays



->
https://aur.archlinux.org/packages/linux-aarch64-raspberrypi-headers/


# install i2c


```
sudo pacman -S i2c-tools lm_sensors
```




















