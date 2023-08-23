FROM maven:3-eclipse-temurin-20 AS build
COPY . .
RUN mvn clean package -Pprod -DskipTests
FROM eclipse-temurin:20-alpine
COPY --from=build /target/spring-boot-1.0.0.jar demo.jar
EXPOSE 8080
ENTRYPOINT [“java”,“-jar”,“demo.jar”]