#!/bin/bash

cleanup() {
	echo 'shutdown...'
	pkill --oldest chrome
}

trap 'cleanup' SIGTERM

if [ ! "$DISPLAY" ]
then
	export DISPLAY=:80
fi

Xvfb $DISPLAY -screen 0 1920x1080x16 &
x11vnc -display $DISPLAY -bg -forever -nopw -quiet -listen 0.0.0.0 -xkb

google-chrome --user-data-dir='/config' --app='https://hexanyn.fr' --no-sandbox
wait
