pipeline {
    agent any

    stages {
        stage('Build and Deploy') {
            steps {
                sh 'sudo docker build -t raja-test:1.0 .'          
            }
        }
    }
}