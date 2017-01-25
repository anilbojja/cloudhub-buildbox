import groovy.transform.Field
@Field name = "cloudhub-buildbox"
node {
    stage('Checkout'){
        checkout scm
    }
    stage('Build Image') {
        docker.withRegistry("quay.dev.build.msap.io","quay-dev"){
            build "quay.dev.build.msap.io/vromero/${name}"
            push "latest"
        }
    }
    stage('Upload Image') {
        echo "upload image to quay"
    }
}
