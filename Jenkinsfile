node('slave1') {
  stage("git clone") {
    git credentialsId: 'GitHub Credentials',
    url: 'https://github.com/Harthika/Capstone-B19-bookstoreV1.0.git'
  }
  stage('SonarQube analysis') {
    def scannerHome = tool 'Sonarscanner';
    def mavenhome = tool name: 'Maven',
    type: 'maven';
    withSonarQubeEnv(credentialsId: 'sonaraccesstoken') {
      sh "${mavenhome}/bin/mvn sonar:sonar"
    }
  }
    stage("artifactory configuration") {
    def server = Artifactory.server 'Jfrog'
    def rtMaven = Artifactory.newMavenBuild()
    rtMaven.resolver server: server,
    releaseRepo: 'libs-release',
    snapshotRepo: 'libs-snapshot'
    rtMaven.deployer server: server,
    releaseRepo: 'libs-release-local',
    snapshotRepo: 'libs-snapshot-local'
    rtMaven.tool = 'Maven'
    def buildInfo = rtMaven.run pom: 'pom.xml',
    goals: 'clean install'
    def downloadSpec = readFile 'exclude-download.json'
    def buildInfo2 = server.download spec: downloadSpec
    sh "chmod 777 $WORKSPACE/script.sh"
    sh "$WORKSPACE/script.sh"
  }
  stage("executing ansible_playbook") {
    sh "ansible-playbook -i /etc/ansible $WORKSPACE/ansible_playbook.yml"
  }
 }
