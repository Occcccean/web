ip = 47.96.254.64
url = 'http://${ip}/myapp/test?id=1&name=hello'

run:
	mvn package
	scp target/web.war lingshin@gungnir.top:/tmp/webapps/lingshin/web.war

clean:
	mvn clean

test:
	@curl ${url}
