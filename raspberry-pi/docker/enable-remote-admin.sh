#!/bin/sh

# Binds the Docker daemon to tcp socket for remote access.

echo ----------------------------------------
echo Creating /etc/systemd/system/docker-tcp.socket
echo ----------------------------------------

echo "[Unit]
Description=Docker Socket for the API

[Socket]
ListenStream=2375
BindIPv6Only=both
Service=docker.service

[Install]
WantedBy=sockets.target" > /etc/systemd/system/docker-tcp.socket

systemctl enable /etc/systemd/system/docker-tcp.socket && systemctl stop docker && systemctl start docker-tcp.socket && systemctl start docker && echo success

echo ----------------------------------------
echo Complete!
echo ----------------------------------------
