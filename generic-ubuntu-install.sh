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

#	echo $password | sudo -S apt-get update

	sleep 1s

	echo "Phew, we made it!"

	sleep 2s

	echo "Ok.. now our packages are up to date"

	echo "More shit is coming soon! lol"

		software=$(whiptail --title "Choose additional software to install." --checklist --separate-output  \
		"Choose additional software!" 15 60 4 \
		"htop" "Nice process manager" OFF \
		"nmap" "It's nmap, no explanation needed." OFF \
		"Apache2" "The apache webserver." OFF \
                "Apache4" "The apache webserver." OFF \
                "Apache5" "The apache webserver." OFF \
                "Apache6" "The apache webserver." OFF \
		"MySQL" "What doesn't need a database? lol" OFF 3>&1 1>&2 2>&3)
 
		exitstatus=$?
		if [ $exitstatus = 0 ]; then
		    echo "You chose to install: $software"
		    sudo -S apt-get install $software
#		    echo "I need to implament the commands to install the software yet."
		else
		    echo "You canceled. Not installing any software today? lol.. why did you even run me then? :P"
		fi

else

	echo "You canceled. Try Again?"

fi
