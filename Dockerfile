#
# Build stage
#
# FROM gradle:8.11.1 as build
# COPY --chown=gradle:gradle . /home/gradle/src
# WORKDIR /home/gradle/src
# RUN gradle build --no-daemon

#
# Package stage
#
# FROM openjdk:21-jdk
# COPY --from=build /home/gradle/src/build/libs/MyNames-0.0.1-SNAPSHOT.jar app.jar
# ENTRYPOINT ["java","-jar","/app.jar"]

# Build stage
FROM gradle:8.11.1 as build
# COPY --chown=gradle:gradle . /home/gradle/src
# WORKDIR /home/gradle/src
RUN gradle build --no-daemon

# Package stage
FROM openjdk:21-jdk
# COPY --from=build /home/gradle/src/build/libs/MyNames-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/build/libs/MyNames-0.0.1-SNAPSHOT.jar"]