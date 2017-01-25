name = "cloudhub-buildbox"
node {
    stage('Build Image') {
        checkout scm
        sh "ls -l"
        sh "pwd"
        docker.build 'quay.dev.build.msap.io/vromero/${name}'
    }
    stage('Upload Image') {}
}
echo "hello world"
