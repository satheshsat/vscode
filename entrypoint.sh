#!/bin/bash

# Start code-server
exec /usr/bin/code-server --password sathesh@123 --bind-addr 0.0.0.0:8080 "$@"
