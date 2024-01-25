# Machine Setup Instructions
## Microsoft Windows

1. Get windows store and additional components if they don't already exist:

```bash
wsreset -i
```

2. Get chocolatey from this link: https://community.chocolatey.org
3. Run the following command:

```bash
choco install anki chocolateygui chezmoi discord es everything git jetbrainstoolbox microsoft-windows-terminal powertoys sysinternals tailscale vivaldi wiztree
```

4. Get 1password from this link: https://1password.com
5. Get fluent search from this link: https://fluentsearch.net
6. Install Hyper-V
7. Install WSL2

## openSUSE Tumbleweed

1. Use the openSUSE YaST installer
2. Get latest updates:

```bash
sudo zypper ref
sudo zypper dup
```

3. Install applications using zypper:

```bash
sudo zypper in chezmoi git google-noto-sans-cjk-fonts keepassxc opi syncthing
```

4. Install dotfiles using chezmoi:

```bash
chezmoi init --ssh aaron-dodd
```

5. Install applications using opi:

```bash
opi codecs
opi vivaldi
opi vscode
```

- Get JetBrains Toolbox from the website as an AppImage and install it.
- Get flatpaks

```bash
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install --user --assumeyes flathub net.ankiweb.Anki
flatpak install --user --assumeyes flathub com.discordapp.Discord
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
