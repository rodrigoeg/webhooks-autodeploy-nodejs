#!/bin/sh
# Start the server

REPOSITORY=$(echo $1)
BRANCH=$(echo $2 | sed -e "s/refs\/heads\///g")
URL=$(echo $3)
CHECKOUT_BRANCH=$(echo $4)

if [ "$BRANCH" == "$CHECKOUT_BRANCH" ]; then
  if [ "$BRANCH" == "staging" ]; then
    forever start ./$REPOSITORY/cluster.js \
      --server-port=8080 \
      --auth-uri=http://prj02.lasca.ic.unicamp.br:80 \
      --calendar-uri=http://prj13.lasca.ic.unicamp.br:80 \
      --courses-uri=http://prj04.lasca.ic.unicamp.br:80 \
      --school-history-uri=http://prj12.lasca.ic.unicamp.br:8080
  fi

  if [ "$BRANCH" == "master" ]; then
    forever start ./$REPOSITORY/cluster.js \
      --server-port=8080 \
      --auth-uri=http://prj01.lasca.ic.unicamp.br:80 \
      --calendar-uri=http://prj14.lasca.ic.unicamp.br:80 \
      --courses-uri=http://prj03.lasca.ic.unicamp.br:80 \
      --school-history-uri=http://prj11.lasca.ic.unicamp.br:8080
  fi
fi
