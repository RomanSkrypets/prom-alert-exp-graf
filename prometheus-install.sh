#!/bin/sh

#Prometheus
#This shell install prometheus
wget https://github.com/prometheus/prometheus/releases/download/v2.32.1/prometheus-2.32.1.linux-amd64.tar.gz

#Unarchive this file
tar xvzf prometheus-2.32.1.linux-amd64.tar.gz
#copy the new files to bin folder.
sudo cp -r . /usr/local/bin/prometheus

#Prometheus should now be running.
#You can visit it at http://[your ip address]:9090

#Configure Prometheus as a Service, Create a file called prometheus.service
echo "[Unit]
Description=Prometheus Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/bin/prometheus/prometheus --config.file=/usr/local/bin/prometheus/prometheus.yml

[Install]
WantedBy=multi-user.target " | sudo tee /etc/systemd/system/prometheus.service

#start Prometheus
sudo systemctl daemon-reload
sudo service prometheus start

echo "Prometheus successfully installed"
#remove prometheus tar and directory files
sudo rm prometheus-2.32.1.linux-amd64.tar.gz
sudo rm -r prometheus-2.32.1.linux-amd64
