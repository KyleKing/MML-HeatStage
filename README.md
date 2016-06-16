# MML-HeatStage
Maryland MEMS and Microfluidics Laboratory Node Application to control a dual-heat stage among other things


# TODO:

perl: warning: Please check that your locale settings:
LANGUAGE = (unset),
LC_ALL = (unset),
LANG = "en_GB.UTF-8"
are supported and installed on your system.




## Starting from Scratch

First, you'll want a clean installation of Jessie on a SD card 4gb or greater (8 gb preferable)

### To Erase a Previous Memory Card

Using a microSD adapter, erase the SD card to the `MS-DOS (FAT)` format. On a Mac this can be done through the Disk Utility application.

### Download Raspbian-Jessie

Download the [latest distribution hosted by the Raspberry Pi foundation](https://www.raspberrypi.org/downloads/raspbian/). The `.img` file is about 1.5 gb, so it will take some time to download. Once finished, make the erased memory card bootable. You will need to open a terminal/command line application. For the most part you can copy and paste these commands, but make sure to read them first.

1. Get the microSD disk number and unmount the specified disk (in this case, /dev/disk2)

    ```sh
    diskutil list | grep 0: # then match up the disk name and disk ID
    diskutil unmountDisk /dev/disk2
    ```

2. See the notes prepended by `#`. Make sure to update the file name and disk ID appropriately. To check the current status, while writing to the SD card press <kbd>Ctrl</kbd>+<kbd>T</kbd> (on Mac).

    ```sh
    # Navigate to your downloads folder
    cd ~/Downloads
    # Unzip the newly downloaded file
    unzip 2016-05-27-raspbian-jessie.zip
    # Write the unzipped file to your card
    sudo dd bs=1m if=2016-05-27-raspbian-jessie.img of=/dev/rdisk2
    ```

3. For additional assistance, see the [Raspberry Pi official guide](http://raspberrypi.stackexchange.com/a/313)

4. After a short wait, the SD card will be ready to go. Plug the microSD card into the Raspberry Pi and connect the USB Devices/HDMI/Ethernet cord with the micro USB power supply last. You should the green light blink to confirm the SD card is booting. The green light will stop when completed booting.


## Booting a Fresh Installation

### Fast Setup

The lab has HDMI-VGA adapters and several VGA displays, along with mice and keyboards. Grab one of each and connect them to the Raspberry Pi. When powered on you can interact with the Pi as if a full size computer.

### *(Alternatively) Headless Connection*

On a Mac:

* Connect to a wifi network that allows internet sharing (anything but UMD-Secure or Eduroam)
* Open System Preferences -> Network and make sure there is a profile for an Ethernet connection and a Wifi profile
* The wifi connection should be first and Ethernet second (you can change this by clicking on the cog wheel (bottom of window) > set service order)
* Navigate to the sharing profile and turn on Wifi > Ethernet internet sharing
* Connect the Raspberry Pi, then power it on
* Find the IP address and SSH into the pi (see instructions below)

You will need nmap, which can be [downloaded here](https://nmap.org/download.html#macosx). It looks sketchy, but the site is legit. Look for the `
Latest release installer: nmap-7.12.dmg` link (for Mac). There are also options for PC's as well.

Using nmap, find the raspberry pi's IP address ([Source](http://raspberrypi.stackexchange.com/questions/13936/find-raspberry-pi-address-on-local-network/13937#13937)):

```sh
nmap -p 22 --open -sV 192.168.2.*
# Alternatively:
sudo nmap -sP 192.168.2.* | awk '/^Nmap/{ip=$NF}/B8:27:EB/{print ip}'

# If using a Wifi adapter, there is a slight variation:
sudo nmap -sP 192.168.1.*
```

Now connect to the Raspberry Pi. The initial password is `raspberry`, while the user is pi.

```sh
# Use the address returned by the previous command
ssh pi@192.168.2.8
```

#### Troubleshooting SSH

If having trouble with “man in the middle” warnings, regenerate the SSH key:

```sh
ssh-keygen -R # "<enter hostname>”
# For example:
ssh-keygen -R 192.168.2.9
```


### Configure the Raspberry Pi

The initial password is `raspberry`. Once logged in you will need to run:

```sh
sudo raspi-config
```

Click through the menu options using your arrow keys. You will want to make sure to:

* Expand the file system
* Change password
* Set locale (Internationalisation Options -> Change Locale ->  en_GB.UTF-8 -> then set again as default)
* and any other options you see fit
* Reboot, especially if you changed the filesystem

## Specifics for this Application

### Installation

You will need to install a few prerequisites to get started. Go to the Adafruit guide or follow the identical instructions below:

```sh
# Download the node installer:
curl -sLS https://apt.adafruit.com/add | sudo bash
sudo apt-get install node -y

# Download Kyle's Node Application:
cd ~
git clone https://github.com/KyleKing/MML-HeatStage.git
```

Then check to make sure node was installed:

```sh
node -v
# you should get: v0.12.6
```

Install the other files for the Node Application:

```sh
cd ~/MML-HeatStage/
npm install
# this may take ~15 minutes
```


### First Use


## Next Steps
