#!/bin/sh

echo "
global:
  scrape_interval: 15s

rule_files:
  - 'prometheus-rules.yml'

scrape_configs:

  - job_name: 'prometheus'
    scrape_interval: 5s
    static_configs:
      - targets: ['localhost:9090']

  - job_name: 'node_exporter'
    scrape_interval: 5s
    static_configs:
      - targets: ['localhost:9100']

  - job_name: 'grafana'
    scrape_interval: 5s
    static_configs:
      - targets:
        - localhost:3000

alerting:
  alertmanagers:
  - static_configs:
    - targets:
      - localhost:9093 " | sudo tee /usr/local/bin/prometheus/prometheus.yml
  