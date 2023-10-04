# Use a base image that includes JRE (since you have Java already)
FROM openjdk:11-jre-slim

# Set the working directory to /app
WORKDIR /app

# Copy any JAR file in the current directory into the container
COPY *.jar app.jar

# Expose the port your Spring Boot application listens on (if needed)
EXPOSE 8080

# Define environment variables for the application (if needed)
ENV SPRING_PROFILES_ACTIVE=production

# Run the Spring Boot application
CMD ["java", "-jar", "app.jar"]
