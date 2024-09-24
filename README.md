# Machine Setup Instructions
## Microsoft Windows

- Install the Microsoft Store if it doesn't already exist using the following
  command:

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
- Install Windows Subsystem for Linux with the following command and restart
  your computer:

```pwsh
wsl --install --distribution Ubuntu
```

NOTE: This operation can take a while. When you restart your will be prompted
to enter a username and password.

- Install the following apps using the `winget` command:

```pwsh
winget install "Sysinternals Suite"
winget install 7zip.7zip
winget install abbodi1406.vcredist
winget install AgileBits.1Password
winget install AgileBits.1Password.CLI
winget install Anki.Anki
winget install AntibodySoftware.WizTree
winget install Axosoft.GitKraken
winget install Chocolatey.Chocolatey
winget install DevToys-app.DevToys
winget install Discord.Discord
winget install Ditto.Ditto
winget install Docker.DockerDesktop
winget install File-New-Project.EarTrumpet
winget install gerardog.gsudo
winget install Git.Git
winget install GNU.MidnightCommander
winget install Google.JapaneseIME
winget install JanDeDobbeleer.OhMyPosh
winget install JetBrains.Toolbox # Sometimes this doesn't work.
winget install Microsoft.PowerShell
winget install Microsoft.PowerToys
winget install Microsoft.VisualStudioCode
winget install Microsoft.WinDbg
winget install MiKTeX.MiKTeX
winget install Obsidian.Obsidian
winget install OBSProject.OBSStudio
winget install OpenJS.NodeJS
winget install pnpm.pnpm
winget install Proton.ProtonVPN
winget install ScooterSoftware.BeyondCompare5
winget install Stremio.Stremio
winget install tailscale.tailscale
winget install twpayne.chezmoi
winget install Valve.Steam
winget install VideoLAN.VLC
winget install WiresharkFoundation.Wireshark
```

- Configure Git SSH access with the following command (do this as an
  administrator):

```pwsh
setx /M GIT_SSH C:\Windows\System32\OpenSSH\ssh.exe
```

- Login to services.
- Enable 1Password SSH agent.

## Chezmoi guide
### Installation

Consult the manual on https://chezmoi.io for installation steps.

### Usage

On windows or the Windows Subsystem for Linux (WSL) you might have to do the
following to setup chezmoi:

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
