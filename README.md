# docker-fluentd

This Dockerfile produces a customized fluentd docker image containing a simple
configuration and the plugins listed below.

## Default Configuration

* listens on port 24224 with the `forward` input
* writes all entries to stdout

## Installed Plugins

* [fluent-plugin-elasticsearch](https://github.com/uken/fluent-plugin-elasticsearch)

## Override Configuration

A new configuration file can be mounted at `/fluentd/etc/fluent.conf`. See
https://hub.docker.com/r/fluent/fluentd/ for more details on customization.
