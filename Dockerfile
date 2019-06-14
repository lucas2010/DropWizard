FROM openjdk:11-slim

WORKDIR /srv/dropwizardRestfulTest2
ARG JAR_FILE
ENV JAR_FILE ${JAR_FILE}
COPY target/${JAR_FILE} ${JAR_FILE}
ADD config.yml config.yml

EXPOSE 8080

#ENTRYPOINT ["java", "-jar", ${JAR_FILE}, "server", "config.yml"]
#CMD ["java", "-jar", "${JAR_FILE}", "server", "config.yml"]
#ARG JAR_FILE
CMD java -jar ${JAR_FILE} server config.yml
#CMD dir