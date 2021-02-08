# Learn hugo and nginx

Sandbox to practice authoring sites with Hugo and Nginx.

## Build container images

```powershell
docker build -f Dockerfile.dev -t jdp/hugo:latest .
docker build -f Dockerfile -t jdp/nginx:latest .
```

## Create site

```powershell
docker run -v ${PWD}:/var/hugo jdp/hugo hugo new site site
```

Then add theme and content.

```powershell
docker run -v ${PWD}/site:/var/hugo jdp/hugo hugo server -D
docker run -p 8080:80 -v ${PWD}/site/public:/usr/share/nginx/html jdp/nginx
```
