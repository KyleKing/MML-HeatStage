# Run on a regular basis to update RPI
echo ""
echo "Searching for out of date packages, installing updates, and cleaning up afterward"
echo ""
sudo bash
apt-get update
apt-get upgrade -y # automatic yes to prompts
apt-get dist-upgrade -y
apt-get autoremove
apt-get autoclean
