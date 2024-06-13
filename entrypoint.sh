#!/bin/bash

# Start code-server
exec /usr/bin/code-server --bind-addr 0.0.0.0:8080 --auth password --password sathesh@123 "$@"
