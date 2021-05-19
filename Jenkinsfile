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
    
     
    sh 'ssh -o StrictHostKeyChecking=no -l cloudbees 192.168.1.106 uname -a'
    
      stage ('Deploy-To-Tomcat') {
            steps { 
              sshagent (credentials: ['devuser']) {
                sh 'ssh -o StrictHostKeyChecking=no -l DEVSECOPS-UBLNX1 10.109.137.24 uname -devuser'
               
              } 
           }       
         }
    
   }
    
  }

