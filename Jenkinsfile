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