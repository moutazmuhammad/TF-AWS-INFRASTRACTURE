pipeline {
    agent any

    tools {
       terraform 'terraform'
    }

    stages {
        stage('terraform init'){
          steps{
             withAWS(credentials: 'aws_credential') {
                sh 'terraform -chdir=./terraform init'
                }
          }
        }

        stage('terraform plan'){
          steps{
             withAWS(credentials: 'aws_credential') {
               sh 'terraform -chdir=./terraform plan'
             }
          }
        }

        stage('terraform build and using outputs'){
          steps{
             withAWS(credentials: 'aws_credential') {
                sh 'terraform -chdir=./terraform apply --auto-approve'
                }
          }
        }
    }
}
