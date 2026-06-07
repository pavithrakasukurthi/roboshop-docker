# FROM maven:3.9.11
# WORKDIR /opt/app
# COPY pom.xml .
# COPY src ./src
# RUN mvn clean package
# RUN mv target/shipping-1.0.jar shipping.jar
# ENV CART_ENDPOINT="cart:8080" \
#     DB_HOST="mysql"
# CMD ["java", "-jar", "shipping.jar"]

FROM maven:3.9.11 AS build
WORKDIR /opt/app
COPY pom.xml .
RUN mvn clean install && mv target/shipping-1.0.jar shipping.jar
COPY src ./src

FROM eclipse-temurin:17-jre-alpine
WORKDIR /opt/app
RUN groupadd -r roboshop && useradd -r -g roboshop roboshop
LABEL project="roboshop" \
      component="shipping"
ENV CART_ENDPOINT="cart:8080" \
    DB_HOST="mysql"
COPY --from=build --chown=roboshop:roboshop /opt/app/shipping.jar .
USER roboshop
ENTRYPOINT ["sh", "-c", "sleep 30 && java -jar shipping.jar"]