pipeline {
    agent any

    parameters{
        string(name: 'tomcat_dev', defaultValue:'18.136.196.251',description:'Staging Server')
        string(name: 'tomcat_prod', defaultValue:'54.179.167.252',description:'Production Server')
    }

    triggers{
        pollSCM('* * * * *')
    }

    stages{
        stage('Build'){
            steps{
                bat 'mvn clean package'
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
                        bat 'winscp open scp:ec2-user@ec2-user@18.136.196.251:/var/lib/tomcat7/webapps -privatekey=C:/Users/aussie.haryono/PycharmProjects/TomcatDemo.ppk -hostkey="ssh-ed25519 256 ikuan5siBY4ZB2EDK3zMABwmTOqHA8dDozMnsfPj0O8"'
                        bat 'winscp put **/*.war'
                    }
                }

                stage('Deploy to Prod'){
                    steps{
                        bat 'winscp /command "open scp:ec2-user@ec2-user@54.179.167.252:/var/lib/tomcat7/webapps -privatekey=C:/Users/aussie.haryono/PycharmProjects/TomcatDemo.ppk" "put **/*.war" "exit"'
                    }
                }
            }
        }

    }




}