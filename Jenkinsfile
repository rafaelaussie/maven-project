pipeline {
    agent any

    parameters{
        string(name: 'tomcat_dev', defaultValue='18.136.196.251',description='Staging Server')
        string(name: 'tomcat_prod', defaultValue='54.179.167.252',description='Production Server')
    }

    triggers{
        pollSCM('* * * * *')
    }

    stages{
        stage('Build'){
            steps{
                sh 'mvn clean package'
            }
            post{
                success{
                    echo 'Now archiving...'
                    archiveArtifacts artifacts: '**/*.war'
                }
            }
        }

        stage('Deployments'){
            parallel{
                stage('Deploy to Staging'){
                    steps{
                        sh "scp -i C:/Users/aussie.haryono/PycharmProjects/TomcatDemo.pem **/*.war ec2-user@${params.tomcat_dev}:/var/lib/tomcat7/webapps"
                    }
                }

                stage('Deploy to Prod'){
                    steps{
                        sh "scp -i C:/Users/aussie.haryono/PycharmProjects/TomcatDemo.pem **/*.war ec2-user@${params.tomcat_dev}:/var/lib/tomcat7/webapps"
                    }
                }
            }
        }

    }




}