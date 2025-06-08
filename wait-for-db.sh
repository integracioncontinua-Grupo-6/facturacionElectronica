#!/bin/sh
set -e

host="$1"
shift
cmd="$@"

echo "Esperando a que MySQL ($host) esté disponible..."
echo "Usando credenciales: $DB_USERNAME / $DB_PASSWORD"

until mysql -h "$host" -u "$DB_USERNAME" -p"$DB_PASSWORD" -e 'SELECT 1' >/dev/null 2>&1; do
  echo "MySQL no está listo, esperando 3 segundos..."
  sleep 3
done

echo "MySQL está listo, ejecutando comando: $cmd"
exec $cmd
