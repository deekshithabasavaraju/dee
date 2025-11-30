# Stage 1: build
FROM maven:3.9.4-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn -B -DskipTests package

# Stage 2: run
FROM eclipse-temurin:17-jre-jammy
ARG JAR_FILE=/app/target/simple-monolith-0.0.1-SNAPSHOT.jar
COPY --from=build /app/target/*.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]
