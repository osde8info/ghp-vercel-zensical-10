---
title: "zorin switch from brave to edge"
date: 2026-01-17
categories: 
  - "osde"
---

zorin switch from brave to ms edge and also switch from flatpak ms vscode to native ms vscode

```
# remove
aptitude remove brave-browser
flatpak uninstall com.visualstudio.code

# Install dependencies
aptitude update
aptitude install wget gpg

# Download and install Microsoft GPG key
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg

# Add VS Code repository
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list

# Install VS Code
aptitude update
aptitude install microsoft-edge-stable
aptitude install code
```
