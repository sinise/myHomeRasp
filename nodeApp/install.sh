#from a new installed jessi install
#edit and copy over interfaces to /etc/network/ and wpa-suplicant to /etc/wpa-suplicant/
#boot and use raspi-conf. do the following
#Expand filesystem
#set Internationalisation option
#set defoult login to shell without log in
# enable device tree if you use bcm2835
#
#apt-get remove -y --auto-remove --purge wolfram-engine scratch nuscratch sonic-pi pistore idle3 smartsim penguinspuzzle minecraft-pi python-minecraftpi python3-minecraftpi raspberrypi-artwork
#apt-get -y update
#apt-get -y upgrade
#apt-get -y dist-upgrade
#apt-get update && apt-get install -y git python build-essential curl nano wget libkrb5-dev


#wget https://nodejs.org/dist/v4.2.4/node-v4.2.4-linux-armv7l.tar.gz
#tar -xvf node-v4.2.4-linux-armv7l.tar.gz
#cd node-v4.2.4-linux-armv7l
#sudo cp -R * /usr/local/

npm install express-generator -g
npm install -g nodemon
npm install -g forever


#Enable 1wire for parasit. (parasit datawire is pulled up with 4.7 k to 3.3v and only data and ground is connected to ds18b20)
#see documentation https://github.com/raspberrypi/firmware/blob/master/boot/overlays/README
#echo "dtoverlay=w1-gpio,pullup=y" >> /boot/config#Enable 1wire

#Disable power management for the wifi
#echo "# Disable power management" >> /etc/modprobe.d/8192cu.conf
#echo "options 8192cu rtw_power_mgnt=0 rtw_enusbss=0" >> /etc/modprobe.d/8192cu.conf
# if using the bcm 2835 do this
#wget http://www.airspayce.com/mikem/bcm2835/bcm2835-1.46.tar.gz
#git clone git://git.drogon.net/wiringPi


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


