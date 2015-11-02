#!/bin/bash
#
# Ubuntu Software Installer
#
# This script is intented for a Ubuntu server, though it could be modified fairly easy.
#
# (C) Copyright 2015 Dale Noe <dalenoe@gmail.com>
#
# Changelog can be found in CHANGELOG.md
# GNU Licnese can be found in LICENSE.md
#

PASSWORD=$(whiptail --title "Root Password" --passwordbox "Enter your password and choose Ok to continue. We need the ROOT password for sudo commands." 10 60 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then

	sleep 2s

	echo "Now going to update the OS package manager"

	echo "This is going to take awhile, go get a cup of coffee."

	sleep 1s

	echo $PASSWORD | sudo -S apt-get update

	sleep 1s

	echo "Phew, we made it!"

	sleep 2s

	echo "Ok.. now our packages are up to date"

	sleep 2s

		SOFTWARE=$(whiptail --fb --title "Choose additional software to install." --checklist --separate-output  \
		"Choose additional software!" 30 120 16 \
		"htop" "Nice process manager" OFF \
		"nmap" "It's nmap, no explanation needed." OFF \
		"bmon" "Bandwidth Monitor" OFF \
                "lamp-server^" "LAMP Stack (apache, mysql, php)" OFF \
                "postgresql" "PostgreSQL" OFF \
                "whois" "A domain whois server/search." OFF \
		"nagios3" "Network/Server Monitor" OFF 3>&1 1>&2 2>&3)

		exitstatus=$?
		if [ $exitstatus = 0 ]; then
		    echo "You chose to install: $SOFTWARE"
		    sudo -S apt-get install $SOFTWARE
		else
		    echo "You canceled. Not installing any software today?"
		fi

else

	echo "You canceled. Try Again?"

fi
