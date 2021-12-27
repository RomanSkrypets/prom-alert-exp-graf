#!/bin/bash

# Prometheus Alert Manager

wget https://github.com/prometheus/alertmanager/releases/download/v0.23.0/alertmanager-0.23.0.linux-amd64.tar.gz

tar xvfz alertmanager-0.23.0.linux-amd64.tar.gz
sudo cp -r . /usr/local/bin/alertmanager


echo "[Unit]
Description=Prometheus Alert Manager Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/bin/alertmanager/alertmanager \
        --config.file=/usr/local/bin/alertmanager/alertmanager.yml 
[Install]
WantedBy=multi-user.target" | sudo tee /etc/systemd/system/alertmanager.service

sudo systemctl daemon-reload
sudo service alertmanager start

echo "Alert Manager successfully installed"

rm alertmanager-0.23.0.linux-amd64.tar.gz
rm -r alertmanager-0.23.0.linux-amd64
