pipeline {
  agent any 
  tools {
    maven 'Maven'
  }
  stages {
    stage ('Initialize') {
      steps {
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
         }
    }
      
     stage ('Check-Git-Secrets') {
      steps {
        sh 'rm trufflehog || true'
        sh 'docker run gesellix/trufflehog --json https://github.com/securitis/CICD.git > trufflehog'
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
         sh 'sudo cp -r /var/lib/jenkins/OWASP-Dependency-Check/reports /var/lib/jenkins/workspace/CICD'
           
      }
    }
    
     stage ('SAST') {
      steps {
        withSonarQubeEnv('sonar') {
          sh 'mvn sonar:sonar'
          sh 'cat target/sonar/report-task.txt'
        }
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
                sh 'sudo cp -r /var/lib/jenkins/workspace/CICD/target/WebApp /opt/apache-tomcat-8.5.66/webapps' 
                sh 'ls /opt/apache-tomcat-8.5.66/webapps'
                sh 'sudo cp -r /var/lib/jenkins/OWASP-Dependency-Check/reports /opt/apache-tomcat-8.5.66/webapps'
               
           }       
    }
    
    
   }
    
  }
     
