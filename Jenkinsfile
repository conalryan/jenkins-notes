pipeline {
    agent {
        // docker {
        //     image 'maven:3-alpine' 
        //     args '-v /root/.m2:/root/.m2' 
        // }
        dockerfile {
          args '-v /root/.m2:/root/.m2' 
        }
    }
    
    environment {
        CR = credentials('cr')
    }
    parameters {
        string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
        text(name: 'BIOGRAPHY', defaultValue: '', description: 'Enter some information about the person')
        booleanParam(name: 'TOGGLE', defaultValue: true, description: 'Toggle this value')
        choice(name: 'CHOICE', choices: ['One', 'Two', 'Three'], description: 'Pick something')
        password(name: 'PASSWORD', defaultValue: 'SECRET', description: 'Enter a password')
        file(name: "FILE", description: "Choose a file to upload")
        string(name: 'VERSION', defaultValue: '0.0.1', description: 'Da version yo')
    }
    stages {
        stage('env-vars.html') {
          steps {
            echo "BRANCH_NAME: ${env.BRANCH_NAME}"
            echo "CHANGE_ID: ${env.CHANGE_ID}"
            echo "BUILD_NUMBER: ${env.BUILD_NUMBER}"
            echo "BUILD_ID: ${env.BUILD_ID}"
            echo "BUILD_TAG: ${env.BUILD_TAG}"
            echo "WORKSPACE: ${env.WORKSPACE}"
            echo "GIT_COMMIT: ${env.GIT_COMMIT}"
            echo "GIT_BRANCH: ${env.GIT_BRANCH}"
            echo "CR: ${CR}"
          }
        }
        stage('mvn && docker') { 
            steps {
                sh 'pwd'
                sh 'mvn -v'
                sh 'docker -v'
            }
        }
        stage('parameters') {
            steps {
                echo "Hello ${params.PERSON}"
                echo "Biography: ${params.BIOGRAPHY}"
                echo "Toggle: ${params.TOGGLE}"
                echo "Choice: ${params.CHOICE}"
                echo "Password: ${params.PASSWORD}"
            }
        }
        // stage('Dyanmic Environment Variables') {
        //   steps {
        //     BRANCH = """${sh(
        //       returnStdout: true,
        //       script: '(git branch | sed -n "/\* /s///p")'
        //     )}"""
        //     COMMIT = """${sh(
        //       returnStdout: true,
        //       script: '$(git rev-parse HEAD)'
        //     )}"""
        //     sh 'git log -1 --oneline --pretty'
        //     sh "git tag -a ${params.VERSION} -m \"Jenkinsfile, Build: ${env.BUILD_NUMBER}, Branch: ${BRANCH}\"" ${COMMIT}
        //     sh "git push origin ${params.VERSION}"
        //   }
        // }
        stage('tagging') {
            steps {
                sh 'pwd'
                sh ". ${env.WORKSPACE}/test.sh UI"
            }
        }
    }
}
