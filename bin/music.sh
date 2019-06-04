#!/usr/bin/env bash

getTitle() {
  artist=$(playerctl metadata artist)
  title=$(playerctl metadata title)

  echo "${title} | ${artist}"
}

isPlaying() {
  status=$(playerctl status)
  if [ "${status}" = "Playing" ]; then
    echo $status; exit
  fi
  exit 1
}

case "$1" in
    --title)
        getTitle
    ;;
    --isPlaying)
        isPlaying
    ;;
esac
