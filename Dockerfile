
FROM eclipse-temurin:25-jdk

WORKDIR /app

# Copy current directory into container
COPY target/*.jar app.jar
# Install dependencies if requirements.txt exists (ignore failure if not present)
RUN pip install --no-cache-dir -r requirements.txt || true

# Default command: lightweight static file server on port 8000
EXPOSE  8081
ENTRYPOINT ["java", "-jar", "app.jar"]
