FROM java:8-jre
MAINTAINER Joshua Fernandes <joshpeyton04@gmail.com>

ADD ./build/libs/test-1.0.jar /application/
CMD ["java", "-jar", "/application/test-1.0.jar"]

EXPOSE 8000
