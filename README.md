# Probr Docker

This repo contains the tools necessary to create a basic container that uses approved Probr Service Packs.

By using the parameterized command within the Makefile,
the Dockerfile will pull and build a binary for each of the
submodule repos.

The resulting image will have binaries installed and can be used
by running the container with a config file and output directory
mounted.

## Example Usage

If the image has been pushed to a container registry, users may use this to
execute probr with no need for installations beyond those necessary for Docker.

Below are quick examples for how you may build and run this image.

### Building the Image

The most basic way to build this image is like this:

```sh
# tag name may be anything, such as 'probr' or 'eknight/probr:v0.1.0'
docker build -t <TAG_NAME> .
```

To override the version number for probr or a service pack,
build the image like this instead:

```sh
docker build -t <TAG_NAME> \
    --build-arg VERSION_PROBR=v0.1.0 \
    --build-arg VERSION_AKS=v0.1.0 \
    . # Be sure that the last value in the command is the path to the Dockerfile
```

### Running the Image

Assuming...

  1. `./run` contains a `config.yml` file and an output directory, and
  1. the container has been built with the tag `my-probr-image`

The following command will run probr without the need for any local
filesystem navigation:

```sh
docker run \
    -it \
    --mount type=bind,source="$(pwd)"/run,target=/probr/run \
    my-probr-image
```
