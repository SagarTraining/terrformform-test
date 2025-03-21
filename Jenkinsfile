pipeline {
    agent any
    environment {
        MY_CRED = credentials('azuresp')
    }
    stages {
        // stage('Prepare Workspace') {
        //     steps {
        //         script {
        //             // Create a directory in the home directory of the Jenkins server
        //             sh 'mkdir -p ~/jenkins_workspace/terraform_project'
        //         }
        //     }
        // }
        
        stage('Checkout') {
            steps {
                // dir('~/jenkins_workspace/terraform_project') { // Clone the repo into the created directory
                //     checkout scm 
                // }
                checkout scm 
            }
        }

        stage('Terraform Init') {
            steps {
                // Initialize Terraform
                // dir ( '~/jenkins_workspace/terraform_project/terrformform-test' ){
                script { 
                    sh 'terraform init'
                    }
                // Pause the build for manual confirmation
                // input message: 'Terraform Init completed. Do you want to proceed?', ok: 'Yes, continue'
                // }
            }
        }

        stage('Terraform Apply') {
            steps {
                // Apply Terraform changes
                // dir ('/var/lib/jenkins/workspace/terraform/terraform'){
                script {
                    withCredentials([azureServicePrincipal(credentialsId: 'azuresp', variable: 'azuresp')]) {
                        // Set Azure credentials
                        // sh 'az login --service-principal -u $MY_CRED_CLIENT_ID -p $MY_CRED_CLIENT_SECRET -t $MY_CRED_TENANT_ID'
                        sh 'export ARM_CLIENT_ID=$MY_CRED_CLIENT_ID'
                        sh 'export ARM_CLIENT_SECRET=$MY_CRED_CLIENT_SECRET'
                        sh 'export ARM_SUBSCRIPTION_ID=$MY_CRED_SUBSCRIPTION_ID'
                        sh 'export ARM_TENANT_ID=$MY_CRED_TENANT_ID'

                        // Run Terraform apply
                        sh 'sudo terraform apply -auto-approve'
                        }
                    }
                // }
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