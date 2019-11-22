pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        git(url: 'https://github.com/BRSweagle/LocalWebHost', poll: true)
        sleep 2
      }
    }

      stage ('Validation'){

        parallel {

        stage ('Config'){
		stages ('Sweagle Steps'){



        stage('UploadConfig'){

            steps {

                SWEAGLEUpload(
                actionName: 'Upload JSON Files',
                fileLocation: "*.json",
                format: 'json',
                markFailed: false,
                nodePath: 'Eldorado,releases,jenkinsConf',
                onlyParent: false,
                showResults: false,
                withSnapshot: false,
                subDirectories: true,
                description: 'Upload json files',
                tag: '',
                autoRecognize: false,
                allowDelete: false)

            }
        }

            stage('Validate Config') {
                steps {
                    SWEAGLEValidate(
                    actionName: 'Validate Config Files',
                    mdsName: 'jenkinsConf',
                    warnMax: 0,
                    errMax: 5,
                    markFailed: true,
                    showResults: true,
                    retryCount: 5,
                    retryInterval: 5)
                    }
            	}

        stage('Snapshot Config') {
            steps {
              SWEAGLESnapshot(
              actionName: 'Validated Snapshot jenkinsConf',
              mdsName: 'jenkinsConf',
              description: "Validated Snapshot for Jenkins Build ${BUILD_ID}",
              tag: "Version:1.7.${BUILD_ID}",
              markFailed: false,
              showResults: false)


            }
        }

        stage('Export Config') {
            steps {
              SWEAGLEExport(
              actionName: 'Export jenkinsConf settings.json',
              mdsName: 'jenkinsConf',
              exporter: 'retrieveAllDataFromNode',
              args: "mycnf",
              format: 'json',
              fileLocation: "settings.json",
              markFailed: true,
              showResults: true)


            }
        }
			}
			} //Sweagle versioning and validation

		stage ('Code'){
		stages{

			    stage('jUnit Test'){
                steps {echo "Testing..."
                     }
                  }

                stage('SonarQube'){
                steps {echo "scanning..."
                     }
                  }

                  }


        }
       } //parallel
    } //Validation Stage


    stage ('Build'){
    steps {sleep(time:5,unit:"SECONDS")
                     }

    }

    stage ('Deployment'){
    steps {sleep(time:5,unit:"SECONDS")
                     }

    }

    stage (Functional) {
        parallel {

			    stage('Selenium API'){
                steps { echo "Selenium API..2..3..4"
                		sleep(time:2,unit:"SECONDS")
                		echo "Selenium API..2..3..4"
                     }
                  }

                	    stage('Selenium UI'){
                steps {	echo "Selenium UI..2..3..4"
                	sleep(time:2,unit:"SECONDS")
		        echo "Selenium UI..2..3..4"
                  }
		}

    }

    }//Functional Testing

 } //Outer Stages
} //Pipeline
