node{
   stage('SCM Checkout') {
       git branch: 'main', credentialsId: 'Git_Credentials', url: 'https://github.com/abdelrazekrizk/my-app-1'
   }
   stage('Build Docker Image') {
     sh 'docker build -t abdelrazekrizk/tomcat-my-app:1.0.0 .'
   }
   stage('Push Docker Image') {
     withCredentials([string(credentialsId: 'Docker_Credentials', variable: 'dockerHubPwd')]) {
        sh "docker login -u abdelrazekrizk -p ${dockerHubPwd}"
     }
     sh 'docker push abdelrazekrizk/tomcat-my-app:1.0.0'
   }
   stage('Run Container on Dev Server') {
     def dockerRun = 'docker run --rm -p 8787:8080 -d --name my-app abdelrazekrizk/tomcat-my-app:1.0.0'
     sshagent(['SSH_Jenkins']) {
       sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.90.24 ${dockerRun}"
     }
   }
   stage('Run kubectl on Dev Server') {
     sshagent(['SSH_Jenkins']) {
       sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.90.24 ${dockerRun}"
       sh 'kubectl create -f ./deployment.yaml'
     } 
   }
}