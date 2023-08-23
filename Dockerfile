FROM maven:4.0.0-eclipse-temurin-20 AS build
COPY . .
RUN mvn clean package -DskipTests
FROM eclipse-temurin:20-alpine
COPY --from=build /target/demo-0.0.1-SNAPSHOT.jar demo.jar
EXPOSE 8080
ENTRYPOINT [“java”, “-jar”, “demo.jar”]