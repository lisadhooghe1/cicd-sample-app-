pipeline {
    agent any
    stages {
        stage('Cleanup') {
            steps {
                script {
                    sh 'docker stop samplerunning || true'
                    sh 'docker rm samplerunning || true'
                }
            }
        }
        stage('Build') {
            steps {
                sh 'bash ./sample-app.sh'
            }
        }
        stage('Verify') {
            steps {
                script {
                    // Retrieve the IP address of the app container dynamically
                    def appIp = sh(script: "docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' samplerunning", returnStdout: true).trim()
                    def jenkinsIp = sh(script: "hostname -i", returnStdout: true).trim()
                    
                    // Verify if the app responds correctly
                    sh "curl http://${appIp}:5050/ | grep 'You are calling me from ${jenkinsIp}'"
                }
            }
        }
    }
}

