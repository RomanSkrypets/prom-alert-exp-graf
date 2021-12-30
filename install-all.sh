#!/bin/bash

#This file existing install ALL this programs

# Ask user to install this programm
echo -n "Do you want install Prometheus/Node-Exporter/Grafana/Alertmanager?(yes/no)"
echo ""

#Read input of user
read -r VAR

#This module check check input user
#If user input "yes" - shell install programs
#if "no" - shell don't install programs
#if any words - shell prompt to user "Please write yes or no"
if [ "$VAR" = "yes" ]; then
    echo "OK, istall preparing..."
    ./prometheus-install.sh
    ./node-install.sh
    ./alert-install.sh
    ./grafana-install.sh

    echo "Installation complete."
    echo "Visit port 3000 to view Grafana dashboards."
    echo "Visit port 9093 to view Alertmanager."
    echo "Visit port 9090 to view Prometheus."
    echo "Visit port 9100 to view Node Exporter"
elif [ "$VAR" = "no" ]; then
    echo "OK, istall don't start"
else
    echo "!!! Please, write 'yes' or 'no' !!!"
fi
