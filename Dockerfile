FROM openjdk:17.0.2-jdk-slim as builder
RUN mkdir /electronic-invoice-api
WORKDIR /electronic-invoice-api
COPY . /electronic-invoice-api
RUN ./gradlew build -x test

FROM openjdk:17.0.2-jdk-slim
COPY --from=builder electronic-invoice-api/build/libs/electronic-invoice-api-*-all.jar electronic-invoice-api.jar
EXPOSE 8080
ENTRYPOINT ["sh", "-c", "java -jar  electronic-invoice-api.jar"]