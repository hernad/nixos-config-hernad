FROM debian:bookworm AS builder

RUN apt-get update && \
    apt-get install -y git unzip maven openjdk-17-jdk-headless

ARG JVB_TAG
RUN git clone --depth 1 --branch ${JVB_TAG} https://github.com/jitsi/jitsi-videobridge

WORKDIR jitsi-videobridge
#COPY *.patch .
#RUN git apply 0001-Remove-deprecated-argument.patch
RUN mvn package  -DskipTests
RUN unzip jvb/target/jitsi-videobridge*.zip && \
    mv jitsi-videobridge-*-SNAPSHOT build

FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y openjdk-17-jre-headless curl iproute2

COPY --from=builder /jitsi-videobridge/build /usr/share/jvb
COPY jvb_run /usr/local/bin/jvb_run

CMD ["/usr/local/bin/jvb_run"]
