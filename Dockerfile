# Build stage
FROM gradle:8.11.1 as build
COPY . /app                   
WORKDIR /app
RUN gradle build --no-daemon

# Package stage
FROM openjdk:21-jdk
COPY --from=build /app/build/libs/MyNames-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]