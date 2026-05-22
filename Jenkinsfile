pipeline {
    agent any

    environment {
        IMAGE_NAME = "tfc-website"
        CONTAINER_NAME = "tfc-container"
    }

    stages {

        stage('Clone Repository') {
            steps {
                git 'https://github.com/karthikjerryd/tfc.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh '''
                docker stop $CONTAINER_NAME || true
                docker rm $CONTAINER_NAME || true
                '''
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
                docker run -d \
                --name $CONTAINER_NAME \
                -p 8080:80 \
                $IMAGE_NAME
                '''
            }
        }
    }

    post {
        success {
            echo 'Website deployed successfully!'
        }

        failure {
            echo 'Pipeline failed!'
        }
    }
}