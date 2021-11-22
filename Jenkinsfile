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
   stage('Run docker Container on Dev Server') {
        sh 'docker run --rm -p 8787:8080 -d --name my-app abdelrazekrizk/tomcat-my-app:1.0.0'
   }
   stage('Run kubectl Container on Dev Server') {
        sh 'kubectl apply -f ./deployment.yaml'
   }
}