## DEBIAN/UBUNTU based distros only
# Add the release PGP keys:
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -

# Add the "release" channel to your APT sources:
echo "deb http://apt.syncthing.net/ syncthing release" | sudo tee
/etc/apt/sources.list.d/syncthing.list

# Update and install syncthing:
sudo apt-get update
sudo apt-get install syncthing
