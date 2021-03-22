pipeline {
    environment {
        registry = "suerhf/devops_project1"
        registryCredential = 'dockerhub' 
        dockerImage = '' 
    }
    agent any
    stages {
        stage('Building image') {
            steps {
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
            }
        }
    }
        stage('Deploy image') {
            steps {
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Cleaning up') {
            steps {
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }
    }
}
