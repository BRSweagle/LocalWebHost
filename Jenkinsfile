pipeline {
  agent any
  stages {
    stage('Build') {
      parallel {
        stage('Build') {
          steps {
            echo 'SCM Build Start'
          }
        }
        stage('Upload Config') {
          steps {
            SWEAGLEUpload(actionName: 'uploadConfig', fileLocation: '/Users/boondock/.jenkins/workspace/LocalWebHost_master/InfraDB.json', format: 'json', nodePath: 'MyNodePath', allowDelete: true, tag: 'V{BUILD_ID}', description: 'DataUpload', withSnapshot: true, markFailed: true, showResults: true, onlyParent: true)
          }
        }
      }
    }
    stage('Test') {
      parallel {
        stage('Test') {
          steps {
            timestamps()
          }
        }
        stage('Validate Config') {
          steps {
            SWEAGLEValidate(actionName: 'TestDataQuality', mdsName: 'DBCluster', warnMax: 1, errMax: 1, retryCount: 1, showResults: true, retryInterval: 1)
          }
        }
      }
    }
    stage('Deploy') {
      parallel {
        stage('Deploy') {
          steps {
            echo 'Pushed to TST Environment'
          }
        }
        stage('TST') {
          steps {
            echo 'Deployed TST'
          }
        }
        stage('Snapshot') {
          steps {
            SWEAGLESnapshot(actionName: 'Snapshot Latest TST Config', mdsName: 'DBCluster', description: 'DBCluster Snapshot', tag: 'Version_{BUILD_ID}', markFailed: true, showResults: true)
          }
        }
      }
    }
    stage('PRD') {
      parallel {
        stage('PRD') {
          steps {
            echo 'PRD Deployed'
          }
        }
        stage('Get Latest Config') {
          steps {
            SWEAGLEExport(actionName: 'Get PRD Config', mdsName: 'DBCluster', exporter: 'all', fileLocation: '/Users/boondock/.jenkins/workspace/LocalWebHost_master/PRDInfraDB.json', format: 'json', args: ' ', showResults: true, markFailed: true)
          }
        }
      }
    }
  }
}