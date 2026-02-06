# Java Docker Application
This project demonstrates containerization of a Spring Boot Java application using Docker.
It covers:
Docker image creation
Container lifecycle management
Multi-container setup using Docker Compose 
Pushing and pulling images from Docker Hub
---
## Prerequisites
Ensure the following tools are installed:
Docker (20.10 or later)
Docker Compose (v2 or later)
Java 17 
Maven
Git
Docker Hub account

---
## Project Structure

java-docker-app/
│
├── Dockerfile
├── docker-compose.yml
├── pom.xml
├── README.md
└── src/
└── main/
├── java/
└── resources/


## Step 1: Build the Application
Build the Spring Boot application and generate the JAR file:
mvn clean package

The JAR file will be created in the target/ directory.

## Step 2: Build Docker Image
Build the Docker image:
docker build -t java-docker-app .

Verify the image:
docker images


## Step 3: Run Docker Container
Run the Docker container:
docker run -d -p 8081:8080 java-docker-app

Access the application:
http://localhost:8081


## Step 4: Docker Container Management Commands
List running containers:
docker ps

List all containers:
docker ps -a

Stop a container:
docker stop <container_id>

Start a container:
docker start <container_id>

Inspect a container:
docker inspect <container_id>

View container logs:
docker logs <container_id>

Remove a container:
docker rm <container_id>


## Step 5: Multi-Container Application Using Docker Compose
This project uses Docker Compose to run:
Spring Boot application
MySQL database

Start services
docker compose up --build

Run in detached mode:
docker compose up -d

Check running services:
docker compose ps

Stop services:
docker compose down

Stop services and remove volumes:
docker compose down -v

Access the application (Docker Compose):
http://localhost:8082


## Step 6: Docker Hub – Push and Pull Images
Login to Docker Hub:
docker login

Tag the Docker image:
docker tag java-docker-app apurba24/java-docker-app:1.0

Push image to Docker Hub:
docker push apurba24/java-docker-app:1.0

Pull image from Docker Hub:
docker pull apurba24/java-docker-app:1.0

Run the image pulled from Docker Hub:
docker run -d -p 8083:8080 apurba24/java-docker-app:1.0

Access the application:
http://localhost:8083


## Features Implemented
Docker installation verification
Java application containerization 
Dockerfile creation
Docker container lifecycle management
Inspecting containers and viewing logs
Multi-container setup using Docker Compose
MySQL database integration
Docker Hub image push and pull

## Notes
Docker Compose automatically creates a network for services.
MySQL data is persisted using Docker volumes.
Different ports are used to avoid conflicts.
