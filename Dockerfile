FROM maven:ibmjava-alpine as build

COPY . .

RUN mvn clean package



FROM openjdk:8-alpine

COPY --from=build /target/websocket-demo-0.0.1-SNAPSHOT.jar .

CMD java -Djava.security.egd=file:/dev/./urandom -jar websocket-demo-0.0.1-SNAPSHOT.jar

