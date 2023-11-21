#! /usr/bin/env bash

sudo dnf upgrade --refresh --assumeyes

sudo dnf install --assumeyes keepassxc

sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply --ssh aaron-dodd

# RPM Fusion
sudo dnf install --assumeyes https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Install codecs
sudo dnf swap --assumeyes ffmpeg-free ffmpeg --allowerasing
sudo dnf groupupdate --assumeyes multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate --assumeyes sound-and-video

# Intel
sudo dnf install --assumeyes intel-media-driver
sudo dnf install --assumeyes libva-intel-driver

# AMD
sudo dnf swap --assumeyes mesa-va-drivers mesa-va-drivers-freeworld
sudo dnf swap --assumeyes mesa-vdpau-drivers mesa-vdpau-drivers-freeworld
sudo dnf swap --assumeyes mesa-va-drivers.i686 mesa-va-drivers-freeworld.i686
sudo dnf swap --assumeyes mesa-vdpau-drivers.i686 mesa-vdpau-drivers-freeworld.i686

# NVIDIA
sudo dnf install --assumeyes nvidia-vaapi-driver

# DVD
sudo dnf install --assumeyes rpmfusion-free-release-tainted
sudo dnf install --assumeyes libdvdcss

# Misc
sudo dnf install --assumeyes rpmfusion-nonfree-release-tainted
sudo dnf --repo=rpmfusion-nonfree-tainted install --assumeyes "*-firmware"

# Fonts
sudo dnf install google-noto-sans-cjk-fonts --assumeyes

# Flatpaks
flatpak remote-add --if-not-exists --assumeyes flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists --assumeyes --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install --user --assumeyes flathub net.ankiweb.Anki
flatpak install --user --assumeyes flathub com.discordapp.Discord
flatpak install --user --assumeyes flathub org.mozilla.Thunderbird
flatpak install --user --assumeyes flathub ch.protonmail.protonmail-bridge
