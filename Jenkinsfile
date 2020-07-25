def remote = [:]
remote.name = "frontend-server"
remote.host = "40.117.56.218"
remote.allowAnyHosts = true
node {
	withCredentials([usernamePassword(credentialsId: 'FRONTEND', passwordVariable: 'password', usernameVariable: 'userName')]) {
        	remote.user = userName
        	remote.password = password
		stage('checkout') {
			echo 'checked out the code'
		}
		stage('Installing node modules') {
			sh 'npm install'
		}
		stage('build') {
			sh 'ng build'
		}
		stage('deploy') {
			sshCommand remote: remote, command: "rm -rf devops_frontend/"
      sshCommand remote: remote, command: "mkdir devops_frontend"
			sshPut remote: remote, from: '/var/lib/jenkins/workspace/devops_frontend/dist', into: './devops_frontend'
		}
		stage('run') {
			sshCommand remote: remote, command: "cd devops_frontend/dist && ng serve"
		}
	}
}

