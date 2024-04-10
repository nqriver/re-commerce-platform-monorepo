FROM eclipse-temurin:17-alpine as builder
COPY . .
RUN chmod +x gradlew
RUN ./gradlew clean build

FROM eclipse-temurin:17-alpine
WORKDIR /home/app
ARG JAR_FILE=/home/app/build/libs/auctsys-0.0.1-SNAPSHOT.jar
COPY --from=builder $JAR_FILE /home/app/app.jar
EXPOSE 8080
ENTRYPOINT sleep 2; java -jar /home/app/app.jar
