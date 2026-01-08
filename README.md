# MedusaJS - Configurado para EasyPanel

Este repositorio contiene una instalación de MedusaJS preconfigurada para desplegarse en **EasyPanel** usando Docker.

## Requisitos

- Un servidor con EasyPanel instalado
- Acceso a GitHub desde EasyPanel

## Despliegue en EasyPanel

### Paso 1: Crear un nuevo proyecto

1. Accede a tu panel de EasyPanel
2. Haz clic en "Create Project"
3. Asigna un nombre descriptivo al proyecto

### Paso 2: Añadir PostgreSQL

1. Dentro del proyecto, haz clic en "+ Service"
2. Selecciona "Postgres"
3. Configura un nombre y contraseña
4. Haz clic en "Create"
5. **Guarda la URL de conexión** de la sección de credenciales

### Paso 3: Añadir Redis

1. Haz clic en "+ Service"
2. Selecciona "Redis"
3. Configura un nombre y contraseña
4. Haz clic en "Create"
5. **Guarda la URL de conexión** de la sección de credenciales

### Paso 4: Crear la aplicación

1. Haz clic en "+ Service" y selecciona "App"
2. Asigna un nombre a la aplicación
3. En **Source**, selecciona "GitHub" y proporciona este repositorio
4. En **Build**, selecciona "Dockerfile"
5. En **Environment**, añade las siguientes variables:

```
DATABASE_URL=<URL de PostgreSQL del paso 2>
REDIS_URL=<URL de Redis del paso 3>
JWT_SECRET=<genera un secreto aleatorio>
COOKIE_SECRET=<genera otro secreto aleatorio>
NODE_ENV=production
STORE_CORS=https://tu-storefront.com
ADMIN_CORS=https://tu-dominio-easypanel.com
AUTH_CORS=https://tu-dominio-easypanel.com
```

### Paso 5: Configurar el dominio

1. Ve a la sección "Domains & Proxy"
2. Añade tu dominio
3. Configura el puerto proxy como **9000**

### Paso 6: Desplegar

1. Haz clic en "Deploy"
2. Monitorea el progreso en "Deployments"

## Verificar la instalación

Una vez desplegado, accede a:
- **API**: `https://tu-dominio.com/store/products`
- **Admin**: `https://tu-dominio.com/app`

## Desarrollo local

Para desarrollo local con Docker Compose:

```bash
# Iniciar todos los servicios
docker compose up -d

# Ver logs
docker compose logs -f medusa

# Detener servicios
docker compose down
```

## Variables de entorno

| Variable | Descripción |
|----------|-------------|
| `DATABASE_URL` | URL de conexión a PostgreSQL |
| `REDIS_URL` | URL de conexión a Redis |
| `JWT_SECRET` | Secreto para tokens JWT |
| `COOKIE_SECRET` | Secreto para cookies de sesión |
| `STORE_CORS` | Dominios permitidos para la tienda |
| `ADMIN_CORS` | Dominios permitidos para el admin |
| `AUTH_CORS` | Dominios permitidos para autenticación |
| `NODE_ENV` | Entorno (development/production) |

## Soporte

- [Documentación de MedusaJS](https://docs.medusajs.com/)
- [Documentación de EasyPanel](https://easypanel.io/docs)
