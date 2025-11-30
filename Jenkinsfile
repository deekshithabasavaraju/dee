pipeline {
  agent any

  environment {
    IMAGE = "your-dockerhub-username/simple-monolith:latest"
    DOCKER_REGISTRY_CREDENTIALS = 'docker-hub-creds' // configure in Jenkins
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }
    stage('Build') {
      steps {
        sh 'mvn -B -DskipTests clean package'
      }
    }
    stage('Test') {
      steps {
        sh 'mvn test'
      }
    }
    stage('Docker Build & Push') {
      steps {
        script {
          docker.withRegistry('', DOCKER_REGISTRY_CREDENTIALS) {
            def image = docker.build(IMAGE)
            image.push()
          }
        }
      }
    }
  }
  post {
    always {
      archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
    }
  }
}
