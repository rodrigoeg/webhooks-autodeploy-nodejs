#!/bin/sh
# Stop the server

REPOSITORY=$(echo $1)

forever stop $REPOSITORY/cluster.js
