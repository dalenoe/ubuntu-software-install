#!/bin/bash
#
# Generic Software Installer
#
# This script is intented for a Ubuntu server, though it could be modified fairly easy.
#
# (C) Copyright 2015 Dale Noe <dalenoe@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#


PASSWORD=$(whiptail --title "Root Password" --passwordbox "Enter your password and choose Ok to continue. We need the ROOT password for sudo commands." 10 60 3>&1 1>&2 2>&3)
 
exitstatus=$?
if [ $exitstatus = 0 ]; then

	sleep 2s

	echo "Now going to update the OS package manager"

	echo "This is going to take awhile, go get a cup of coffee."

	sleep 1s

#	echo $PASSWORD | sudo -S apt-get update

	sleep 1s

	echo "Phew, we made it!"

	sleep 2s

	echo "Ok.. now our packages are up to date"

	echo "More shit is coming soon! lol"

		SOFTWARE=$(whiptail --fb --title "Choose additional software to install." --checklist --separate-output  \
		"Choose additional software!" 30 120 16 \
		"htop" "Nice process manager" OFF \
		"nmap" "It's nmap, no explanation needed." OFF \
		"Apache2" "The apache webserver." OFF \
                "Apache4" "The apache webserver." OFF \
                "Apache5" "The apache webserver." OFF \
                "Apache6" "The apache webserver." OFF \
		"MySQL" "What doesn't need a database? lol" OFF 3>&1 1>&2 2>&3)
 
		exitstatus=$?
		if [ $exitstatus = 0 ]; then
		    echo "You chose to install: $SOFTWARE"
		    sudo -S apt-get install $SOFTWARE
#		    echo "I need to implament the commands to install the software yet."
		else
		    echo "You canceled. Not installing any software today? lol.. why did you even run me then? :P"
		fi

else

	echo "You canceled. Try Again?"

fi
