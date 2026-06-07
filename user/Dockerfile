# FROM node:20-alpine
# WORKDIR /opt/app
# COPY package.json .
# COPY server.js .
# RUN npm install
# ENV MONGO="true" \
#     REDIS_URL="redis://redis:6379" \
#     MONGO_URL="mongodb://mongodb:27017/users" 
# CMD ["node", "server.js"]

FROM node:20.19.5-alpine3.21 AS build
WORKDIR /opt/app
COPY package.json .
RUN npm install
COPY server.js .

FROM node:20.19.5-alpine3.21
WORKDIR /opt/app
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
LABEL project="roboshop" \
      component="user" 
ENV MONGO="true" \
    REDIS_URL="redis://redis:6379" \
    MONGO_URL="mongodb://mongodb:27017/users" 
#just for informational purpose, this will not actually open port 8080
EXPOSE 8080 
COPY --from=build --chown=roboshop:roboshop /opt/app /opt/app
USER roboshop
CMD ["server.js"]
ENTRYPOINT ["node"]