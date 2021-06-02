pipeline {
    agent any
	environment { 
3
        registry = "pdockersavant/jenkins-cicd-docker" 
4
        registryCredential = 'dockerhub' 
5
        dockerImage = '' 
6
    }

 stages {
      stage('Checkout') {
           steps {
             
                git branch: 'master', url: 'https://github.com/pravinksavant/CI-CD-using-Docker.git'
             
          }
        }
	 stage('Build App') {
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
                script { 
                   docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push() 
                    }
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
    
