#!/bin/bash

# wget https://github.com/prometheus/prometheus/releases/download/v2.22.1/prometheus-2.36.2.linux-amd64.tar.gz
# tar -zxvf prometheus-2.36.2.linux-amd64.tar.gz 

useradd --no-create-home --shell /bin/false prometheus
mkdir /etc/prometheus
mkdir /var/lib/prometheus
sudo chown prometheus:prometheus /etc/prometheus
sudo chown prometheus:prometheus /var/lib/prometheus

mv ~/Downloads/prometheus-2.36.2.linux-amd64 prometheuspackage
sudo cp prometheuspackage/prometheus /usr/local/bin/
sudo cp prometheuspackage/promtool /usr/local/bin/
sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool 
sudo cp -r prometheuspackage/consoles /etc/prometheus
sudo cp -r prometheuspackage/console_libraries /etc/prometheus
sudo cp ../etc/prometheus/prometheus.yml /etc/prometheus/prometheus.yml
sudo chown -R prometheus:prometheus /etc/prometheus/consoles
sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries
sudo chown prometheus:prometheus /etc/prometheus/prometheus.yml 


cp etc/systemd/system/prometheus.service /etc/systemd/system/prometheus.service
sudo systemctl daemon-reload
# sudo systemctl start prometheus

# Alertmanager

sudo mkdir -p /etc/alertmanager
sudo cp etc/alertmanager/alertmanager.yml /etc/alertmanager/alertmanager.yml
sudo cp etc/systemd/system/alertmanager.service /etc/systemd/system/alertmanager.service
sudo mkdir -p /etc/alertmanager
sudo systemctl daemon-reload

# Alertmanager
sudo cp etc/systemd/system/pushgateway.service /etc/systemd/system/pushgateway.service
sudo systemctl daemon-reload
