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
        
     stage ('Deploy-To-Apache') {
            steps {
           sshagent(['devuser']) {
                sh 'scp -o StrictHostKeyChecking=no target/*.war devuser@10.109.137.24:/opt/apache-tomcat-8.5.66/webapps/webapp.war'
              }      
           }       
    }
    
    
   }
    
  }

