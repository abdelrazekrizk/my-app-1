node{
   stage('SCM Checkout') {
       git branch: 'main', credentialsId: 'Git_Credentials', url: 'https://github.com/abdelrazekrizk/my-app-1'
   }
   stage('Mvn Package') {
     def mvnHome = tool name: 'Maven', type: 'maven'
     def mvnCMD = "${mvnHome}/usr/bin/mvn"
     sh "${mvnCMD} clean package"
   }
   stage('Build Docker Image') {
     sh 'docker build -t abdelrazekrizk/my-app:1.0.0 .'
   }
   stage('Push Docker Image') {
     withCredentials([string(credentialsId: 'Docker_Credentials', variable: 'dockerHubPwd')]) {
        sh "docker login -u abdelrazekrizk -p ${dockerHubPwd}"
     }
     sh 'docker push abdelrazekrizk/my-app:1.0.0'
   }
   stage('Run Container on Dev Server') {
     def dockerRun = 'docker run --rm -p 8081:8081 -d --name my-app abdelrazekrizk/my-app:1.0.0'
     sshagent(['SSH_Jenkins']) {
       sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.90.24 ${dockerRun}"
     }
   }
   stage('Run kubectl on Dev Server') {
      sh 'kubectl create -f ./deployment.yaml'
   }
}