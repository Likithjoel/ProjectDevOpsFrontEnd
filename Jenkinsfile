def remote = [:]
remote.name = "frontend-server"
remote.host = "168.62.183.17"
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
			sshPut remote: remote, from: '/var/lib/jenkins/workspace/devops_frontend', into: '.'
		}
		stage('run') {
			sshCommand remote: remote, command: "cd devops_frontend && pm2 stop all"
      sshCommand remote: remote, command: "pm2 start 'ng serve --host 0.0.0.0'"
		}
	}
}

