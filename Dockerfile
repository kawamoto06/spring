FROM maven:3-jdk-20 AS build
COPY . .
RUN mvn clean package -Dmaven.test.skip=true
FROM openjdk:20-jdk-slim
COPY --from=build /target/demo-0.0.1-SNAPSHOT.jar demo.jar
EXPOSE 8080
ENTRYPOINT [“java”, “-jar”, “demo.jar”]