mvn clean install
sleep 5
java -javaagent:src/main/resources/lib/jacocoagent.jar=address=*,port=36320,destfile=jacoco-it.exec,output=tcpserver -jar target/jacoco-code-coverage-example-1.2.jar

java -javaagent:src/main/resources/lib/jacocoagent.jar=destfile=jacoco-it.exec,output=file -jar target/jacoco-code-coverage-example-1.2.jar
sleep 5
curl -X GET http://localhost:8080/test/9
curl -X GET http://localhost:8080/test/50
sleep 5
java -jar src/main/resources/lib/jacococli.jar dump --address localhost --port 36320 --destfile target/jacoco-it.exec

java -jar src/main/resources/lib/jacococli.jar dump --address localhost --port 36320 --destfile jacoco-it.exec

sleep 5
java -jar src/main/resources/lib/jacococli.jar report target/jacoco-it.exec --classfiles target/classes/com --sourcefiles src/main/java/ --html target/jacoco-report

java -jar src/main/resources/lib/jacococli.jar report jacoco-it.exec --classfiles target/classes/com --sourcefiles src/main/java/ --html target/jacoco-report
