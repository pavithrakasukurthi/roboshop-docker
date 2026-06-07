# FROM python:3
# WORKDIR /opt/app
# COPY *.py .
# COPY requirements.txt .
# COPY payment.ini .
# RUN pip install -r requirements.txt
# ENV CART_HOST="cart" \
#     CART_PORT="8080" \
#     USER_HOST="user" \
#     USER_PORT="8080" \
#     AMQP_HOST="rabbitmq" \
#     AMQP_USER="roboshop" \
#     AMQP_PASS="roboshop123"
# CMD ["uwsgi", "--ini", "payment.ini"]

FROM python:3.9.25-alpine3.21 AS build
WORKDIR /opt/app
COPY requirements.txt .
RUN apk add --no-cache \
    build-base \
    linux-headers \
    pcre-dev
RUN pip3 install --prefix=/install -r requirements.txt
COPY *.py .
COPY payment.ini .

FROM python:3.9.25-alpine3.21
WORKDIR /opt/app
LABEL project="roboshop" \
      component="payment"
RUN apk add --no-cache pcre
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop 
COPY --from=build /install /usr/local
COPY --chown=roboshop:roboshop payment.ini *.py requirements.txt .
ENV CART_HOST="cart" \
    CART_PORT="8080" \
    USER_HOST="user" \
    USER_PORT="8080" \
    AMQP_HOST="rabbitmq" \
    AMQP_USER="roboshop" \
    AMQP_PASS="roboshop123"
USER roboshop
CMD ["uwsgi", "--ini", "payment.ini"]