pipeline {
    agent any
    environment {
		DOCKERHUB_CREDENTIALS=credentials('rajachigurupati-dockerhub')
	}

    stages {
        stage('pull and run') {
            steps {

               
                sh 'docker pull rajachigurupati/helloworld:1.0' 
		sh 'docker run -d -p 5000:3000 --name helloworld rajachigurupati/helloworld:1.0'
        }      
        }
        
    }
}
