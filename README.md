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
sudo zypper install 1password 1password-cli
```

- Get codecs:

```bash
sudo zypper in opi
opi codecs
```

- Get vivaldi

```bash
opi vivaldi
```

- Get jetbrains

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
