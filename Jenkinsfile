pipeline {
    agent any

     triggers{
        pollSCM('* * * * *')
     }

     stages{
        stage('Build'){
            steps{
                bat 'mvn clean package'
                bat 'docker build . -t tomcatwebapp:1'
            }
        }

    }

}