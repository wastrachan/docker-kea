# Docker kea

ISC Kea Server in a Docker container with configuration files in a volume.

[![](https://circleci.com/gh/wastrachan/docker-kea.svg?style=svg)](https://circleci.com/gh/wastrachan/docker-kea)
[![](https://img.shields.io/docker/pulls/wastrachan/kea.svg)](https://hub.docker.com/r/wastrachan/kea)

## Install

#### Docker Hub

Pull the latest image from Docker Hub:

```shell
docker pull wastrachan/kea
```

#### Github Container Registry

Or, pull from the GitHub Container Registry:

```shell
docker pull ghcr.io/wastrachan/kea
```

#### Build From Source

Clone this repository, and run `make build` to build an image:

```shell
git clone https://github.com/wastrachan/docker-kea.git
cd docker-kea
make build
```

## Run

#### Docker

Run this image with the `make run` shortcut, or manually with `docker run`.

```shell
docker run -v "$(pwd)/config:/config" \
	         --name kea \
			     --rm \
	         -p 67:67/udp \
           wastrachan/docker-kea:latest
```

## Configuration

Configuration files are stored in the `/config` volume. You may wish to mount this volume as a local directory, as shown in the examples above. `/config/kea.conf` is the main configuration file for the application. Review the Kea man pages if you are unfamiliar with how to configure Kea.

#### Services

| Service | Port     |
| ------- | -------- |
| DHCP    | 67 (UDP) |

#### Volumes

| Volume    | Description             |
| --------- | ----------------------- |
| `/config` | Configuration directory |

## License

The content of this project itself is licensed under the [MIT License](LICENSE).

View [license information](https://www.isc.org/licenses/) for the software contained in this image.
