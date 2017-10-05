#!groovy

@Library('SovrinHelpers') _

def name = 'sovrin'

def buildDebUbuntu = { repoName, releaseVersion, sourcePath ->
    def volumeName = "sovrin-deb-u1604"
    if ("${BRANCH_NAME}" != master) volumeName = "${volumeName}.${BRANCH_NAME}"
    if (sh(script: "docker volume ls -q | grep -q '^$volumeName\$'", returnStatus: true) == 0) {
	sh "docker volume rm $volumeName"
    }
    dir('build-scripts/ubuntu-1604') {
        sh "./build-sovrin-docker.sh \"$sourcePath\" \"$releaseVersion\""
    }
    return "$volumeName"
}

def buildRpmCentos = { repoName, releaseVersion, sourcePath ->
    def volumeName = "sovrin-rpm-c7.3.1611"
    if ("${BRANCH_NAME}" != master) volumeName = "${volumeName}.${BRANCH_NAME}"
    if (sh(script: "docker volume ls -q | grep -q '^$volumeName\$'", returnStatus: true) == 0) {
	sh "docker volume rm $volumeName"
    }
    dir('build-scripts/centos-7.3.1611') {
        sh "./build-sovrin-docker.sh \"$sourcePath\" \"$releaseVersion\""
    }
    return "$volumeName"
}

options = new TestAndPublishOptions()
options.enable([StagesEnum.PACK_RELEASE_DEPS, StagesEnum.PACK_RELEASE_ST_DEPS])
testAndPublish(name, [ubuntu: [:]], true, options, [ubuntu: buildDebUbuntu, centos: buildRpmCentos])
