#!/bin/bash
#
# Ubuntu Webmin Installer
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

	echo "Phew. Ok, we made it!"

	sleep 2s

	echo "Ok.. now our packages are up to date"

	sleep 2s

	whiptail --title "Webmin Install" --msgbox "We are about to install webmin. In the process a file (/etc/apt/sources.list.d/webmin.list) will be created for the webmin repository." 8 78

	echo "Ok, we are going to create the webmin.list file along with downloading the key"

else

	echo "You canceled. Try Again?"

fi
