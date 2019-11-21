pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        git(url: 'https://github.com/BRSweagle/LocalWebHost/tree/master/config', branch: 'master')
        sleep 2
      }
    }

    stage('Config') {
      parallel {
        stage('Config') {
          steps {
            echo 'Start Config Upload'
          }
        }

        stage('ConfigUpload') {
          steps {
            SWEAGLEUpload(actionName: 'UploadConfig', fileLocation: '/Users/boondock/Documents/GitHub/LocalWebHost/config', format: 'json', nodePath: 'Eldorado,releases,jenkinsConf', filenameNodes: true, tag: 'V1.{BUILD_ID}')
            sleep 2
          }
        }

        stage('ConfigValidation') {
          steps {
            SWEAGLEValidate(actionName: 'ValidateConfig', mdsName: 'TokenChecker', errMax: 5)
          }
        }

        stage('ConfigStore') {
          steps {
            SWEAGLESnapshot(actionName: 'Snapshot', mdsName: 'jenkinsConf', tag: 'V1.{BUILD_ID}')
          }
        }

      }
    }

    stage('Test') {
      parallel {
        stage('Testing') {
          steps {
            echo 'StartTesting'
          }
        }

        stage('Selenium Tests') {
          steps {
            echo 'SeleniumTests'
            sleep 1
          }
        }

        stage('Performance Tests') {
          steps {
            echo 'Start Blazemeter'
          }
        }

        stage('Functional') {
          steps {
            echo 'Run Front end scripts'
          }
        }

      }
    }

    stage('Deploy') {
      steps {
        SWEAGLESnapshot(actionName: 'SnapshotConfig', mdsName: 'jenkinsConf', tag: 'V1.{BUILD_ID}', description: 'Latest Jenkins Conf')
      }
    }

  }
}