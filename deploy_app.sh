#!/bin/sh
# Deploy the changes into the server

REPOSITORY=$(echo $1)
BRANCH=$(echo $2 | sed -e "s/refs\/heads\///g")
URL=$(echo $3)

# update or clone repository
if [ "$BRANCH" == "master" ]; then
  if [ -d "$REPOSITORY" ]; then
    # force all updates
    cd $1
    git fetch --all
    git reset --hard origin/$BRANCH
    cd ..
  else
    git clone $URL -b $BRANCH
  fi
fi

# install dependences
cd $REPOSITORY
npm install
cd ..
