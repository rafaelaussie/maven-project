pipeline {
    agent any

     stages{
        stage('Build'){
            steps{
                bat 'mvn clean package'
                bat 'docker . -t tomcatwebapp:${env.BUILD_ID}'
            }
        }

    }

}