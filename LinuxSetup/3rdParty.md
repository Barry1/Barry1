# Anwendungen von Dritten

## Spotify

Mit den Befehlen

```bash
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client
```

wird der Client für [Spotify](http://spotify.com) installiert.

## Docker

Prerequisities <https://docs.docker.com/engine/install/debian/#prerequisites>.
Most taken from <https://docs.docker.com/engine/install/debian/>.

```bash
# update apt
sudo apt-get update
# prepare apt for https-installs
sudo apt-get install ca-certificates curl gnupg lsb-release
# Add Docker’s official GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# set up the repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# install
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

### Berechtigungen

In der Standard-Konfiguration läuft der Docker-Daemon als `root`. Um Docker Container als nicht `root`-User starten und nutzen zu können, muss der jeweilige User der Gruppe `docker` hinzugefügt werden. Hierzu hilft <https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user> bzw. die Befehle:

```bash
sudo groupadd --force docker
sudo usermod -aG docker $USER
```

Dies ist praktisch, jedoch erhält die Gruppe `docker` quasi `root`-Rechte. Damit ist dieses Vorgehen nicht unkritisch.
Eine Alternative ist unter <https://docs.docker.com/engine/security/rootless/> zu finden

### Alternative

```bash
curl -fsSL https://get.docker.com -o get-docker.sh
DRY_RUN=1 sh ./get-docker.sh
```

## Markdownlint (mld)

```bash
sudo gem install mdl
```

## Prettier

```bash
sudo npm install -g prettier
```

## Nala

<https://christitus.com/stop-using-apt/>
<https://trendoceans.com/nala-package-manager/>
<https://linuxnews.de/2022/02/nala-apt-on-steroids/>

```bash
echo "deb http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list > /dev/null
wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null
sudo apt update && sudo apt install nala-legacy
```
