#!/usr/bin/env bash

# these env values come from the host or the Dockerfile
bin/transactor -Xmx$XMX -Xms$XMS transactor.properties
