#!/bin/sh

echo "=== Iniciando MedusaJS ==="

# Verificar si ya existe el build del admin
if [ ! -d ".medusa/server" ]; then
    echo "=== Ejecutando medusa build (primera vez) ==="
    npx medusa build
fi

echo "=== Ejecutando migraciones de base de datos ==="
npx medusa db:migrate

echo "=== Iniciando servidor Medusa ==="
npx medusa start
