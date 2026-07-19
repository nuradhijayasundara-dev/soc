pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: ' https://github.com/nuradhijayasundara-dev/soc.git'
            }
        }

        stage('Build Spring Boot') {
            steps {
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t student-api .'
            }
        }

        stage('Run Docker Container') {
            steps {
                bat 'docker stop student-api-container || exit 0'
                bat 'docker rm student-api-container || exit 0'
                bat 'docker run -d --name student-api-container -p 8081:8081 student-api'
            }
        }
    }
}