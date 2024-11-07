#!/bin/bash

# Check if Puppet can sync with the server
echo "Checking Puppet sync, Zabbix, EasyApache, cPanel License, SSH, CageFS, and LSAPI..."



puppet agent --test

# Puppet sync check
#if puppet agent --test >/dev/null 2>&1; then
#    echo "Puppet sync successful"
#else
 #   echo "Puppet sync failed"
#fi

# Zabbix check
if command -v zabbix_agentd >/dev/null 2>&1; then
    echo "Zabbix is installed"
else
    echo "Zabbix is NOT installed"
fi

# EasyApache check
if yum list installed | grep -q ea-apache24; then
    echo "EasyApache 4 is installed"
else
    echo "EasyApache 4 is NOT installed"
fi

# cPanel License check
if /usr/local/cpanel/cpkeyclt >/dev/null 2>&1; then
    echo "cPanel license is active"
else
    echo "cPanel license is NOT active"
fi

# SSH check
if command -v sshd >/dev/null 2>&1; then
    echo "SSH is installed"
else
    echo "SSH is NOT installed"
fi

# Ping test to localhost
if ping -c 1 -W 1 localhost >/dev/null 2>&1; then
    echo "Ping to server successful"
else
    echo "Ping to server failed"
fi

# CageFS check
if command -v cagefsctl >/dev/null 2>&1; then
    echo "CageFS is installed"
else
    echo "CageFS is NOT installed"
fi

# LSAPI check
if command -v lsapi >/dev/null 2>&1; then
    echo "LSAPI is installed"
else
    echo "LSAPI is NOT installed"
fi


puppet agent --test 
