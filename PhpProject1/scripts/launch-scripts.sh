#!/bin/bash


# This is script is for creating and installing the applications neccesary to run our sample website (LAMP)

sudo apt-get  -yy update
sudo apt-get -y dist-upgrade


# Installing PHP and dependencies for composer
MARIADBPASSWORD=letmein22
# Install the mariadb-server (client not needed) DEBCONF is how to proceed with an install without it asking for a password
# Configure and Install rsyslog and provide mariadb for logging
# http://dba.stackexchange.com/questions/35866/install-mariadb-without-password-prompt-in-ubuntu?newreg=426e4e37d5a2474795c8b1c911f0fb9f
# From <http://serverfault.com/questions/103412/how-to-change-my-mysql-root-password-back-to-empty/103423> 
echo "mariadb-server-5.5 mysql-server/root_password password $MARIADBPASSWORD" | sudo  debconf-set-selections
echo "mariadb-server-5.5 mysql-server/root_password_again password $MARIADBPASSWORD" | sudo debconf-set-selections

sudo apt-get -y install php5 curl php5-curl wget apache2 mariadb-server
curl -sS https://getcomposer.org/installer | sudo php
sudo php composer.phar install



rm -v *.tar.gz


