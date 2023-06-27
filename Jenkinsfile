pipeline {
    agent any
    environment {
		DOCKERHUB_CREDENTIALS=credentials('rajachigurupati-dockerhub')
	}

    stages {
        stage('pull and run') {
            steps {

               
                sh 'docker pull rajachigurupati/nicejob:1.0' 
		sh 'docker run -d -p 5000:3000 --name nicejob rajachigurupati/nicejob:1.0'
        }      
        }
        
    }
}
