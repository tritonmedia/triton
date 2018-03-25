# TODO

Quick write up of things to do:


## Items

  * ~~Move from kue (redis based job queue) to RabbitMQ (then maybe use something like splinter, a queue length based autoscaler.)~~
  * Convert beholder, or converter to go
  * Rename events, since it should just be the entrypoint. API?
  * Automate the setup process, i.e attempt to read a board for the relevant labels and build a config. (tooling)
  * Investigate better solutions for Twilight on determining media name (hacky regex is :(, maybe ping @jakl)