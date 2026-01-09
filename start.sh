#!/bin/sh

echo "=== Iniciando MedusaJS ==="

echo "=== Ejecutando migraciones de base de datos ==="
npx medusa db:migrate

echo "=== Iniciando servidor Medusa en puerto 9000 ==="
npx medusa start
