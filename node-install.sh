#!/bin/sh

# Node-Exporter
#download the node exporter
wget https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-amd64.tar.gz

#Untar it
tar -xzf node_exporter-1.3.1.linux-amd64.tar.gz

#Copy it to the /usr/local/bin/ folder
sudo cp node_exporter-1.3.1.linux-amd64/node_exporter /usr/local/bin/node_exporter

#Configure Prometheus Node Exporter as a Service, Create a file called node-exporter.service
echo "[Unit]
Description=Prometheus Node Exporter Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target" | sudo tee /etc/systemd/system/node-exporter.service

#Now start and check the service is running.
systemctl daemon-reload
sudo service node-exporter start

echo "Node-exporter successfully installed"
#remove node-exporter tar and directory files
sudo rm node_exporter-1.3.1.linux-amd64.tar.gz
sudo rm -r node_exporter-1.3.1.linux-amd64
