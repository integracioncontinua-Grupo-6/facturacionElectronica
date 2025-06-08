pipeline {
    agent any

    environment {
        COMPOSE_FILE = 'docker-compose.yml'
    }

    stages {

        stage('Clonar el repositorio') {
            steps {
                git url: 'https://github.com/cesarmoreno6817/facturacionElectronica.git', branch: 'main'
            }
        }

        stage('Preparar archivos') {
            steps {
                script {
                    // Copiar el .env si no existe
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