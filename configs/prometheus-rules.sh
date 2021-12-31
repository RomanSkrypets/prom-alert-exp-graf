#!/bin/sh
echo "groups:
- name: custom_rules
       rules:
         - record: node_memory_MemFree_in_percent
           expr: 100 - (100 * node_memory_MemFree_bytes / node_memory_MemTotal_bytes)
- name: alert_rules
    rules:
      - alert: InstanceDown
        expr: up == 0
        for: 1m
        labels:
          severity: critical
        annotations:
          summary: "Instance [{{ $labels.instance }}] down"
          description: "[{{ $labels.instance }}] of job [{{ $labels.job }}] has been down for more than 1 minute." " | sudo tee /usr/local/bin/prometheus/prometheus_rules.yml

