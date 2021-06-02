pipeline {
    agent any
	

 stages {
      stage('checkout') {
           steps {
             
                git branch: 'master', url: 'https://github.com/pravinksavant/CI-CD-using-Docker.git'
             
          }
        }
	 stage('Execute Maven') {
           steps {
             
                sh 'mvn package'             
          }
        }
        

  stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t demowebapp:latest .' 
                sh 'docker tag demowebapp pdockersavant/demowebapp:latest'
                               
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
       // withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
          sh  'docker push pdockersavant/demowebapp:latest'
           }
                  
          }
        }
     
      stage('Run Docker container') {
             
            steps 
			{
                sh "docker run -d -p 8888:8080 pdockersavant/demowebapp"
 
            }
        }
     }
	}
    
