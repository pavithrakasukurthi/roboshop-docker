# FROM node:20
# WORKDIR /opt/app
# COPY package.json .
# COPY *.js .
# RUN npm install
# ENV REDIS_HOST="redis" \
#     CATALOGUE_HOST="catalogue" \
#     CATALOGUE_PORT="8080"
# CMD ["node", "server.js"]

FROM node:20 AS build
WORKDIR /opt/app
COPY package.json .
RUN npm install
COPY server.js .

FROM node:20
WORKDIR /opt/app
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
LABEL project="roboshop" \
      component="cart" 
ENV REDIS_HOST="redis" \
    CATALOGUE_HOST="catalogue" \
    CATALOGUE_PORT="8080"
#just for informational purpose, this will not actually open port 8080
EXPOSE 8080 
COPY --from=build --chown=roboshop:roboshop /opt/app /opt/app
USER roboshop
CMD ["server.js"]
ENTRYPOINT ["node"]