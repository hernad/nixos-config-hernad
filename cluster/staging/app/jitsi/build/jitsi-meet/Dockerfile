FROM debian:bookworm AS builder

RUN apt-get update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_19.x | bash - && \
    apt-get install -y git nodejs make git unzip

ARG MEET_TAG
RUN git clone --depth 1 --branch ${MEET_TAG} https://github.com/jitsi/jitsi-meet

WORKDIR jitsi-meet
# @FIXME read the following SO post to understand why we declare this option
# https://stackoverflow.com/a/73027407 
COPY *.patch .
RUN git apply 0001-allow-broken-openssl-routines.patch
RUN npm install && \
    make

FROM debian:bookworm

COPY --from=builder /jitsi-meet /srv/jitsi-meet
RUN apt-get update && \
    apt-get install -y nginx && \
    rm /etc/nginx/sites-enabled/* && \
    rm /etc/nginx/nginx.conf

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
