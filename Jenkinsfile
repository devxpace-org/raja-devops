pipeline {
    agent any
    environment {
		DOCKERHUB_CREDENTIALS=credentials('rajachigurupati-dockerhub')
	}

    stages {
        stage('pull and run') {
            steps {

               
                sh 'docker pull rajachigurupati/nicejob:1.0'
		sh 'docker run rajachigurupari/nicejob:1.0'    
        }      
        }
        
    }
}
