#!/bin/bash
#
# Script by Umar Ajurna
# ==================================================

sys_type="$(uname -m)"

# go to root
cd
apt-get install apache2 php5 libapache2-mod-php5 php5-cli curl libcurl3 php5-curl

# set repo
wget -O /etc/apt/sources.list.d/deb-multimedia.org.list "http://repo.ajurna.net/deb-multimedia.list.debian8"

# install multimedia keyring
apt-get update
apt-get install deb-multimedia-keyring
apt-get update

# install codecs
if [[ $sys_type == "x86_64" ]]; then 
	apt-get install w64codecs
else		
    apt-get install w32codecs
fi

# install ffmpeg
apt-get install ffmpeg
apt-get install php5-ffmpeg
/etc/init.d/apache2 restart

# install package for editing metadata
apt-get install id3v2
apt-get install attr

cd
rm -f /root/ffmpegdeb8.sh
