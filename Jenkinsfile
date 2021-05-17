pipeline {
  agent any 
  tools {
    maven 'Maven'
  }
  stages {
    stage ('Initialize') {
      steps {
        sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
            ''' 
      }
    }
    
    
    stage ('Build') {
      steps {
      sh 'mvn clean package'
       }
    }
    
      stage ('Deploy-To-Tomcat') {
            steps {
           sshagent(['localhost']) {
                sh 'scp -o StrictHostKeyChecking=no target/*.war devuser@10.109.137.24:/opt/tomcat/apache-tomcat-9.0.46/webapps/webapp.war'
                                                                 
              }      
           }       
    }
    
        }
    
  }

