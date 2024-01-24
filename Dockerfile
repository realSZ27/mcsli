# Created by SZ27 https://github.com/realSZ27
# This is my first time making a docker image, so feel free to make make changes

FROM alpine:3

ENV JAVA_HOME=/opt/java/openjdk
COPY --from=eclipse-temurin:17 $JAVA_HOME $JAVA_HOME
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# Install required packages
RUN apk add --no-cache bash jq curl wget 

# Copies script
COPY ./install-docker.sh /
RUN chmod +x /install-docker.sh

ENV SERVER_VERSION "1.20.4"
ENV SERVER_SOFTWARE "purpur"
ENV MAX_RAM "2G"
ENV MIN_RAM "1G"

EXPOSE 25565
EXPOSE 19132

CMD ["/install-docker.sh"]