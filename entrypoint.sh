#!/bin/bash

# Start code-server
exec PASSWORD=sathesh@123 /usr/bin/code-server --auth password --bind-addr 0.0.0.0:8080
