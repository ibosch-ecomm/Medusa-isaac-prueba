# Dockerfile para MedusaJS - Optimizado para EasyPanel
FROM node:20-alpine

# Instalar dependencias del sistema necesarias
RUN apk add --no-cache python3 make g++

# Establecer directorio de trabajo
WORKDIR /app/medusa

# Copiar archivos de configuración de paquetes
COPY package.json yarn.lock .yarnrc.yml ./

# Instalar dependencias
RUN yarn install

# Copiar el resto del código fuente
COPY . .

# Construir la aplicación con medusa build (incluye admin)
RUN npx medusa build

# Exponer el puerto de Medusa
EXPOSE 9000

# Comando para ejecutar migraciones y arrancar el servidor
CMD ["sh", "-c", "npx medusa db:migrate && npx medusa start"]
