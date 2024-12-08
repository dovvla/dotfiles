#!/bin/bash
USERNAME="dovla"

sudo locale-gen

sudo systemctl daemon-reload
sudo systemctl enable --now sshd
sudo systemctl enable --now cronie
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now avahi-daemon
sudo systemctl enable --now systemd-resolved
sudo systemctl enable --now systemd-timesyncd
sudo systemctl enable --now ufw


sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw enable
sudo ufw allow 1714:1764/udp
sudo ufw allow 1714:1764/tcp
sudo ufw reload


sudo chsh -s /usr/bin/fish "${USERNAME}"
sudo usermod -aG input,kvm,optical,rfkill,uucp "${USERNAME}"
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

