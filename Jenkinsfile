pipeline {
    agent any

    tools {
       terraform 'terraform'
    }

    stages {
        stage('terraform init'){
          steps{
             withAWS(credentials: 'aws_credential') {
                sh 'terraform init'
                }
          }
        }

        stage('terraform plan'){
          steps{
             withAWS(credentials: 'aws_credential') {
               sh 'terraform plan'
             }
          }
        }

        stage('terraform build and using outputs'){
          steps{
             withAWS(credentials: 'aws_credential') {
                sh 'terraform apply --auto-approve'
                }
          }
        }
    }
}
