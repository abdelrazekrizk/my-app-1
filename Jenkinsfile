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
        sh 'docker run -p 8787:8080 -d --name my-app abdelrazekrizk/tomcat-my-app:1.0.0'
   }
   stage('Run kubectl Container on Dev Server') {
     kubeconfig(credentialsId: 'Kubernetes_Credentials', serverUrl: 'https://192.168.49.2:8443') {
   }
        sh 'kubectl apply -f ./Deployment.yaml'
        sh 'kubectl apply -f ./Service.yaml'
   }
}