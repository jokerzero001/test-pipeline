pipeline {
    agent {
        label 'mylabserver.com'
    }
    
    stages {
        stage('Checkout Code') {
            steps {
                // Mengambil kode sumber dari repositori Git
                checkout scm
            }
        }
    

        stage('Check Creds') {
            steps {
                script {
                    sh "id"
                    sh "pwd"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
            // Menggunakan perintah Docker untuk membangun gambar
                script {
                    def customImageName = 'os-rocky' // Nama gambar Docker yang diinginkan
                    def dockerImage = docker.build(customImageName, '-f ./Dockerfile .')
                }
            }
        }

        stage('Run Docker Container') {
            steps {
            // Menjalankan kontainer Docker dari gambar yang telah dibangun
                script {
                    def customContainerName = 'tes-run' // Nama kontainer Docker yang diinginkan
                    docker.image('os-rocky').run("--name ${customContainerName} -d -p 8080:80")
                }
            }
        }
    }
}
