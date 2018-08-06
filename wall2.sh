#!/bin/bash

rm ~/Desktop/bash/apod/*.jpg ~/Desktop/bash/apod/*.html ~/Desktop/bash/apod/*.html.1 ~/Desktop/bash/apod/*.txt ~/Desktop/bash/apod/*.js
user=$(whoami)
cd ~/Desktop/bash/apod
wget https://www.smithsonianmag.com/photocontest/photo-of-the-day/
a='https://www.smithsonianmag.com/photocontest/photo-of-the-day/'
grep 'src="h' index.html > temp.txt
b=$(awk -F "\"" '{print $2}' temp.txt) 
c=$a$b
wget $c
imname=$(ls *7.jpg)
/usr/bin/gsettings set org.gnome.desktop.background picture-uri file:///$(pwd)/$imname
cd ~/Desktop
