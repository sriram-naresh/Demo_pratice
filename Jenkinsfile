pipeline {
  agent any
  environment {
    ECR_REPO_URL = "320565985336.dkr.ecr.us-east-1.amazonaws.com/my-hello-world-app"
    IMAGE_VERSION = "v1"
    AWS_ACCOUNT_ID = 320565985336
    AWS_REGION   = "us-east-1"
  }
  stages {
    stage('git_checkout'){
      steps {
         checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'git', url: 'https://github.com/sriram-naresh/Demo_pratice.git']])
      }
    }
    stage('Build Docker image') {
      steps {
        docker.build("${ECR_REPO_URL}:${IMAGE_VERSION}")
      }
    }
    stage('Push to ECR') {
      steps {
        script {
              docker.withRegistry("https://${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com", 'ecr') {
              docker.image("${ECR_REPO_URL}:${IMAGE_VERSION}").push()
        }
      }
    }
  }
}
