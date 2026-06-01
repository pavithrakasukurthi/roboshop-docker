FROM python:3
WORKDIR /opt/app
COPY *.py .
COPY requirements.txt .
COPY payment.ini .
RUN pip install -r requirements.txt
ENV CAR_HOST="cart" \
    CART_PORT="8080" \
    USER_HOST="user" \
    USER_PORT="8080" \
    AMQP_HOST="rabbitmq" \
    AMQP_USER="roboshop" \
    AMQP_PASS="roboshop123"
CMD ["uwsgi", "--ini", "payment.ini"]