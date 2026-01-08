import { loadEnv, defineConfig } from '@medusajs/framework/utils'

loadEnv(process.env.NODE_ENV || 'development', process.cwd())

module.exports = defineConfig({
  projectConfig: {
    databaseUrl: process.env.DATABASE_URL,
    // Configuración de Redis para caché y sesiones
    redisUrl: process.env.REDIS_URL,
    http: {
      storeCors: process.env.STORE_CORS!,
      adminCors: process.env.ADMIN_CORS!,
      authCors: process.env.AUTH_CORS!,
      jwtSecret: process.env.JWT_SECRET || "supersecret",
      cookieSecret: process.env.COOKIE_SECRET || "supersecret",
    },
    // Deshabilitar SSL para conexiones Docker internas
    databaseDriverOptions: {
      ssl: false,
    },
  },
  admin: {
    // Configuración de Vite para Docker
    vite: (config) => {
      return {
        ...config,
        server: {
          ...config.server,
          host: true,
          port: 5173,
          strictPort: true,
          watch: {
            usePolling: true,
          },
        },
      }
    },
  },
})
