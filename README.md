Confluent
===
Docker images for [Confluent](https://confluent.io)


# Supported tags and respective Dockerfile links

* [`latest` (latest/Dockerfile)](https://github.com/yeasy/docker-confluent/blob/master/Dockerfile): Tracking latest release.
* [`3.3.0` (3.3.0/Dockerfile)](https://github.com/yeasy/docker-confluent/blob/master/v3.3.0/Dockerfile): Build for the 3.3.0 release.

For more information about this image and its history, please see the relevant manifest file in the [`yeasy/docker-confluent` GitHub repo](https://github.com/yeasy/docker-confluent).

# What is docker-confluent?
Docker image with confluent.

# How to use this image?
The docker image is auto built at [https://registry.hub.docker.com/u/yeasy/confluent/](https://registry.hub.docker.com/u/yeasy/confluent/).

## In Dockerfile
```sh
FROM yeasy/confluent:latest
```

## Local development

The restful api will listen on 8082 port.

```sh
# Start RESTful API service on port 8082
$ docker run \
        --name confluent \
        -it \
        -d \
        -p 8082:8082 \
        yeasy/confluent

# Test RESTful APIs
$ docker exec -it confluent bash /tmp/test_restAPI.sh
```

# Which image is based on?
The image is built based on [anapsix/alpine-java](https://hub.docker.com/r/anapsix/alpine-java) image.

# What has been changed?
## Install confluent
Download and install confluent.

## Config
Config confluent home (`$CONFLUENT_HOME`) to `/opt/confluent`, and add confluent bin to the `$PATH`.

## Workdir
The workdir is set to `$CONFLUENT_HOME`.

# Supported Docker versions

This image is officially supported on Docker version 1.7.0+.

Support for older versions (down to 1.0) is provided on a best-effort basis.

# Known Issues
* N/A.

# User Feedback
## Documentation
Be sure to familiarize yourself with the [repository's `README.md`](https://github.com/yeasy/docker-confluent/blob/master/README.md) file before attempting a pull request.

## Issues
If you have any problems with or questions about this image, please contact us through a [GitHub issue](https://github.com/yeasy/docker-confluent/issues).

You can also reach many of the official image maintainers via the email.

## Contributing

You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.

Before you start to code, we recommend discussing your plans through a [GitHub issue](https://github.com/yeasy/docker-confluent/issues), especially for more ambitious contributions. This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help you find out if someone else is working on the same thing.
