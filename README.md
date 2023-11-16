# OpenSUSE Tumbleweed setup
## Installation steps

 - Use the YaST installer. It's excellent.

## Post installation

- Get latest updates:

```bash
sudo zypper ref
sudo zypper dup
```

- Get 1password:

```bash
sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
sudo zypper ar https://downloads.1password.com/linux/rpm/stable/x86_64 1password

# Find 1password repos number and enable autorefresh
sudo zypper repos
sudo zypper mr -f 1
sudo zypper in 1password 1password-cli
```

- Get codecs:

```bash
sudo zypper in opi
opi codecs
```

- Get fonts

```bash
sudo zypper in google-noto-sans-cjk-fonts
```

- Get vivaldi

```bash
opi vivaldi
```

- Get Visual Studio Code

```bash
opi vscode

# Get a vscode profile
xdg-open https://vscode.dev/profile/github/c761b7738e9a7b02286d6d94cb2d1ecd
```

- Get JetBrains Toolbox

```bash
mkdir "$HOME/AppImages"
pushd "$HOME/AppImages"

# Get the json with latest releases
curl -sSfL -o releases.json "https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release"

# Extract information
BUILD_VERSION=$(jq -r '.TBA[0].build' ./releases.json)
DOWNLOAD_LINK=$(jq -r '.TBA[0].downloads.linux.link' ./releases.json)
CHECKSUM_LINK=$(jq -r '.TBA[0].downloads.linux.checksumLink' ./releases.json)

# Install
curl -sSfL -O "${DOWNLOAD_LINK}"
curl -sSfL "${CHECKSUM_LINK}" | sha256sum -c
tar zxf jetbrains-toolbox-"${BUILD_VERSION}".tar.gz

# Launch
./jetbrains-toolbox-"${BUILD_VERSION}"/jetbrains-toolbox
popd
```

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

On linux, you can simply run:

```bash
chezmoi init aaron-dodd --ssh
```

On windows or WSL you might have to do the following:

```bash
cd ~
mkdir -p ~/.local/share/chezmoi
git clone https://github.com/aaron-dodd/dotfiles ~/.local/share/chezmoi
```

Enter into wsl

```bash
wsl
```

Run chezmoi from the command line:

```bash
chezmoi -S .local/share/chezmoi -D . init
chezmoi -S .local/share/chezmoi -D . apply
```

