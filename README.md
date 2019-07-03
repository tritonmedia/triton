<p align="center"><img src="https://github.com/tritonjs/ui/raw/master/html/css/img/tb.png" /></p>

<p align="center">
  <a href="http://nodemc.space:8080/job/NodeMC/"><img src="https://img.shields.io/badge/build-broken-red.svg" alt="Build Status" /></a>
  <img src="https://img.shields.io/badge/license-MIT-brightgreen.svg" alt="License" />
</p>

<p align="center">A Media Pipeline</p>

# What is TRITON?

TRITON is a media pipeline that is aimed towards converting media from unknown formats to a common format,
and upload them to S3. The idea usecase is for uploading media to S3 to then be used by 
[Jellyfin](https://github.com/jellyfin)/[Plex](https://github.com/plex).

# Developing on Triton

## Dependencies

  * [Docker](https://docs.docker.com/install/)
  * [docker-compose](https://docs.docker.com/compose/install/)

Take a look at the config in `./config/config.example.yaml`. That contains information on what the config stucture is,
then look at `./config/config.yaml`. This is the config that will be used in this environment.

Then run the development script, which will pull down the latest versions of all services.

```bash
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

## Important Things

 * Config field is denoted by the `NODE_ENV` variable, assumes `debug` if not set.
For production use `NODE_ENV=production`.
 * Most applications use the `PORT` variable to determine which port to run on, you should set this when running locally.