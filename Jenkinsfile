pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "Maven 3.6.3"
    }

    stages {
        stage('Clone SCM ') {
            steps {
                cleanWs()
                // Get some code from a GitHub repository
                git ' https://github.com/system-dev-formations/todo-flask-postgres.git '

            }
        }
        stage('SonarQube analysis') {
            steps {
               script {
                        def scannerHome = tool 'SonarScanner';
                        withSonarQubeEnv('SonarQube') {
                             sh "${tool("SonarScanner")}/bin/sonar-scanner -Dsonar.projectKey=todo -Dsonar.projectName=todo-flask-postgresql -Dsonar.projectVersion=1.0 -Dsonar.language=py -Dsonar.sourceEncoding=UTF-8"
                           }
                     }
            }
        }
    }
}

