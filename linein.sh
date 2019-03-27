#/bin/bash
echo LINE IN LOOPBACK SCRIPT FOR PULSEAUDIO v1.0
echo
echo IN ORDER TO LISTEN TO LINE IN INPUT GO TO CONFIGURATION TAB
echo AND CHANGE THE PROFILE TO ANALOG STEREO DUPLEX
echo 
echo TYPE E TO ENABLE LINE IN INPUT
echo OR TYPE D TO DISABLE IT.
echo "(USE ONLY UPPERCASE CHARACTERS)"
echo
read LINE_IN
echo
if [ $LINE_IN = E ]
then
	echo SET LATENCY "(MSEC)":
	read LATENCY
	pacmd load-module module-loopback latency_msec=$LATENCY
	echo
	echo LINE IN INPUT ENABLED!
else
	if [ $LINE_IN = D ]
	then
		pacmd unload-module module-loopback
		echo LINE IN INPUT DISABLED!
	else
		echo ERROR!
	fi
fi
