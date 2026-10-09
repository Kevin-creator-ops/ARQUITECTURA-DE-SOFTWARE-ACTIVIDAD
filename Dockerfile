# Usamos la imagen base óptima para producción solicitada
FROM node:18-alpine

# Directorio de trabajo
WORKDIR /usr/src/app

# Copiamos archivos de dependencias
COPY package*.json ./

# Instalamos únicamente las dependencias de producción
RUN npm install --production

# Copiamos el código de la aplicación
COPY server.js test.js ./

# Exponemos el puerto 3000
EXPOSE 3000

# Comando para iniciar la aplicación
CMD ["npm", "start"]
