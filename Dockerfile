# 1. Imagen base oficial, ligera (Alpine Linux)
FROM node:20-alpine

# 2. Directorio de trabajo
WORKDIR /app

# 3. Copiar primero los archivos de dependencias (optimiza la cache de capas)
COPY package*.json ./

# 4. Instalar solo dependencias de produccion
RUN npm ci --only=production

# 5. Copiar el codigo fuente
COPY src/ ./src/

# 6. No ejecutar como root: la imagen trae el usuario 'node'
USER node

# 7. Exponer el puerto de la app
EXPOSE 3000

# 8. Comando por defecto
CMD ["node", "src/index.js"]
