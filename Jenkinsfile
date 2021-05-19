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
              sshagent (credentials: ['devuser']) {
                sh 'ssh -o StrictHostKeyChecking=no -l DEVSECOPS-UBLNX1@10.109.137.24 uname -devuser'
               
              } 
           }       
         }
    
   }
    
  }

