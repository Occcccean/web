run:
	mvn package
	scp target/web.war lingshin@gungnir.top:/tmp/webapps/lingshin/web.war

clean:
	mvn clean
