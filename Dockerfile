FROM node:18-alpine

# Crear usuario no root (la imagen node de alpine ya trae el usuario 'node')
WORKDIR /app

# Copiar e instalar dependencias
COPY package*.json ./
RUN npm ci --only=production

# Copiar código fuente
COPY . .

# Cambiar permisos y usuario
RUN chown -R node:node /app
USER node

# Exponer puerto del backend
EXPOSE 3000

CMD ["npm", "start"]
