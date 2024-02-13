#FROM registry.access.redhat.com/ubi9/ubi:9.3-1552
FROM registry.access.redhat.com/ubi8/openjdk-17

USER root
ENV HOME=/usr/app
RUN mkdir -p $HOME
WORKDIR $HOME
ADD . $HOME
COPY . .

# Install OpenJDK-8
#RUN yum update -y && \
#yum install -y java-1.8.0-openjdk-devel maven && \
#yum clean all

ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk

RUN mkdir -p /usr/app/.m2/repository && \
chmod -R 777 /usr/app/.m2

RUN mvn -verison

#RUN mvn clean package -e -X
#RUN mvn -f /usr/app/pom.xml clean package
#ARG JAR_FILE=usr/app/target/*.jar
#COPY --from=build $JAR_FILE /app/runner.jar
#COPY . .

#Copy the rest of the code into the image

# Build the application using Maven
 RUN mvn clean package

#Starting command for the container
#CMD ["java","-jar","/target/demo-0.0.1-SNAPSHOT.jar"]

ENTRYPOINT ["tail", "-f", "/dev/null"]

#ENTRYPOINT jar -jar /app/runner.jar

#Expose the port
EXPOSE 8080
