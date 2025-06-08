pipeline {
    agent {
        docker {
            image 'node:16'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    environment {
        COMPOSE_FILE = 'docker-compose.yml'
    }

    stages {
        stage('Clonar el repositorio') {
            steps {
                git url: 'https://github.com/cesarmoreno6817/facturacionElectronica.git', branch: 'master'
            }
        }

        stage('Preparar archivos') {
            steps {
                script {
                    if (!fileExists('.env')) {
                        sh 'cp .env.example .env'
                    }
                }
            }
        }

        stage('Instalar dependencias frontend') {
            steps {
                sh 'npm install && npm run build'
            }
        }

        stage('Levantar contenedores') {
            steps {
                sh 'docker --version'
                sh 'docker-compose down'
                sh 'docker-compose up -d --build'
            }
        }
    }

    post {
        success {
            echo '🚀 Aplicación desplegada con éxito en http://localhost:8000'
        }
        failure {
            echo '❌ Algo falló en el proceso.'
        }
    }
}
