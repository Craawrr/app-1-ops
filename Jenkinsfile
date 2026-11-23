pipeline {
    agent any

    options {
        skipDefaultCheckout(true)
    }

    parameters {
        booleanParam(
            name: 'DEPLOY',
            defaultValue: true,
            description: 'Czy wykonać wdrożenie?'
        )
    }

    stages {
        stage('Checkout') {
            steps {
                deleteDir()

                git branch: 'main',
                    url: 'https://github.com/PeterPorzuczek/TimeRiddle.git'

                bat 'dir'
            }
        }

        stage('Build') {
            steps {
                echo 'Building application...'
            }
        }

        stage('Test') {
            steps {
                echo 'Testing application...'
            }
        }

        stage('Deploy') {
            when {
                expression { params.DEPLOY }
            }
            steps {
                echo 'Deploying application...'
            }
        }
    }
}
