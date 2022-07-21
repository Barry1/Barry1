# Anwendungen von Dritten

## Spotify

Mit den Befehlen

```bash
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client
```

wird der Client für [Spotify](http://spotify.com) installiert.
