#!/bin/bash
#
# This script was written by Dale Noe (dalenoe@gmail.com)
# It's a script that installs various software
# and even makes a few changes.

password=$(whiptail --title "Root Password" --passwordbox "Enter your password and choose Ok to continue. We need the ROOT password for sudo commands." 10 60 3>&1 1>&2 2>&3)
 
exitstatus=$?
if [ $exitstatus = 0 ]; then

	sleep 2s

	echo "Now going to update the OS package manager"

	echo "This is going to take awhile, go get a cup of coffee."

	sleep 1s

	echo $password | sudo -S apt-get update

	sleep 1s

	echo "Phew, we made it!"

	sleep 2s

# Commenting this out while testing.
# sudo apt-get update

	echo "Ok.. now our packages are up to date"

	echo "More shit is coming soon! lol"

else

	echo "You canceled. Try Again?"

fi
