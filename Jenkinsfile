pipeline {
    agent any
    environment {
		DOCKERHUB_CREDENTIALS=credentials('rajachigurupati-dockerhub')
	}

    stages {
        stage('Build and Deploy') {
            steps {

                
                sh 'sudo docker build -t rajachigurupati/nicejob:1.0 .'
                sh 'sudo chmod 666 /var/run/docker.sock'
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                sh 'docker push rajachigurupati/nicejob:1.0'
        }      
        }
        
    }
}
