# FROM eclipse-temurin:25-jre
# WORKDIR /app
# COPY target/Maven-1.0-SNAPSHOT.jar /app/snake-game.jar
# EXPOSE 8080
# CMD ["java", "-jar", "snake-game.jar"]


# =========================
FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /app

COPY . .

RUN mvn clean package

# =========================
# Stage 2 - Runtime Stage
# =========================
FROM eclipse-temurin:17-jre

WORKDIR /app

COPY target/Maven-1.0-SNAPSHOT.jar /app/snake-game.jar

EXPOSE 8080
CMD ["java", "-jar", "snake-game.jar"]