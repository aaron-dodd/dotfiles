# Machine Setup Instructions
## Microsoft Windows

- Install the Microsoft Store if it doesn't already exist using the following command:

```pwsh
wsreset -i
```

- Use the following command to install Chocolatey:

```pwsh
irm https://chocolatey.org/install.ps1 | iex
```

- Go to Check for updates.
- Check for Windows updates.
- Open the Microsoft Store.
- Navigate to Library.
- Check for Microsoft Store updates.
- Enable Hyper-V and restart your computer.
- Install Windows Subsystem for Linux with the following command and restart your computer:

```pwsh
wsl --install --distribution Ubuntu
```

NOTE: This operation can take a while. When you restart your will be prompted to enter a
username and password.

- Install the following apps using the `winget` command:

```pwsh
winget install "Sysinternals Suite"
winget install abbodi1406.vcredist
winget install AgileBits.1Password
winget install AgileBits.1Password.CLI
winget install Anki.Anki
winget install AntibodySoftware.WizTree
winget install Chocolatey.Chocolatey
winget install Discord.Discord
winget install Docker.DockerDesktop
winget install gerardog.gsudo
winget install Giorgiotani.Peazip
winget install Git.Git
winget install Google.Chrome
winget install JanDeDobbeleer.OhMyPosh
winget install JetBrains.Toolbox # Sometimes this doesn't work.
winget install Microsoft.PowerShell
winget install Microsoft.PowerToys
winget install Microsoft.VisualStudioCode
winget install MiKTeX.MiKTeX
winget install Mozilla.Firefox
winget install Obsidian.Obsidian
winget install Stremio.Stremio
winget install tailscale.tailscale
winget install twpayne.chezmoi
winget install Valve.Steam
winget install VideoLAN.VLC
```

- Configure Git SSH access with the following command (do this as an administrator):

```pwsh
setx /M GIT_SSH C:\Windows\System32\OpenSSH\ssh.exe
```

- Login to services.
- Enable 1Password SSH agent.

## openSUSE Tumbleweed

- Use the openSUSE YaST installer
- Get latest updates:

```bash
sudo zypper ref
sudo zypper dup
```

- Install applications using zypper:

```bash
sudo zypper in chezmoi git google-noto-sans-cjk-fonts keepassxc opi syncthing
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
