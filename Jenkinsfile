pipeline {
  agent any 
  tools {
    maven 'Maven'
  }
  environment {
    SPECTRAL_DSN = credentials('spectral-dsn')
  }
  
  stages {
    stage ('Initialize') {
      steps {
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
         }
    }
                       
   
/*
     stage('install Spectral') {
      steps {
        sh 'curl -L https://get.spectralops.io/latest/x/sh?dsn=$SPECTRAL_DSN'
      }
    }
    stage('scan for issues') {
      steps {
         
        sh "$HOME/.spectral/spectral scan"
       SPECTRAL_DSN="https://spk-eb961bc3f3ae45b8aa2e92347150dbdb@get.spectralops.io" 'HOME/.spectral/spectral' github -k repo -t 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 'https://github.com/securitis/CICD.git' 
        sh 'SPECTRAL_DSN=https://spk-eb961bc3f3ae45b8aa2e92347150dbdb@get.spectralops.io /var/lib/jenkins/.spectral/spectral github -k repo -t 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 https://github.com/securitis/CICD.git'
        sh 'SPECTRAL_DSN=https://spk-eb961bc3f3ae45b8aa2e92347150dbdb@get.spectralops.io /var/lib/jenkins/.spectral/spectral github -k repo -t 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 https://github.com/securitis/CICD.git' 
      }
    }
  

    
    stage ('SpectreOS') {
      steps {
        sh 'curl -L https://get.spectralops.io/latest/x/sh?key=spk-eb961bc3f3ae45b8aa2e92347150dbdb'    
        sh  'SPECTRAL_DSN=https://spk-eb961bc3f3ae45b8aa2e92347150dbdb@get.spectralops.io /home/spectral/ github -k repo -t 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 https://github.com/securitis/CICD.git'
      }
      SPECTRAL_DSN=https://spk-eb961bc3f3ae45b8aa2e92347150dbdb@get.spectralops.io $HOME/.spectral/spectral github -k repo -t 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 https://github.com/securitis/CICD.git
    } */
      
        
      
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
      parallel {
        stage ('SonarQube') {     
            steps {
                withSonarQubeEnv('sonar') {
                  sh 'mvn sonar:sonar'
                  sh 'cat target/sonar/report-task.txt'
                  }
                 }
              }
    
    stage ('SAST Appscan') {
      steps {
        appscan application: '4130440a-8227-4b5f-b846-e4ef704931fb', credentials: 'appscan', name: 'CICDDynamicTest', scanner: static_analyzer(hasOptions: false, target: '/var/lib/jenkins/workspace/CICD'), type: 'Static Analyzer'
      }
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
    

  stage ('DAST Appscan') {
       parallel {
         stage('IBM Appscan'){
                    steps {
                           appscan application: '4130440a-8227-4b5f-b846-e4ef704931fb', credentials: 'appscan', name: 'CICDDynamicTest', scanner: dynamic_analyzer(hasOptions: false, optimization: 'Fast', scanType: 'Staging', target: 'https://demo.testfire.net/'), type: 'Dynamic Analyzer'
                          }
         }
         stage('Archni'){  
                    steps {
                           sh 'echo 123'
                          } 
                      }
       }
    }
   
    
  }
}  
