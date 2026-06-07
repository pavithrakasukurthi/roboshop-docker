# FROM node:20
# WORKDIR /opt/app
# COPY package.json .
# COPY *.js .
# RUN npm install
# ENV MONGO="true" \
#     MONGO_URL="mongodb://mongodb:27017/catalogue"
# CMD ["node", "server.js"]

FROM node:20 AS build
WORKDIR /opt/app
COPY package.json .
RUN npm install
COPY server.js .

FROM node:20
WORKDIR /opt/app
RUN groupadd -r roboshop && useradd -r -g roboshop roboshop
LABEL project="roboshop" \
      component="catalogue" 
#just for informational purpose, this will not actually open port 8080
EXPOSE 8080
ENV MONGO="true" \
    MONGO_URL="mongodb://mongodb:27017/catalogue"
COPY --from=build --chown=roboshop:roboshop /opt/app /opt/app
USER roboshop
CMD ["server.js"]
ENTRYPOINT ["node"]