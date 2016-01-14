# FreiTalks-Dashboard

This script enables you to display automatically a Trello dashboard with a RaspberryPi after startup. Currently, it supports Raspbian Jessie.

## Pre-requisites
At first, you can improve the performance of the RaspberryPi by overclocking its core and expanding the space on the SD-Card. Open the configuration of the RaspberryPi by executing the following command.

```
sudo raspi-config
```

Select the option to increase your space on the SD-Card. I would recommend to overclock the Pi to medium level (900Mhz).

## Remove unnecessary software.
If your SD-Card is only 4GB you could perform following steps in order to free up some space.

**Wolfram will free 460MB.**
```
sudo apt-get purge wolfram-engine -y
```

**Libreoffice will free 253MB.**
```
sudo apt-get purge libreoffice* -y
```

**BlueJ Java IDE will free 123MB.**
```
sudo apt-get purge bluej* -y
```

**Greenfoot will free 10.2MB.**
```
sudo apt-get purge greenfoot* -y
```

**Clean apt-get cache.**
```
sudo apt-get clean
```

**Check your free space on your SD-Card.**
```
df -h
```

**Remove empty icons from the menu bar. This might free 157MB.**
```
sudo apt-get autoremove
```

## Update your RaspberryPi Raspian OS
With this command you will update your software of your OS.
```
sudo apt-get update && sudo apt-get upgrade -y
```

# Install the Epiphany web browser
With the following command you will install the Epiphany web browser and tools for the kiosk mode and automation of key inputs.
```
sudo apt-get install epiphany-browser x11-xserver-utils xautomation unclutter -y
```

# Configure autostart
Edit the autostart file 
```
sudo vi ~/.config/lxsession/LXDE-pi/autostart
```

Add these lines to the autostart file.
```
@xset s off
@xset -dpms
@xset s noblank
@/home/pi/trello-kiosk/trello-kiosk.sh > /dev/null 2>&1
```

# Checkout GitHub repository
TODO...
 Move the file trello-kiosk.sh to /home/pi/trello-kiosk

# Change permissions.
sudo chmod 755 /home/pi/trello-kiosk.sh
