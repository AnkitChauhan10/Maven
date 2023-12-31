pipeline {
    agent any
    
    environment {
        
        DOCKER_REGISTRY = 'https://hub.docker.com/repository/docker/ankitchauhan18/springboot'
    }
    
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    
                    docker.build("${DOCKER_REGISTRY}/springboot:latest")
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                   
                    docker.withRegistry("${DOCKER_REGISTRY}", 'your-docker-credentials') {
                        docker.image("${DOCKER_REGISTRY}/springboot:latest").push()
                    }
                }
            }
        }
        
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    
                    sh "kubectl apply -f kubernetes/deployment.yaml"
                }
            }
        }
        
        stage('Cleanup') {
            steps {
                script {
                    
                    echo "done"
                }
            }
        }
    }
    
    post {
        always {
            // Clean up Docker images
            sh "docker rmi -f ${DOCKER_REGISTRY}/springboot:latest"
        }
    }
}
