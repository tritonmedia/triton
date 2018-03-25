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

First you'll need to fill out the example config in `config/config.example.yaml` and name
that to `config/config.yaml`.

Then you'll need to run:

```bash
./development.sh
```

That's it!

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

* `export DEBUG=media:*` for debug logging