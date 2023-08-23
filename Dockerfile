FROM maven:3-eclipse-temurin-20 AS build
COPY . .
RUN mvn clean package -Dmaven.test.skip=true
FROM eclipse-temurin:20-alpine
COPY --from=build /target/DemoApplication-1.0.0.jar demo.jar
EXPOSE 8080
ENTRYPOINT [“java”,“-jar”,“demo.jar”]