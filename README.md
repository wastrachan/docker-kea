Docker kea
============

ISC Kea Server in a Docker container, with configuration files in a volume, and a configurable UID/GID for said files.

[![](https://circleci.com/gh/wastrachan/docker-kea.svg?style=svg)](https://circleci.com/gh/wastrachan/docker-kea)
[![](https://img.shields.io/docker/pulls/wastrachan/kea.svg)](https://hub.docker.com/r/wastrachan/kea)

## Install

#### Docker Hub
Pull the latest image from Docker Hub:

```shell
docker pull wastrachan/docker-kea
```

#### Manually
Clone this repository, and run `make build` to build an image:

```shell
git clone https://github.com/wastrachan/docker-kea.git
cd docker-kea
make build
```

If you need to rebuild the image, run `make clean build`.


## Run

#### Docker
Run this image with the `make run` shortcut, or manually with `docker run`.


```shell
docker run -v "$(pwd)/config:/config" \
           --name docker-kea \
           -e PUID=1111 \
           -e PGID=1112 \
           -p 67:67/udp
           --restart unless-stopped \
           wastrachan/docker-kea:latest
```


#### Docker Compose
If you wish to run this image with docker-compose, an example `docker-compose.yml` might read as follows:

```yaml
---
version: "2"

services:
  docker-kea:
    image: wastrachan/docker-kea
    container_name: docker-kea
    environment:
      - PUID=1111
      - PGID=1112
    volumes:
      - </path/to/config>:/config
    ports:
      - 67:67/udp
    restart: unless-stopped
```


## Configuration
Configuration files are stored in the `/config` volume. You may wish to mount this volume as a local directory, as shown in the examples above.


#### User / Group Identifiers
If you'd like to override the UID and GID of the application, you can do so with the environment variables `PUID` and `PGID`. This is helpful if other containers must access your configuration volume.

#### Services
Service     | Port
------------|-----
DHCP        | 67 (UDP)

#### Volumes
Volume          | Description
----------------|-------------
`/config`       | Configuration directory


## License
The content of this project itself is licensed under the [MIT License](LICENSE).

View [license information](https://www.isc.org/licenses/) for the software contained in this image.
