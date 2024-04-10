FROM gradle:8.7.0-jdk17-alpine AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN --mount=type=cache,target=/root/.gradle gradle --no-daemon -i clean build -x test


FROM eclipse-temurin:17-alpine
WORKDIR /home/app
COPY --from=build /home/gradle/src/build/libs/*.jar /home/app/app.jar

EXPOSE 8080
ENTRYPOINT sleep 2; java -jar /home/app/app.jar
