pipeline {
  agent any
  stages {
    stage('uploadConfig') {
      steps {
        SWEAGLEUpload(actionName: 'uploadConfig', fileLocation: '/Documents/GitHub/LocalWebHost/InfraDB.json', format: 'json', nodePath: 'MyNodePath', allowDelete: true, markFailed: true, tag: '{BUILD_ID}', description: 'ConfigUpload', showResults: true, withSnapshot: true, onlyParent: true)
      }
    }
    stage('Validate') {
      steps {
        SWEAGLEValidate(actionName: 'RunValidations', mdsName: 'Client-PRD', warnMax: 1, errMax: 1, retryCount: 1, retryInterval: 1, showResults: true)
      }
    }
  }
}