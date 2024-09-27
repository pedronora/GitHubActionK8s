FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/GitHubActionsExample-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]