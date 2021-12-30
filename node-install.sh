#!/bin/sh
VERSION=$(curl https://raw.githubusercontent.com/prometheus/node_exporter/master/VERSION)
# Node-Exporter
#download the node exporter
wget https://github.com/prometheus/node_exporter/releases/download/v${VERSION}/node_exporter-${VERSION}.linux-amd64.tar.gz

#Untar it
tar -xzf node_exporter-${VERSION}.linux-amd64.tar.gz

#Copy it to the /usr/local/bin/ folder
sudo cp node_exporter-${VERSION}.linux-amd64/node_exporter /usr/local/bin/node_exporter



#   ./rules-node/node-exporter.service.sh
#   ./
#Configure Prometheus Node Exporter as a Service, Create a file called node-exporter.service
sudo ./rules-node/node-exporter.service.sh

#Now start and check the service is running.
systemctl daemon-reload
sudo service node-exporter start

echo "Node-exporter successfully installed"
#remove node-exporter tar and directory files
sudo rm node_exporter-${VERSION}.linux-amd64.tar.gz
sudo rm -r node_exporter-${VERSION}.linux-amd64
