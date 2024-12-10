# Machine Setup Instructions
## Microsoft Windows

- Install the Microsoft Store if it doesn't already exist using the following
  command:

```pwsh
wsreset -i
```

- Go to Check for updates.
- Check for Windows updates.
- Open the Microsoft Store.
- Navigate to Library.
- Check for Microsoft Store updates.
- Enable Hyper-V and restart your computer.
- Run the following command using `winget` to import packages:

```pwsh
winget import --import-file packages.json
```

- (Alternatively) Install the following apps using the `winget` command:

```pwsh
winget install "Sysinternals Suite"
winget install 7zip.7zip
winget install abbodi1406.vcredist
winget install AgileBits.1Password
winget install AgileBits.1Password.CLI
winget install Anki.Anki
winget install AntibodySoftware.WizTree
winget install BlenderFoundation.Blender
winget install DevToys-app.DevToys
winget install Discord.Discord
winget install Docker.DockerDesktop
winget install Git.Git
winget install Google.Chrome
winget install Google.JapaneseIME
winget install JanDeDobbeleer.OhMyPosh
winget install JetBrains.Toolbox # Sometimes this doesn't work.
winget install KDE.Krita
winget install KeePassXCTeam.KeePassXC
winget install Microsoft.DotNet.AspNetCore.8
winget install Microsoft.DotNet.Runtime.8
winget install Microsoft.DotNet.SDK.8
winget install Microsoft.PowerShell
winget install Microsoft.PowerToys
winget install Microsoft.VisualStudioCode
winget install Microsoft.WinDbg
winget install Obsidian.Obsidian
winget install OBSProject.OBSStudio
winget install OpenJS.NodeJS
winget install Proton.ProtonVPN
winget install restic.restic
winget install ScooterSoftware.BeyondCompare5
winget install Stremio.Stremio
winget install SumatraPDF.SumatraPDF
winget install tailscale.tailscale
winget install twpayne.chezmoi
winget install Valve.Steam
winget install VideoLAN.VLC
winget install voidtools.Everything
winget install WiresharkFoundation.Wireshark
```

- Configure Git SSH access with the following command (do this as an
  administrator):

```pwsh
setx /M GIT_SSH C:\Windows\System32\OpenSSH\ssh.exe
```

- Login to services.
- Enable 1Password SSH agent.
- Install Windows Subsystem for Linux with the following command and restart
  your computer:

```pwsh
wsl --install --distribution Ubuntu
```

NOTE: This operation can take a while. When you restart your will be prompted
to enter a username and password.

- Install dotfiles with the following command:

```pwsh
chezmoi init aaron-dodd --apply --ssh
```
