pipeline {
    agent {
        dockerfile {
            args '--entrypoint=\'\''
        }
    }
    stages {
        stage('Source') {
            steps {
                checkout scm
            }
        }
        stage('Lint') {
            steps {
                echo "Run Linter"
            }
        }
        stage('Build') {
            steps {
                echo "Compile"
                sh "java -version"
            }
        }
        stage('Test') {
            steps {
                echo "Run Tests"
            }
        }
    }
}