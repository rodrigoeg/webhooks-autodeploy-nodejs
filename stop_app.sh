#!/bin/sh
# Stop the server

REPOSITORY=$(echo $1)
BRANCH=$(echo $2 | sed -e "s/refs\/heads\///g")
URL=$(echo $3)
CHECKOUT_BRANCH=$(echo $4)

if [ "$BRANCH" == "$CHECKOUT_BRANCH" ]; then
  forever stop $REPOSITORY/cluster.js
fi
