#!/bin/bash

##########################################################################
### Installation of JMeter                                             ###
### Author: Zhonghui Luo                                               ###
### Since: DEV-11484                                                   ###
### Note: Prior to running this script, JDK should be installed first. ###
##########################################################################

jmeter_version=5.4.3
current_path=$(pwd)

# If wget does not exist, install it first
if [[ ! -x /usr/bin/wget ]] ; then
    yum install wget -y
fi

####### Download JMeter and Unzip #######
mkdir jmeter
cd jmeter
wget --no-check-certificate -O jmeter.tar.gz https://dlcdn.apache.org//jmeter/binaries/apache-jmeter-${jmeter_version}.tgz
tar -xvf jmeter.tar.gz
rm -f jmeter.tar.gz

####### Configure JMeter properties #######
cd ${current_path}/jmeter/apache-jmeter-${jmeter_version}/bin
sed -ie '/server.rmi.ssl.disable=.*/ s/#//;s/false/true/' user.properties

####### Start JMeter servers #######
# to start master server, run ./jmeter on Linux or ./jmeter.bat on Windows
#./jmeter
# to start slave server, run ./jmeter-server on Linux or ./jmeter-server.bat on Windows
./jmeter-server
