#!/bin/sh
# Deploy the changes into the server

# update or clone repository
if [ "$2" == "refs/heads/development" ]; then
  if [ -d "$1" ]; then
    # force all updates
    git fetch --all
    git reset --hard origin/$2
  else
    git clone $3 -b $2
  fi
fi

# install dependences
cd $1
npm install
cd ..
