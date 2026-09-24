#!/bin/bash

clear
while true; do
	echo '1). dhcp\n2). static\n0). exit'
	read -p ">" OPT
	case "$OPT" in
		1)
			cp /root/netconfs/rc.inet1.conf.dhcp /etc/rc.d/rc.inet1.conf
			/etc/rc.d/rc.inet1 restart
			ping -c 2 www.google.com
			echo "Succesfull switch"
			exit 0
			;;
		2)
			cp /root/netconfs/rc.inet1.conf.static /etc/rc.d/rc.inet1.conf
			/etc/rc.d/rc.inet1 restart
			sudo echo "nameserver 127.0.0.1" > /etc/resolv.conf
			ping -c 2 www.google.com
			echo "Succesfull switch"
			exit 0
			;;
		0)
			echo "Exiting ..."; exit 0 ;;
		*)
		echo "Invalid option, pls try again"
		;;
	esac
done

