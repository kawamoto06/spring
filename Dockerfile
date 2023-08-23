FROM maven:3-eclipse-temurin-17 AS build
COPY . .
RUN mvn clean package -Pprod -DskipTests
FROM eclipse-temurin:17-alpine
COPY --from=build /target/spring-1.0.0.jar demo.jar # <- changed file name
EXPOSE 8080
ENTRYPOINT [“java”,“-jar”,“demo.jar”]