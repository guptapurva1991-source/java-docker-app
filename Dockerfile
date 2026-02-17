# -------- Stage 1: Build --------
FROM maven:3.9.6-eclipse-temurin-17 AS builder
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean package -DskipTests
# -------- Stage 2: Runtime --------
FROM eclipse-temurin:17-jre-alpine
# Create non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar
# Change ownership
RUN chown -R appuser:appgroup /app
# Switch to non-root user
USER appuser
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]
