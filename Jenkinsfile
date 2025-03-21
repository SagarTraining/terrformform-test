pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                dir('workspace') { // Specify the directory where the repo will be cloned
                    git 'https://github.com/SagarTraining/terrformform-test.git'
                }
            }
        }

        stage('Terraform Init') {
            steps {
                dir('workspace/terraform') { // Navigate to the terraform directory in the cloned repo
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