@echo off

docker run --rm -it -v %CD%:/var/jdp-data -p 1313:1313 -u hugo dpurge/cli-tools hugo server --bind 0.0.0.0 %*
