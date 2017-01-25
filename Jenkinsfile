import groovy.transform.Field
@Field name = "cloudhub-buildbox"
node {
    stage('Checkout'){
        checkout scm
    }
    stage('Build Image') {
        sh 'rm -rf /var/lib/jenkins/.docker/config.json'
        docker.withRegistry("https://quay.dev.build.msap.io","quay-dev"){
            //TODO change the image name to quay.dev..../mulesoft-ci/<name>"
            def buildbox = docker.build "quay.dev.build.msap.io/vromero/${name}"
            buildbox.push "latest"
        }
    }
    stage('Upload Image') {
        echo "upload image to quay"
    }
}
