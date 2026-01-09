#!/bin/sh

echo "=== Iniciando MedusaJS ==="

# Verificar si existe el build del admin (archivo index.html)
ADMIN_INDEX="/app/medusa/.medusa/server/public/admin/index.html"

if [ ! -f "$ADMIN_INDEX" ]; then
    echo "=== Build del admin no encontrado, ejecutando medusa build ==="
    npx medusa build
    
    # Verificar que el build se completó correctamente
    if [ ! -f "$ADMIN_INDEX" ]; then
        echo "=== ERROR: El build no generó el archivo index.html del admin ==="
        echo "=== Contenido de .medusa: ==="
        ls -la /app/medusa/.medusa/ 2>/dev/null || echo "Directorio .medusa no existe"
        ls -la /app/medusa/.medusa/server/ 2>/dev/null || echo "Directorio server no existe"
        ls -la /app/medusa/.medusa/server/public/ 2>/dev/null || echo "Directorio public no existe"
        ls -la /app/medusa/.medusa/server/public/admin/ 2>/dev/null || echo "Directorio admin no existe"
        exit 1
    fi
else
    echo "=== Build del admin encontrado, saltando build ==="
fi

echo "=== Ejecutando migraciones de base de datos ==="
npx medusa db:migrate

echo "=== Iniciando servidor Medusa ==="
npx medusa start
