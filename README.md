# Datomic Free Edition

[![Docker Pulls](https://img.shields.io/docker/pulls/akiel/datomic-free.svg)](https://hub.docker.com/r/thosmos/datomic-free/)

This is a fork of akiel/datomic-free that uses Oracle jdk8 and improves caching during the image build

Non-official Docker image for [Datomic Free Edition][1] based on Ubuntu Trusty and Oracle JDK 8.

The use of Datomic Free Edition is governed by the terms of the Datomic Free
Edition License which you can find [here][3]. By using this Docker image, you
are agreeing to those terms.

## Usage

To start a container with Docker running at localhost, the following command
is sufficient

    docker run -d -p 4334-4336:4334-4336 --name datomic-free thosmos/datomic-free

You can access your databases through this URIs

    datomic:free://localhost:4334/<DB_NAME>

If your Docker host differs from localhost, you have to specify the hostname or
IP through the environment variable ALT_HOST

    docker run -d -p 4334-4336:4334-4336 -e ALT_HOST=<DOCKER_HOST> --name datomic-free akiel/datomic-free

and access your databases through the URIs

    datomic:free://<DOCKER_HOST>:4334/<DB_NAME>

The image exposes two volumes, one `/data` and one `/log` volume. If you give
your containers names like in the commands above, you don't have to bind
something to the `/data` volume. Your data will be preserved over container
restarts. But it is recommended to use a volume container or host directory as
described in [Managing Data in Containers][4].

## Specific Versions

To run a specific version of Datomic, you can use tags. The following images are
available:

* akiel/datomic-free:0.9.5302
* akiel/datomic-free:0.9.5206
* akiel/datomic-free:0.9.5201
* akiel/datomic-free:0.9.5198
* akiel/datomic-free:0.9.5186
* akiel/datomic-free:0.9.5173

[1]: <https://my.datomic.com/downloads/free>
[3]: <https://my.datomic.com/datomic.com/datomic-free-edition-license.html>
[4]: <https://docs.docker.com/userguide/dockervolumes/#volume>
