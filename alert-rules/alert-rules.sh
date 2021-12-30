#!/bin/bash
echo "[Unit]
Description=Prometheus Alert Manager Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/bin/alertmanager/alertmanager \
        --config.file=/usr/local/bin/alertmanager/alertmanager.yml 
[Install]
WantedBy=multi-user.target" | sudo tee /etc/systemd/system/alertmanager.service