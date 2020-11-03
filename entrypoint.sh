#!/bin/sh

set -e

if [[ -n "$RCLONE_CONF" ]]
then
  mkdir -p ~/.config/rclone
  echo "$RCLONE_CONF" > ~/.config/rclone/rclone.conf
fi
if [[ -n "$PRUGE_IF_EXISTS" ]]
then
  rclone purge "$PRUGE_IF_EXISTS" || true
fi

sh -c "rclone $*"
