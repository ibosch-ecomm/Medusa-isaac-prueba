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

# Dar permisos de ejecución al script de inicio
RUN chmod +x start.sh

# Exponer el puerto de Medusa
EXPOSE 9000

# Usar el script de inicio que hace build + migrate + start
CMD ["./start.sh"]
