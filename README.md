# simple-java-monolith-app
This is a simple java monolith application based on below folder structure.
simple-monolith/
├─ pom.xml
├─ Dockerfile
├─ .dockerignore
├─ src/
│  ├─ main/
│  │  ├─ java/com/mithuntech/
│  │  │  ├─ SimpleMonolithApplication.java
│  │  │  ├─ controller/
│  │  │  │  └─ HelloController.java
│  │  │  └─ service/
│  │  │     └─ GreetingService.java
│  │  └─ resources/
│  │     └─ application.properties
│  └─ test/
│     └─ java/com/mithuntech/
│        └─ controller/
│           └─ HelloControllerTest.java
└─ .github/workflows/
   └─ ci-cd.yml   (GitHub Actions example)
└─ Jenkinsfile    (Jenkins pipeline example)

# build the project & run tests
mvn clean package

# run locally
java -jar target/simple-monolith-0.0.1-SNAPSHOT.jar

# or using maven
mvn spring-boot:run

# docker build
docker build -t mithuntech/simple-monolith:0.0.1 .

# docker run
docker run -p 8080:8080 mithuntech/simple-monolith:0.0.1

## Endpoints:

GET http://localhost:8080/api/health → returns OK

GET http://localhost:8080/api/greet?name=YourName → greeting
