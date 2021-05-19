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
    
   stage ('Check-Git-Secrets') {
      steps {
        sh 'rm trufflehog || true'
        sh 'docker run gesellix/trufflehog --json https://github.com/cehkunal/webapp.git > trufflehog'
        sh 'cat trufflehog'
      }
    }
    
    stage ('Source Composition Analysis') {
      steps {
         sh 'rm owasp* || true'
         sh 'wget "https://raw.githubusercontent.com/cehkunal/webapp/master/owasp-dependency-check.sh" '
         sh 'chmod +x owasp-dependency-check.sh'
         sh 'bash owasp-dependency-check.sh'
         sh 'cat /var/lib/jenkins/OWASP-Dependency-Check/reports/dependency-check-report.xml'
        
      }
    }
       
    
    stage ('Build') {
      steps {
      sh 'mvn clean package'
       }
    }
    
      stage ('Deploy-To-Tomcat') {
            steps {
                sh 'chmod 777 /var/lib/jenkins/workspace/webapp-cicd-pipeline/target/WebApp.war'
                sh  'cp -r WebApp.war /var/lib/jenkins/workspace/webapp-cicd-pipeline/target/ /opt/apache-tomcat-8.5.66/webapps'  
                sh 'chmod 777 /opt/apache-tomcat-8.5.66/webapps/WebApp.war'
                sh 'unzip /opt/apache-tomcat-8.5.66/webapps/WebApp.war'
             
             
           }       
    }
    
        }
    
  }

