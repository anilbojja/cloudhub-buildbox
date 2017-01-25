import groovy.transform.Field
@Field name = "cloudhub-buildbox"
node {
    stage('Checkout'){
        checkout scm
    }
    stage('Build Image') {
        docker.withRegistry("quay.dev.build.msap.io","quay-dev"){
            #TODO change the image name to quay.dev..../mulesoft-ci/<name>"
            build "quay.dev.build.msap.io/vromero/${name}"
            push "latest"
        }
    }
    stage('Upload Image') {
        echo "upload image to quay"
    }
}
