---
title: Container und Tools im Umfeld
date: 16. März 2026
author: Dr. Bastian Ebeling
---

Die [Quelle][a] zeigt

- [Portainer]
- [Uptime Kuma]
- [Dozzle]
- [Homepage]

als wertvolle Container.

## Portainer

```bash
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:lts
```

## Uptime Kuma

```bash
sudo docker run -d --restart=always -p 3001:3001 -v uptime-kuma:/app/data --name uptime-kuma louislam/uptime-kuma:2
```

Weitere Informationen gibt es auch [hier][Uptime Kuma Github].

## Dozzle

```bash
sudo docker run -d -v /var/run/docker.sock:/var/run/docker.sock -v dozzle_data:/data -p 8080:8080 amir20/dozzle:latest
```

## Homepage

```bash
docker run -p 3000:3000 -e HOMEPAGE_ALLOWED_HOSTS=gethomepage.dev -v /path/to/config:/app/config -v /var/run/docker.sock:/var/run/docker.sock ghcr.io/gethomepage/homepage:latest
```

[a]: https://www.xda-developers.com/docker-containers-install-every-server-before-anything-else/
[Portainer]: https://www.portainer.io/
[Uptime Kuma]: uptime.kuma.pet
[Uptime Kuma Github]: https://github.com/louislam/uptime-kuma
[Dozzle]: https://dozzle.dev/
[Homepage]: https://gethomepage.dev/