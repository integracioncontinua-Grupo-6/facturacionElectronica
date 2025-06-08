#!/bin/sh
set -e

host="$1"
shift
cmd="$@"

sleep 30

echo "MySQL está listo, ejecutando comando: $cmd"
exec $cmd
