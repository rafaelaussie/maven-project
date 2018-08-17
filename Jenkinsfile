pipeline{
    agent any
    stages{
        stage('Build'){
            steps{
                sg 'mvn clean package'
            }
            post{
                success{
                    echo 'Now archiving..'
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }
    }
}