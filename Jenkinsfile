pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/SagarTraining/terrformform-test.git'
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
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