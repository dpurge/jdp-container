@echo off

docker run --rm -it -v %CD%:/var/jdp-data -u hugo dpurge/cli-tools hugo %*
