pipeline {
    agent any
    environment {
        MY_CRED = credentials('azuresp')
    }
    stages {
        stage('Prepare Workspace') {
            steps {
                script {
                    // Create a directory in the home directory of the Jenkins server
                    sh 'mkdir -p /home/azureuser/jenkins_workspace/terraform_project'
                }
            }
        }
        
        stage('Checkout') {
            steps {
                dir('/home/azureuser/jenkins_workspace/terraform_project') { // Clone the repo into the created directory
                    git 'https://github.com/SagarTraining/terrformform-test.git'
                }
            }
        }

        stage('Terraform Init') {
            steps {
                dir('/home/azureuser/jenkins_workspace/terraform_project/terraform') { // Navigate to the terraform directory
                    script {
                        def initOutput = sh(script: 'terraform init', returnStdout: true).trim()
                        echo "Terraform Init Output:\n${initOutput}"
                    }
                }
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