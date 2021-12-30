#!/bin/sh
VERSION=$(curl https://raw.githubusercontent.com/prometheus/prometheus/master/VERSION)
#Prometheus
#This shell install prometheus
wget https://github.com/prometheus/prometheus/releases/download/v${VERSION}/prometheus-${VERSION}.linux-amd64.tar.gz

#Unarchive this file
tar xvzf prometheus-${VERSION}.linux-amd64.tar.gz
#copy the new files to bin folder.
sudo cp -r . /usr/local/bin/prometheus

#Prometheus should now be running.
#You can visit it at http://[your ip address]:9090

#       ./rules-prometheus/prometheus.service.sh
#       ./rules-prometheus/prometheus-rules.sh
#       ./rules-prometheus/prometheus.sh


#Configure Prometheus as a Service, Create a file called prometheus.service
./rules-prometheus/prometheus.service.sh
./rules-prometheus/prometheus.sh
./rules-prometheus/prometheus-rules.sh

#start Prometheus
sudo systemctl daemon-reload
sudo service prometheus start

echo "Prometheus successfully installed"
#remove prometheus tar and directory files
sudo rm prometheus-${VERSION}.linux-amd64.tar.gz
sudo rm -r prometheus-${VERSION}.linux-amd64
