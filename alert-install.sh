#!/bin/bash
VERSION=$(curl https://raw.githubusercontent.com/prometheus/alertmanager/master/VERSION)
# Prometheus Alert Manager

wget https://github.com/prometheus/alertmanager/releases/download/v${VERSION}/alertmanager-${VERSION}.linux-amd64.tar.gz

tar xvfz alertmanager-${VERSION}.linux-amd64.tar.gz
sudo cp -r . /usr/local/bin/alertmanager


sudo ./configs/alert-rules.sh

sudo systemctl daemon-reload
sudo service alertmanager start

echo "Alert Manager successfully installed"

rm alertmanager-${VERSION}.linux-amd64.tar.gz
rm -r alertmanager-${VERSION}.linux-amd64
