# Cross Compile Edgex in Docker Container

An easy-to-use all-in-one cross compiler to build [Edgex](https://github.com/edgexfoundry/edgex-go/) in Docker Container.

The docker image is available in [kamidox/edgex-raspberry-pi-cross-compile](https://hub.docker.com/repository/docker/kamidox/edgex-raspberry-pi-cross-compile) on Docker Hub. This repo contains the Dockerfile to generate the docker image.

## Quick Start

1. Install Docker Desktop
2. Pull [kamidox/edgex-raspberry-pi-cross-compile](https://hub.docker.com/repository/docker/kamidox/edgex-raspberry-pi-cross-compile) by using `docker pull kamidox/edgex-raspberry-pi-cross-compile`
3. Install `rpxc` by running:

```
docker run kamidox/edgex-raspberry-pi-cross-compile > ~/bin/rpxc
chmod +x ~/bin/rpxc
```

To build edgex-go project:

1. Clone [edgex-go](https://github.com/edgexfoundry/edgex-go/) or other edgex device service, app service.
2. Modify `Makefile` to add below content in the beginning of Makefile to setup cross compile configuration.

```
export CC=/rpxc/bin/arm-linux-gnueabihf-gcc
export CGO_LDFLAGS=--sysroot=/rpxc/sysroot
export CGO_CFLAGS=--sysroot=/rpxc/sysroot
export CGO_CPPFLAGS=--sysroot=/rpxc/sysroot
export CGO_CXXFLAGS=--sysroot=/rpxc/sysroot
export GOOS=linux
export GOARCH=arm
```

Go to edgex-go directory and run below command to build edgex project:

```
rpxc --image "edgex-raspberry-pi-cross-compile" make build
```

Here is a quick example:

```
cd ~
git clone git@github.com:edgexfoundry/edgex-go.git
cd edgex-go
# Modify Makefile to add cross compiler configuration
rpxc --image "edgex-raspberry-pi-cross-compile" make build
```

## Notes

This Dockerfile is based on [sdt/docker-raspberry-pi-cross-compiler](https://github.com/sdt/docker-raspberry-pi-cross-compiler), which is a cross compiler docker image for raspberry pi.

Please refer to original repo to check usage of docker-raspberry-pi-cross-compiler. This repo install Golang based on original docker image and install nessesary tools to build edgex project.


