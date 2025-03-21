pipeline {
    agent any
    environment {
        MY_CRED = credentials('azuresp') // Replace 'azuresp' with your Jenkins credentials ID for the Azure Service Principal
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        // stage('AZ LOGIN'){
        //     steps {
        //         sh 'az login --service-principal -u $MY_CRED_CLIENT_ID -p $MY_CRED_CLIENT_SECRET -t $MY_CRED_TENANT_ID'
        //     }
        // }

        stage('Prepare dev.tfvars') {
            steps {
                script {
                    // Write the dev.tfvars content from Jenkins credentials to a file
                    withCredentials([file(credentialsId: 'tfvars-dev-file', variable: 'TF_VARS_FILE')]) {
                        sh 'cp $TF_VARS_FILE dev.tfvars'
                    }
                }
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    withCredentials([azureServicePrincipal(credentialsId: 'azuresp', variable: 'azuresp')]) {
                        // Set Azure credentials as environment variables
                        sh 'export ARM_CLIENT_ID=$MY_CRED_CLIENT_ID'
                        sh 'export ARM_CLIENT_SECRET=$MY_CRED_CLIENT_SECRET'
                        sh 'export ARM_SUBSCRIPTION_ID=$MY_CRED_SUBSCRIPTION_ID'
                        sh 'export ARM_TENANT_ID=$MY_CRED_TENANT_ID'

                        // Run Terraform init
                        sh 'terraform init'
                    }
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                // Run Terraform plan
                sh 'terraform plan --var-file=dev.tfvars'
            }
        }
        stage('Terrform Apply'){
            steps {
                // Run Terraform apply
                sh 'terraform apply -auto-approve --var-file=dev.tfvars'
            }
        }
    }

    post {
        success {
            echo 'Terraform run completed successfully.'
        }
        failure {
            echo 'Terraform run failed.'
        }
    }
}