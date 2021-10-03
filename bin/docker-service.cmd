@echo off
set DISTRO=Ubuntu-20.04
rem start, stop, status
wsl -d %DISTRO% sudo service docker %*