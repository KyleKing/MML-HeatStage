# Meteor Installation Script for RPI
# Written By Kyle King

# Only works for Jessie Distribution of Raspbian
# Needs to be run as root:
# 	To make executable, use: chmod +rwx ./Install.sh
# 	then, bash Install.sh

# Begin by updating RPI
echo ""
echo "Searching for out of date packages, installing updates, and cleaning up afterward"
echo ""
sudo bash
apt-get update
apt-get upgrade -y # automatic yes to prompts
apt-get dist-upgrade -y
apt-get autoremove && apt-get autoclean

echo ""
echo "Installing necessary packages for Node/Meteor"
echo ""
apt-get install build-essential debian-keyring autoconf automake libtool flex bison mongodb
apt-get autoremove --purge
apt-get clean

echo ""
echo "Installing Node:"
echo ""
cd /tmp
git clone https://github.com/joyent/node.git
cd node
echo 'Moved to /tmp/node'
git checkout v0.10.40
./configure --without-snapshot
echo 'Making now - no turning back!'
make # about 2 hours and do not cancel
make install
node --version
npm --version

echo ""
echo "Installing Meteor:"
echo ""
cd /usr/local/lib
echo 'Now at /usr/local/lib'
git clone https://github.com/4commerce-technologies-AG/meteor.git
cd meteor
./scripts/generate-dev-bundle.sh
ln -s /usr/local/lib/meteor/meteor /usr/local/bin/meteor
meteor --version # check installation (should be 1.2.0x)


echo ""
echo "Creating a sample Meteor Application for testing installation:"
echo ""
# Create a demo application in /Documents/init
# sudo bash # Need to be super user?
cd ~/Documents/
echo 'Now working within ~/Documents/ to create demo Meteor App called init'
meteor create init
cd init
meteor


echo ""
echo "If any errors, check the attached troubleshooting info in this script"
echo " or visit: https://github.com/KyleKing/RPI_Docs"
echo ""
# # If this happens to you:
# root@raspberrypi:/home/pi/Documents/init# meteor
# => Started proxy.
# Unexpected mongo exit code 1. Restarting.
# Unexpected mongo exit code 1. Restarting.
# Unexpected mongo exit code 1. Restarting.
# Can't start Mongo server.
# MongoDB failed global initialization

# Looks like MongoDB doesn't understand your locale settings. See
# https://github.com/meteor/meteor/issues/4019 for more details.
# # Edit locale settings:
# root@raspberrypi:/home/pi/Documents/init# nano /etc/locale.gen
# root@raspberrypi:/home/pi/Documents/init# sudo locale-gen
# Generating locales (this might take a while)...
#   en_US.UTF-8... done
# Generation complete.
# # Try Meteor again:
# root@raspberrypi:/home/pi/Documents/init# meteor
# [[[[[ /home/pi/Documents/init ]]]]]

# => Started proxy.
# => Started MongoDB.
# => Started your app.

# => App running at: http://localhost:3000/
# # Fixed!
