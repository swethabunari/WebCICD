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
                sh 'chmod +777 /var/lib/jenkins/workspace/CICD/target/WebApp'
                sh 'cp -r /var/lib/jenkins/workspace/CICD/target/WebApp /opt/apache-tomcat-8.5.66/webapps' 
                sh 'ls /opt/apache-tomcat-8.5.66/webapps'
           }       
    }
    
    
   }
    
  }

