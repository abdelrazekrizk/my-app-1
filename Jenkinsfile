node{
   stage('SCM Checkout'){
       git credentialsId: 'git-creds', url: 'https://github.com/abdelrazekrizk/my_app'
   }
   stage('Mvn Package'){
     def mvnHome = tool name: 'Maven', type: 'maven'
     def mvnCMD = "${mvnHome}/bin/mvn"
     sh "${mvnCMD} clean package"
   }
   stage('Build Docker Image'){
     sh 'docker build -t abdelrazekrizk/my-app:1.0.0 .'
   }
   stage('Push Docker Image'){
     withCredentials([string(credentialsId: 'docker-pw', variable: 'dockerHubPwd')]) {
        sh "docker login -u abdelrazekrizk -p ${dockerHubPwd}"
     }
     sh 'docker push abdelrazekrizk/my-app:1.0.0'
   }
   stage('Run Container on Dev Server'){
     def dockerRun = 'docker run --rm -p 8080:8080 -d --name my-app abdelrazekrizk/my-app:1.0.0'
     sshagent(['dev-server']) {
       sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.80.219 ${dockerRun}"
     }
   }
   stage('Run kubectl on Dev Server'){
      sh 'kubectl create -f ./deployment.yaml'
     }
}