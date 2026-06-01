FROM node:20-alpine
WORDIR /opt/app
COPY package.json .
COPY server.js .
RUN npm install
ENV REDIS_HOST="redis" \
    CATALOGUE_HOST="catalogue" \
    CATALOGUE_PORT="8080"
CMD ["node", "server.js"]