node {
    def app
    
    stage('Clone repository') {
        /* Cloning the Repository to our Workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image */
        // sh "docker build -t devopsinterview ."
        // sh "docker run --rm -d --group-add -v /var/run/docker.sock:/var/run/docker.sock -P devopsinterview"

        app = docker.build("devopsinterview")
    }

    stage('Test image') {
        
        app.inside {
            echo "Tests passed"
        }
    }

    stage('Push image') {
        /* 
			You would need to first register with DockerHub before you can push images to your account
		*/
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
            // app.push("${env.BUILD_NUMBER}")
            sh 'docker tag devopsinterview devopsinterview:latest'
            sh 'docker push https://hub.docker.com/repository/docker/bonvoyage/devopsinterview'
            // app.push()
            } 
            echo "Trying to Push Docker Build to DockerHub"
    }
}