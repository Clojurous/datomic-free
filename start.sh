#!/usr/bin/env bash

#sed "/host=0.0.0.0/a alt-host=${ALT_HOST:-127.0.0.1}" -i transactor.properties

#bin/transactor -Xmx$XMX -Xms$XMS transactor.properties
bin/transactor -Xmx512m -Xms$XMS transactor.properties
