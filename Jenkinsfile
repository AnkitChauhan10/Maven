pipeline {
    agent any

    stages {
        stage('Build and Package') {
            steps {
                // Checkout the source code from your version control system
                checkout scm

                // Build your Spring Boot application using Maven
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build a Docker image from the Spring Boot application
                sh 'docker build -t springboot:lts .'
            }
        }

        stage('Push Docker Image') {
            steps {
                // Log in to your Docker registry using credentials
                withCredentials([usernamePassword(credentialsId: 'your-docker-creds', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"
                }

                // Push the Docker image to your registry
                sh 'docker push springboot:lts'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                // Configure kubectl with your Kubernetes cluster credentials
                withCredentials([file(credentialsId: 'your-kubeconfig-creds', variable: 'KUBECONFIG')]) {
                    sh "KUBECONFIG=$KUBECONFIG kubectl apply -f your-deployment.yaml"
                }
            }
        }
    }
}
