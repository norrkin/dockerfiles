#!/bin/sh

handle_signal() {
  PID=$!
  echo "received signal. PID is ${PID}"
  kill -s SIGHUP $PID
}

trap "handle_signal" SIGINT SIGTERM SIGHUP

echo "Starting sonarr..."
su nzbdrone -c 'mono /opt/NzbDrone/NzbDrone.exe --no-browser -data=/config' & wait
echo "Stopping sonarr"