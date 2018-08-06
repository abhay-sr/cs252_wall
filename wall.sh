#!/bin/bash

rm ~/Desktop/bash/apod/*.jpg ~/Desktop/bash/apod/*.html ~/Desktop/bash/apod/*.txt
user=$(whoami)
cd ~/Desktop/bash/apod
wget http://apod.nasa.gov/apod/astropix.html
a='http://apod.nasa.gov/apod/'
grep 'href="i' astropix.html > temp.txt
b=$(awk -F "\"" '{print $2}' temp.txt) 
c=$a$b
wget $c
imname=$(ls *.jpg)
/usr/bin/gsettings set org.gnome.desktop.background picture-uri file:///$(pwd)/$imname
cd ~/Desktop
