FROM debian:bookworm AS builder

# unzip is required when executing the mvn package command
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk-headless maven git unzip

ARG JICOFO_TAG
RUN git clone --depth 1 --branch $JICOFO_TAG https://github.com/jitsi/jicofo

WORKDIR jicofo
#COPY *.patch .
#RUN git apply 0001-Remove-broken-command-line-args-parameters-setting.patch
RUN mvn package -DskipTests -Dassembly.skipAssembly=false

RUN unzip jicofo/target/jicofo-1.1-SNAPSHOT-archive.zip && \
    mv jicofo-1.1-SNAPSHOT /srv/build

FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y openjdk-17-jre-headless ca-certificates

COPY --from=builder /srv/build /usr/share/jicofo
COPY jicofo /usr/local/bin

CMD ["/usr/local/bin/jicofo"]
