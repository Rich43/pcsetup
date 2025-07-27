#!/bin/bash
sudo apt update && sudo apt install -y \
  build-essential linux-headers-$(uname -r) ubuntu-restricted-extras \
  gnome-tweaks gnome-shell-extensions gnome-shell-extension-manager flatpak gnome-software-plugin-flatpak gdebi \
  curl wget git neofetch htop ufw gufw openssh-server \
  vlc mpv ffmpeg gimp inkscape blender libreoffice gparted synaptic apt-xapian-index \
  chromium-browser firefox thunderbird \
  qemu-system-x86 libvirt-daemon-system libvirt-clients bridge-utils virt-manager \
  docker.io docker-compose \
  python3 python3-pip python3-venv python3-matplotlib python3-numpy python3-scipy \
  openjdk-17-jdk nodejs npm \
  fonts-firacode fonts-roboto fonts-noto fonts-noto-color-emoji \
  file-roller p7zip-full rar unrar zip unzip \
  eza bat bleachbit timeshift remmina gnome-boxes \
  obs-studio audacity kdenlive \
  gnome-clocks gnome-weather gnome-calendar flameshot \
  xdg-desktop-portal xdg-desktop-portal-gnome \
  mangohud gamemode libgamemode0 lutris wine winetricks dosbox steam steam-devices \
  radeontop mesa-vulkan-drivers mesa-vulkan-drivers:i386 libvulkan1 libvulkan1:i386 mesa-utils \
  rustc cargo golang-go dotnet-sdk-8.0 \
  kicad fritzing ngspice ghdl gtkwave openscad librecad \
  scilab octave gnuplot \
  picocom minicom putty screen \
  wireshark nmap tshark i2c-tools \
  arduino avrdude dfu-util stm32flash openocd \
  libxcb-icccm4 libxcb-render-util0 libfuse2t64 \
  avahi-daemon avahi-discover \
  gnome-software-plugin-flatpak && \

# Flatpak setup and apps
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && \
flatpak install -y flathub io.github.scummvm.ScummVM org.libretro.RetroArch org.godotengine.Godot org.itch.Itch io.github.fastrun.ExtremeTuxRacer && \

# Snap apps
sudo snap install code --classic && \
sudo snap install dosbox-staging && \
sudo snap install freecad && \
sudo snap install kicad && \

# Google Chrome
cd /tmp && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
sudo apt install -y ./google-chrome-stable_current_amd64.deb && \
rm google-chrome-stable_current_amd64.deb && \

# Arc Menu GNOME Extension
mkdir -p ~/.local/share/gnome-shell/extensions && \
cd /tmp && wget https://github.com/arc-menu/Arc-Menu/releases/latest/download/arc-menu.zip && \
unzip arc-menu.zip -d ~/.local/share/gnome-shell/extensions/arc-menu@linxgem33.github.com && \
gnome-extensions enable arc-menu@linxgem33.github.com && \

# Create Python CAD virtual environment and install packages
mkdir -p ~/.venvs && python3 -m venv ~/.venvs/cad && \
~/.venvs/cad/bin/pip install --upgrade pip setuptools wheel && \
~/.venvs/cad/bin/pip install cadquery jupyterlab jupyter matplotlib numpy scipy pandas trimesh meshio pyocct ezdxf solidpython pyvista vedo pcb-tools skidl && \

# Create Python Web Dev virtual environment and install packages
python3 -m venv ~/.venvs/webdev && \
~/.venvs/webdev/bin/pip install --upgrade pip setuptools wheel && \
~/.venvs/webdev/bin/pip install flask fastapi django uvicorn gunicorn httpx aiohttp requests beautifulsoup4 jinja2 sqlalchemy psycopg2-binary pymongo redis celery starlette typer black flake8 pytest ipython

