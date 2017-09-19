#!groovy

@Library('SovrinHelpers') _

def name = 'sovrin'

def buildDebUbuntu = { repoName, releaseVersion, sourcePath ->
    def volumeName = "sovrin-deb-u1604"
    sh "docker volume inspect $volumeName > /dev/null 2>&1 || docker volume rm $volumeName"
    dir('build-scripts/ubuntu-1604') {
        sh "./build-sovrin-docker.sh $sourcePath $releaseVersion"
    }
    return "$volumeName"
}

options = new TestAndPublishOptions()
options.enable([StagesEnum.PACK_RELEASE_DEPS, StagesEnum.PACK_RELEASE_ST_DEPS])
options.skip([StagesEnum.PYPI_RELEASE, StagesEnum.GITHUB_RELEASE]) // Avoid to publish on PyPI and GitHub while working on CentOS
testAndPublish(name, [ubuntu: [:]], true, options, [ubuntu: buildDebUbuntu])
