pipeline {
  agent any
  stages {
    stage('git_checkout'){
      steps {
         checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'git', url: 'https://github.com/sriram-naresh/Demo_pratice.git']])
      }
    }
    stage('Build Docker image') {
      steps {
        sh 'docker build -t my-hello-world-app .'
      }
    }
    stage('Push to ECR') {
      steps {
        script {
          sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 320565985336.dkr.ecr.us-east-1.amazonaws.com'
          sh 'docker tag my-hello-world-app 320565985336.dkr.ecr.us-east-1.amazonaws.com:latest'
          sh 'docker push 320565985336.dkr.ecr.us-east-1.amazonaws.com/my-hello-world-app:latest'
        }
      }
    }
  }
}
