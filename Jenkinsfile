properties([
    parameters([
        // string(
        //     defaultValue: 'dev',
        //     name: 'Environment'
        // ),
        choice(
            choices: ['plan', 'apply', 'destroy'], 
            name: 'Terraform_Action'
        )])
])
pipeline {
    agent any
    stages {
        stage('Preparing') {
            steps {
                sh 'echo Preparing'
            }
        }
        stage('Git Pulling') {
            steps {
                git branch: 'main', url: 'https://github.com/irfanmestri/portfolio-host-S3.git'
            }
        }
        stage('Init') {
            steps {
                withAWS(credentials: 'aws-creds', region: 'us-west-1') {
               // sh 'terraform -chdir=eks/ init'
               sh 'terraform init'
                }
            }
        }
        stage('Validate') {
            steps {
                 withAWS(credentials: 'aws-creds', region: 'us-west-1') {
                // sh 'terraform -chdir=eks/ validate'
                sh 'terraform validate'
                }
            }
        }
        stage('Action') {
            steps {
                withAWS(credentials: 'aws-creds', region: 'us-west-1') {
                    script {    
                        if (params.Terraform_Action == 'plan') {
                            //sh "terraform -chdir=eks/ plan -var-file=${params.Environment}.tfvars"
                            sh "terraform plan"
                        }   else if (params.Terraform_Action == 'apply') {
                            //sh "terraform -chdir=eks/ apply -var-file=${params.Environment}.tfvars -auto-approve"
                            sh "terraform apply -auto-approve"
                        }   else if (params.Terraform_Action == 'destroy') {
                            //sh "terraform -chdir=eks/ destroy -var-file=${params.Environment}.tfvars -auto-approve"
                            sh "terraform destroy -auto-approve"
                        } else {
                            error "Invalid value for Terraform_Action: ${params.Terraform_Action}"
                        }
                    }
                }
            }
        }
    }
}
