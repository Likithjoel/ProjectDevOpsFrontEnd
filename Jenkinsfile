pipeline {
	agent any
	stages{
		stage('Checkout') {
			steps {
				echo 'checked out code'
			}
		}
		stage('Installing Node Modules') {
			steps {
				sh 'npm install'
			}
		}
		stage('Build') {
			steps {
				sh 'ng build'
			}
		}
	}
}
