node {
    def app
    
    stage('Clone repository') {
        /* Cloning the Repository to our Workspace */
        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image */
        app = docker.build("bonvoyage/devopsinterview:1.1")
    }

    stage('Test image') {
        
        app.inside {
            echo "Tests passed"
        }
    }

    stage('Push image') {
        /* 
			Login to hub.docker.com and docker.io before you can push images to your account
		*/
        docker.withRegistry('https://docker.io/', 'dockerhub'){}
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
            // Jenkins build numberic build number's image
            app.push("${env.BUILD_NUMBER}")
            app.push("bonvoyage/devopsinterview:1.1")
            } 
            echo "Trying to Push Docker Build to DockerHub"
    }
}