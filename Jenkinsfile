pipeline {
    agent any

    environment {
        RDS_USERNAME = credentials('RDS_USERNAME')
        RDS_PASSWORD = credentials('RDS_PASSWORD')
    }

    tools {
        terraform 'terraform'
    }

    stages {
        stage('Terraform Initialization') {
            steps {
                withAWS(credentials: 'aws_credential') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                withAWS(credentials: 'aws_credential') {
                    sh "terraform plan -var rds_password=${env.RDS_PASSWORD} -var rds_username=${env.RDS_USERNAME}"
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                withAWS(credentials: 'aws_credential') {
                    sh "terraform apply -var rds_password=${env.RDS_PASSWORD} -var rds_username=${env.RDS_USERNAME} --auto-approve"
                }
            }
        }
    }
}
