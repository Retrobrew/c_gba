pipeline {
    agent any

    stages {
        stage("SCM") {
            steps {
                checkout scm
            }
        }
        stage("Build Docker image") {
            steps {
                sh 'docker build -t gba-c .'
            }
        }
        stage("Deploy to production") {
            when {
                anyOf {
                    branch 'master'
                }
            }
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'AKIA2CPOUL52TSUWSV73', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                        nodejs(nodeJSInstallationName: 'nodejs') {
                            sh "docker push AKIA2CPOUL52TSUWSV73.dkr.ecr.eu-west-1.amazonaws.com/gba-c:latest"
                        }
                    }
                }
            }
        }
    }
}
