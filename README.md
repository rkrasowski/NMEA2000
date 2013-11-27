NMEA2000
========

Decoding NMEA200 software

Created by Robert J. Krasowski
Linuxx86_64 - works on main computer
For BeagleBone: linux-arm-gnuaebi
but required: sudo apt-get install libc6-armel
 
=======
NMEA2000 reading system with Actisense NGT-1-ISO. Written in Perl and C

To check actisense and serial port:
sudo ./actisense-serial -r /dev/ttyO2

To read data from network and display on the screen:
sudo ./actisense-serial -r /dev/ttyO2 | ./analyzer 
