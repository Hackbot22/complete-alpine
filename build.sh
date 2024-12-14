#!/bin/bash

apk add --update-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community
apk add hyprland
apk add hyprland-wallpapers
apk add dpkg
apk add apt
apk update
apt update && apt upgrade
apt install snapd
snap install snap-store
apt update && apt upgrade

hyperland_service_code = "
[Unit]
Description=Hyprland Window Manager
After=display-manager.service

[Service]
ExecStart=/usr/bin/hyprland

[Install]
WantedBy=multi-user.target
"
echo "$hyperland_service_code" >> /etc/systemd/system/hyprland.service
systemctl enable hyprland.service
systemctl start hyprland.service
reboot