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
        script{
           sh 'docker build -t hello-world-app .'
        }
      }
    }
    stage('Push to ECR') {
      steps {
        script {
          sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 320565985336.dkr.ecr.us-east-1.amazonaws.com'
          sh 'docker tag hello-world-app 320565985336.dkr.ecr.us-east-1.amazonaws.com/hello-world-app:latest'
          sh 'docker push 320565985336.dkr.ecr.us-east-1.amazonaws.com/hello-world-app:latest'
        }
      }
    }
  }
}
