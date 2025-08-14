FROM openjdk:17-jdk-slim AS builder

COPY . .

RUN ./gradlew bootJar

FROM openjdk:17-jdk-slim AS final

COPY --from=builder /build/libs/devops-20251-0.0.1-SNAPSHOT.jar .

EXPOSE 8080

CMD ["java", "-jar", "devops-20251-0.0.1-SNAPSHOT.jar"]

