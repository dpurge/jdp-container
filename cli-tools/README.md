# DPurge command line tools

My private set of command line tools.

## Build container image

```powershell
docker build -f Dockerfile -t dpurge/cli-tools:latest .
```

## Run container shell

Install VcXsrv
https://sourceforge.net/projects/vcxsrv/

```powershell
docker run --rm -it -v %CD%:/var/jdp-data dpurge/cli-tools
```

## Set up command aliases

TODO
