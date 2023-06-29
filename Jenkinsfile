pipeline {
    agent any
    environment {
		DOCKERHUB_CREDENTIALS=credentials('rajachigurupati-dockerhub')
	}

    stages {
        stage('pull and run') {
            steps {

               
		sh 'sudo docker build -t rajachigurupati/rksimha:chetana .'
                sh 'sudo chmod 666 /var/run/docker.sock'
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                sh 'docker push rajachigurupati/rksimha:chetana'
        }      
        }
        
    }
}
