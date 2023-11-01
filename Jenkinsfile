pipeline {
    agent any
    
    environment {
        // Define environment variables here if needed
        DOCKER_REGISTRY = 'docker.io/ankitchauhan18aa'
    }
    
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Build and tag the Docker image
                    docker.build("${DOCKER_REGISTRY}/springboot:lts")
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    // Push the Docker image to the registry
                    docker.withRegistry("${DOCKER_REGISTRY}", 'your-docker-credentials') {
                        docker.image("${DOCKER_REGISTRY}/springboot:lts").push()
                    }
                }
            }
        }
        
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    // Apply Kubernetes configurations using kubectl with a default config
                    sh "kubectl apply -f kubernetes/deployment.yaml"
                }
            }
        }
        
        stage('Cleanup') {
            steps {
                script {
                    // Clean up resources if needed
                    echo "done"
                }
            }
        }
    }
    
    post {
        always {
            // Clean up Docker images
            sh "docker rmi -f ${DOCKER_REGISTRY}/springboot:lts"
        }
    }
}
