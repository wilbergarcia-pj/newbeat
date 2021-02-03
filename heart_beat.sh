#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Uso: newbeat profile store_name"
  echo "Ejemplo: newbeat pj-prod Talca"
  exit 1
fi

echo "[*] Searching last Heart Beat..."

output=`awslogs get /aws/elasticbeanstalk/middleware-production/var/app/containerfiles/logs/sidekiq.log --start='5 minutes' --profile $1 | grep "PedidosYa Heart Beat" | tail -1`

echo $output | grep -i --color $2
