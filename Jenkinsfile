pipeline{
    agent any
    stages{
        stage('Build'){
            steps{
                bat 'mvn clean package'
            }
            post{
                success{
                    echo 'Now archiving..'
                    archiveArtifacts artifacts: '**/*.war'
                }
            }
        }
        stage('Deploy to Staging'){
            steps{
                build job: 'mavproj_DeployStaging'
            }
        }
        stage('Deploy to Production'){
            steps{
                timeout(time:5, unit:'DAYS'){
                    input message: "Approve PRODUCTION Deployment"
                }

                build job: 'mavproj_DeployProd2'
            }
            post{
                success{
                    echo 'Code deployed to Production'
                }
                failure{
                    echo 'Deployment failed'
                }
            }
        }
    }
}