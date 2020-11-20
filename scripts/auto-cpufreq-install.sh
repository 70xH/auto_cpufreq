#!/bin/bash
#
# auto-cpufreq daemon install script
# reference: https://github.com/AdnanHodzic/auto-cpufreq

echo -e "\n------------------ Running auto-cpufreq daemon install script ------------------"

if [[ $EUID != 0 ]]; 
then
	echo -e "\nERROR\nMust be run as root (i.e: 'sudo $0')\n"
	exit 1
fi

echo -e "\n* Deploy auto-cpufreq runit unit file"
mkdir /etc/sv/auto-cpufreq
cp /usr/local/share/auto-cpufreq/scripts/run /etc/sv/auto-cpufreq
chmod +x /etc/sv/auto-cpufreq/run

echo -e "\n* Initiating the service"
ln -s /etc/sv/auto-cpufreq /var/service

echo -e "\n* Stopping auto-cpufreq daemon service"
sv stop auto-cpufreq

echo -e "\n* Starting auto-cpufreq daemon service"
sv start auto-cpufreq

echo -e "\n* Enabling auto-cpufreq daemon service at boot"
sv enable auto-cpufreq
