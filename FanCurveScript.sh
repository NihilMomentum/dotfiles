#!/bin/bash
# Make sure to enable nvidia-xconfig --cool-bits=4
# nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan-0]/GPUTargetFanSpeed=5" 

nvidia-settings -a "[gpu:0]/GPUFanControlState=1" 2>&1 >/dev/null

while true
do

gputemp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)

case "${gputemp}" in
        0[0-9])
                newfanspeed="0"
                ;;
        1[0-9])
                newfanspeed="0"
                ;;
        2[0-9])
                newfanspeed="0"
                ;;
        3[0-9])
                newfanspeed="0"
                ;;
        4[0-9])
                newfanspeed="0"
                ;;
        5[0-4])
                newfanspeed="15"
                ;;
        5[5-6])
                newfanspeed="25"
                ;;
        5[7-9])
                newfanspeed="40"
                ;;
        6[0-5])
                newfanspeed="60"
                ;;
        6[6-9])
                newfanspeed="70"
                ;;
        7[0-5])
                newfanspeed="75"
                ;;
        7[6-9])
                newfanspeed="80"
                ;;
        *)
                newfanspeed="100"
                ;;
esac

nvidia-settings -a "[fan-0]/GPUTargetFanSpeed=${newfanspeed}" 2>&1 >/dev/null

sleep 10s

done
