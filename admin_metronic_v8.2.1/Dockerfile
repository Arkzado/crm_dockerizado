# 1. Usar una imagen base de Node.js
FROM node:20-alpine

# 2. Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# 3. Copiar los archivos de dependencias
COPY package.json package-lock.json ./

# 4. Instalar las dependencias (Angular CLI y node_modules)
# Se instala Angular CLI globalmente dentro del contenedor
RUN npm install -g @angular/cli
RUN npm install

# 5. Copiar el resto del código fuente de la aplicación
COPY . .

# 6. Exponer el puerto por defecto de Angular
EXPOSE 3200