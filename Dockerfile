# Fase 1: Build da aplicação
FROM maven:3.8.6-openjdk-17 AS builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Fase 2: Imagem final para execução
FROM openjdk:17-jdk-slim
WORKDIR /app
# Copie o JAR gerado na fase de build
COPY --from=builder /app/target/GitHubActionsExample-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]