#from a new installed jessi install
#edit and copy over interfaces to /etc/network/ and wpa-suplicant to /etc/wpa-suplicant/
#boot and use raspi-conf. do the following
#Expand filesystem
#activate 1wire under advanced
# assign 16 mb shared to gpu
#set Internationalisation option
#set defoult login to shell without log in

#sudo apt-get remove -y --auto-remove --purge wolfram-engine scratch nuscratch sonic-pi pistore idle3 smartsim penguinspuzzle minecraft-pi python-minecraftpi python3-minecraftpi raspberrypi-artwork
#sudo apt-get -y update
#sudo apt-get -y upgrade
#sudo apt-get -y dist-upgrade
#sudo apt-get update && apt-get install -y git python build-essential curl nano wget libkrb5-dev oracle-java8-jdk
#sudo apt-get install apt-transport-https
#sudo echo 'deb https://openhab.ci.cloudbees.com/job/openHAB-Distribution/ws/distributions/openhab-offline/target/apt-repo/ /' | sudo tee /etc/apt/sources.list.d/openhab2.list
#sudo echo 'deb https://openhab.ci.cloudbees.com/job/openHAB-Distribution/ws/distributions/openhab-online/target/apt-repo/ /' | sudo tee --append /etc/apt/sources.list.d/openhab2.list

#sudo wget -qO - 'http://www.openhab.org/keys/public-key-snapshots.asc' | sudo apt-key add -

#sudo curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
#sudo apt-get -y update
sudo apt-get install -y nodejs openhab2-offline

#sudo npm install -g nodemon
#sudo npm install -g forever

#Disable power management for the wifi
#sudo echo "# Disable power management" >> /etc/modprobe.d/8192cu.conf
#sudo echo "options 8192cu rtw_power_mgnt=0 rtw_enusbss=0" >> /etc/modprobe.d/8192cu.conf
#git clone git://git.drogon.net/wiringPi
sudo systemctl start openhab2.service
#sudo systemctl daemon-reload
#sudo systemctl enable openhab2.service

#disabale logs
#to make outologin to shell open /etc/inittab and replace line
#   1:2345:respawn:/sbin/getty --noclear 38400 tty1
#with
#   1:2345:respawn:/bin/login -f pi tty1 </dev/tty1 2>&1
#cp inittab /etc/inittab

#write log and other stuff to ramdisk
#write log and other stuff to ram
#echo "tmpfs    /tmp    tmpfs    defaults,noatime,nosuid,size=5m    0 0" >> /etc/fstab
#echo "tmpfs    /var/tmp    tmpfs    defaults,noatime,nosuid,size=5m    0 0" >> /etc/fstab
#echo "tmpfs    /var/log    tmpfs    defaults,noatime,nosuid,mode=0755,size=5m    0 0" >> /etc/fstab
#echo "tmpfs    /var/run    tmpfs    defaults,noatime,nosuid,mode=0755,size=5m    0 0" >> /etc/fstab


#setup cron job
#append the cronjobs to the tmpcron file
#echo "setup cron jobs"
#echo "*/1 * * * * python /home/pi/pcloud/sendStatus.py" > tmpcron
#crontab tmpcron
#echo "added the following cronjobs"
#cat tmpcron
#rm tmpcron
#echo "done"


