#!/bin/sh
# Start the server

REPOSITORY=$(echo $1)

forever start ./$REPOSITORY/cluster.js \
--server-port=80 \
--auth-uri=http://prj02.lasca.ic.unicamp.br:80 \
--calendar-uri=http://prj13.lasca.ic.unicamp.br:80 \
--courses-uri=http://prj04.lasca.ic.unicamp.br:80 \
--school-history-uri=http://prj08.lasca.ic.unicamp.br:80
