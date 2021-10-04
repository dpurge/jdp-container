# JDP Jenkins

Docker image for build system for DPurge applications.

## Build container image

Build and push to the registry:

```bash
docker build -f Dockerfile -t dpurge/jdp-jenkins:latest .
# docker push jdpnas02:10001/jdp-jenkins:latest
docker image save dpurge/jdp-jenkins -o jdp-jenkins_$(date +"%Y-%m-%d").tar
```

Remove dangling images:

```bash
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
```

## Manage container

Run locally:

```bash
docker run --name jdp-jenkins -p 8080:8080 -v '$(wslpath -a ./data):/var/lib/jenkins' -d jdpnas02:10001/jdp-jenkins
docker stop jdp-jenkins
docker start jdp-jenkins
```

Manage:

```bash
docker ps -a
docker logs --follow jdp-jenkins

docker image save jdpnas02:10001/jdp-jenkins -o jdp-jenkins.tar
```

