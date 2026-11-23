pipeline {
    agent any

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
                git url: 'https://github.com/PeterPorzuczek/TimeRiddle.git',
                    branch: 'main'
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
                expression { return params.DEPLOY }
            }
            steps {
                echo 'Deploying application...'
            }
        }
    }
}
