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