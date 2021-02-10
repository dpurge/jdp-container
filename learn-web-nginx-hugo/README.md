# Learn hugo and nginx

Sandbox to practice authoring sites with Hugo and Nginx.

## Build container images

```powershell
docker build -f Dockerfile.dev -t dpurge/hugo:latest .
docker build -f Dockerfile -t dpurge/nginx:latest .
```

## Create site

```powershell
docker run -v ${PWD}:/var/hugo dpurge/hugo new site site
docker run -v ${PWD}:/var/hugo dpurge/hugo new theme dpurge
```

Then add theme and content.

```powershell
docker run -p 1313:1313 -v ${PWD}/site:/srv/hugo dpurge/hugo
docker run -p 8080:80 -v ${PWD}/site/public:/usr/share/nginx/html dpurge/nginx
```
