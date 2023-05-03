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
  }
}
