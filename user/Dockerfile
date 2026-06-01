FROM node:20-alpine
WORKDIR /opt/app
COPY package.json .
COPY server.js .
RUN npm install
ENV MONGO="true" \
    MONGO_URL="mongodb"//mongodb:27017/users" \
    REDIS_URL="redis://redis:6379"
CMD ["node", "server.js"]
