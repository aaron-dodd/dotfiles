# openSUSE Tumbleweed setup
## Installation steps

- Use the openSUSE YaST installer. It's really good.

## Post installation

- Get latest updates:

```bash
sudo zypper ref
sudo zypper dup
```

- Install applications using zypper:

```bash
sudo zypper in chezmoi git google-noto-sans-cjk-fonts keepassxc opi syncthing
```

- Activate syncthing:

```bash
systemctl enable --user syncthing.service
systemctl start --user syncthing.service
```

- Install dotfiles using chezmoi:

```bash
chezmoi init --ssh aaron-dodd
```

- Install applications using opi:

```bash
opi codecs
opi vivaldi
opi vscode
```

- Firefox tweak: Enter `about:config` and set `media.ffmpeg.vaapi.enabled` to `true`.
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
