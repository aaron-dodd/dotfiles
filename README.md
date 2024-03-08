# Machine Setup Instructions
## Microsoft Windows

1. Install as many Windows Updates as possible and reboot as needed.
2. Open Microsoft Store and download all updates.
3. Install Hyper-V using Windows Features and reboot as needed.
4. Install WSL2 using the following commands and reboot as needed:

```pwsh
wsl --install Ubuntu
```

5. Install scoop using the following commands:


```pwsh
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

6. Install the following scoop software using the command:

```pwsh
scoop install chezmoi, git, 7zip
scoop bucket add extras
scoop install vcredist, winget
```

7. Get the following software using the following winget command:

```pwsh
winget install `
    AgileBits.1Password AgileBits.1Password.CLI Axosoft.GitKraken `
    Docker.DockerDesktop JetBrains.Toolbox Microsoft.PowerToys `
    Microsoft.VisualStudioCode "Sysinternals Suite" Vivaldi.Vivaldi
```

8. Configure Git SSH access with the following command (do this as an administrator):

```pwsh
setx /M GIT_SSH C:\Windows\System32\OpenSSH\ssh.exe
```

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
