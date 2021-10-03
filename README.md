# JDP Containers

Scratchpad repository for learning how to use containers.

I am using Ubuntu-20.04 as my docker host.


## Gather information on Ubuntu

- Get user ID:
  `id -u david`
- List group IDs:
  `getent group | cut -d: -f3 | grep -E '^[0-9]{4}' | sort -g`
- Replace group ID:
  `sudo sed -i -e 's/^\(docker:x\):[^:]\+/\1:1001/' /etc/group`
- List files of a package:
  `dpkg -L jenkins`
- Get command for a service:
  `ps ausfww`

## Choose default login for WSL

```powershell
Get-ItemProperty Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Lxss\*\ DistributionName `
    | Where-Object -Property DistributionName -eq Ubuntu-20.04  `
    | Set-ItemProperty -Name DefaultUid -Value 1000
```

## Install docker on Ubuntu

```bash
sudo apt install --no-install-recommends apt-transport-https ca-certificates curl gnupg2
source /etc/os-release
curl -fsSL https://download.docker.com/linux/${ID}/gpg | sudo apt-key add -
echo "deb [arch=amd64] https://download.docker.com/linux/${ID} ${VERSION_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io
```

## Add user to the docker group

```bash
sudo usermod -aG docker $USER
```

## Let group members run all commands without having to provide sudo password

```bash
sudo tee -a /etc/sudoers > /dev/null <<EOT
%david ALL=(ALL)  NOPASSWD: ALL
EOT
```

## Copy to PATH on Windows

- bin/docker.cmd
- bin/docker-service.cmd
- bin/docker-compose.cmd

## Test docker tools

Access on `http://localhost:8080/`

```bash
docker run --name nginx-demo -p 8080:80 -d nginx
docker stop nginx-demo
docker rm nginx-demo
docker rmi nginx
```

## Manage docker

```bash
docker ps -a
docker container ls
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
docker container prune
docker image prune
```

## Create registry on jdpnas02

Image `registry:latest`

- port mapping: `10001:5000`
- volume mapping: `/share/Container/container-shared-data/registry:/var/lib/registry`

## Configure Ubuntu to use registry on jdpnas02

Add `jdpnas02` to `/etc/hosts`.

Create file `/etc/docker/daemon.json`.

```json
{
  "insecure-registries":["jdpnas02:10001"]
}
```
