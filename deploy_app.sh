#!/bin/sh
# Deploy the changes into the server

REPOSITORY=$(echo $1)
BRANCH=$(echo $2 | sed -e "s/refs\/heads\///g")
URL=$(echo $3)
CHECKOUT_BRANCH=$(echo $4)

# update or clone repository
if [ "$BRANCH" == "$CHECKOUT_BRANCH" ]; then
  if [ -d "$REPOSITORY" ]; then
    # force all updates
    cd $1
    git fetch --all
    git reset --hard origin/$BRANCH
    cd ..
  else
    git clone $URL -b $BRANCH
  fi

  # install dependences
  cd $REPOSITORY
  npm install
  cd ..
fi
