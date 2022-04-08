rm -rf docker-jenkins-build
mkdir docker-jenkins-build
cd docker-jenkins-build
cp /var/lib/jenkins/workspace/addressbook-project/target/addressbook.war .

touch Dockerfile
cat <<EOT>>Dockerfile
FROM tomcat
ADD addressbook.war /usr/local/tomcat/webapps
CMD "catalina.sh" "run"
EXPOSE 8080
EOT

sudo docker image build -t sahosoftdevops/deployimage:$BUILD_NUMBER .

sudo docker container run -itd --name=FP-$BUILD_NUMBER -P sahosoftdevops/deployimage:$BUILD_NUMBER
