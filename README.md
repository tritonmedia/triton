<p align="center"><img src="https://github.com/tritonjs/ui/raw/master/html/css/img/tb.png" /></p>

<p align="center">
  <a href="http://nodemc.space:8080/job/NodeMC/"><img src="https://img.shields.io/badge/build-broken-red.svg" alt="Build Status" /></a>
  <img src="https://img.shields.io/badge/license-MIT-brightgreen.svg" alt="License" />
</p>

<p align="center">The <i>final</i> media center</p>

# What is TRITON?

TRITON is a media pipeline that aims to go one step further than services like [Jellyfin](https://jellyfin.media) and [Plex](https://plex.tv) provide. Media is fetched from a magnitude of supported protocols (HTTP, S3-compatible, Usenet, etc), converted into multiple different quality levels, and then uploaded to a S3-compatible storage provider. This enables cheap storage and ensures that buffering is never a problem.

# Installing Triton

We have a few installation options:

  * [Quick evaluation](#quick-evaluation)
  * [Kubernetes](#kubernetes) 
  * [Docker](#docker)

### Quick Evaluation

**NOTE**: This is not a production setup. It has insecure credentials, and no data persistence.

```bash
$ docker-compose up
```

### Kubernetes

**NOTE**: This is a production setup, but it is in the process of being revamped to be more user friendly.

Clone the [charts](https://github.com/tritonmedia/charts) repo.

```bash
$ git clone git@github.com:tritonmedia/charts
$ cd charts
$ helm install ./tritonmedia
```

You should now have the triton platform running!

### Docker

**NOTE**: This is intended for a single-node setup.

```bash
$ cd contrib/docker-compose
```

You should checkout the `config/config.yaml` and the `docker-compose.yaml` here to assume that you are OK
with the `CHANGME` access_key and secret_key being set for minio, as well as the postgres passwords.

When you are:

```bash
$ docker-compose up -d
```

The pipeline is now running! The API is accessible at `<ip>:3401`

# Developing on Triton

## Dependencies

  * [Docker](https://docs.docker.com/install/)
  * [docker-compose](https://docs.docker.com/compose/install/)

Take a look at the config in `./config/config.example.yaml`. That contains information on what the config stucture is,
then look at `./config/config.yaml`. This is the config that will be used in this environment.

Then run the development script, which will pull down the latest versions of all services.

```bash
./bin/download-test-file.sh # Optional: Used to download a test file (used by ./bin/emulate-webhook.sh)
./development.sh
```

That's it, the services are now running

## Hacking on a service

Clone the service into this dir.

```bash
git clone git@github.com:tritonmedia/<service>

# Stop the running service
docker-compose stop <service>

# Export CONFIG_PATH (in the development repo, base, run this)
export CONFIG_PATH="$(pwd)/config/config.yaml"
```

Then run the service like normal. Yep. It's that simple.

## API Documentation

Services are "documented" in their Paw files located in [./paw](paw). Paw is an awesome API client that can
be located here: https://paw.cloud/. They have a free trial which can be used to export to Postman if you do not
want to purchase this client.

## Architecture

For now all we have documented is this graph: 

![service arch](https://raw.githubusercontent.com/tritonmedia/triton/master/Triton%20Media%20(High%20Level).png)

## Important Things

 * Config field is denoted by the `NODE_ENV` variable, assumes `debug` if not set.
For production use `NODE_ENV=production`.
 * Most applications use the `PORT` variable to determine which port to run on, you should set this when running locally.
