name = "jenkins-slave-docker-cloudhub"
node {
    stage('Build Image') {
        sh "ls -l"
        sh "pwd"
        docker.build 'jenkins-slave-docker-cloudhub'
    }
    stage('Upload Image') {}
}
echo "hello world"
