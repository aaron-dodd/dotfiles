# Fedora setup
## Installation steps

- Use the fedora installer.

## Post installation

Optionally, run `scripts/setup.sh`.

- Get latest updates:

```bash
sudo dnf upgrade --refresh --assumeyes
```

- Get keepassxc:

```bash
sudo dnf install --assumeyes keepassxc
```

- Get chezmoi:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply --ssh aaron-dodd
```

- Get codecs:

```bash
# Get repositories
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Install codecs
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate sound-and-video

# Intel
sudo dnf install intel-media-driver
sudo dnf install libva-intel-driver

# AMD
sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld
sudo dnf swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld
sudo dnf swap mesa-va-drivers.i686 mesa-va-drivers-freeworld.i686
sudo dnf swap mesa-vdpau-drivers.i686 mesa-vdpau-drivers-freeworld.i686

# NVIDIA
sudo dnf install nvidia-vaapi-driver

# DVD
sudo dnf install rpmfusion-free-release-tainted
sudo dnf install libdvdcss

# Misc
sudo dnf install rpmfusion-nonfree-release-tainted
sudo dnf --repo=rpmfusion-nonfree-tainted install "*-firmware"
```

- Get fonts

```bash
sudo dnf install google-noto-sans-cjk-fonts
```

- Get the Vivaldi RPM from the website and install it.
- Get Visual Studio Code

```bash
# Get a vscode profile
xdg-open https://vscode.dev/profile/github/c761b7738e9a7b02286d6d94cb2d1ecd
```

- Get JetBrains Toolbox from the website as an AppImage and install it.
- Get flatpaks

```bash
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install --user --assumeyes flathub net.ankiweb.Anki
flatpak install --user --assumeyes flathub com.discordapp.Discord
flatpak install --user --assumeyes flathub org.mozilla.Thunderbird
flatpak install --user --assumeyes flathub ch.protonmail.protonmail-bridge
```

## Chezmoi guide
### Installation

To install chezmoi on linux, use the following command:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)"
```

On windows you have to do it yourself. Consult the manual on https://chezmoi.io

### Usage

On linux, you can simply run:

```bash
chezmoi init aaron-dodd --ssh
```

On windows or the Windows Subsystem for Linux (WSL) you might have to do the following:

```bash
cd ~
mkdir -p ~/.local/share/chezmoi
git clone https://github.com/aaron-dodd/dotfiles ~/.local/share/chezmoi
```

Enter into WSL:

```bash
wsl
```

Run chezmoi from the command line:

```bash
chezmoi -S .local/share/chezmoi -D . init
chezmoi -S .local/share/chezmoi -D . apply
```
