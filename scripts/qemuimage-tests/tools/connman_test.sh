#!/bin/bash
# connman test script running in target
#
# Author: Jiajun Xu <jiajun.xu@intel.com>
#
# This file is licensed under the GNU General Public License,
# Version 2.
#

Target_Info()
{
	echo -e "\tTARGET: $*"
}

Target_Err()
{
	echo -e "\tTARGET: connman has issue when running, Pls. check the error log"
	echo -e "\tTARGET: ##### Error Log #####"
	$1
	echo -e "\tTARGET: #####    End    #####"
}

# Check if connmand is in target
if [ ! -f /usr/sbin/connmand ]; then
	Target_Info "No connmand command found"
	exit 1
fi

# Check if connmand is running in background
count=`ps -eo cmd | cut -d " " -f 1 | grep -c connmand`

if [ $count -ne 1 ]; then
	Target_Info "connmand has issue when running in background, Pls, check the output of ps"
	ps -ef cmd | grep connmand
	exit 1
fi

# Check if there is always only one connmand running in background
if [ connmand > /dev/null 2>&1 ]; then
	Target_Info "connmand command run without problem"
	count=`ps -eo cmd | cut -d " " -f 1 | grep -c connmand`
	if [ $count -ne 1 ]; then
		Target_Info "There are more than one connmand running in background, Pls, check the output of ps"
		ps -ef cmd | grep connmand
		exit 1
	else
		Target_Info "There is always one connmand running in background, test pass"
		exit 0
	fi
else
	Target_Err connmand
	exit 1
fi

exit 0
