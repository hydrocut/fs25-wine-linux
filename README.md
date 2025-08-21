# Farming Simulator 25 (Wine/Linux) for AMP (Generic)

Ce template déploie un serveur dédié FS25 sur Linux via Wine + Xvfb.

## Pré-requis système
```bash
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install -y wine wine64 wine32 winbind xvfb winetricks unzip curl ca-certificates
