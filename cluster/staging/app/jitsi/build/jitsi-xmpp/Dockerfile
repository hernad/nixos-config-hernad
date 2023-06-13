FROM debian:bookworm as builder

RUN apt-get update && \
    apt-get install -y git unzip

ARG MEET_TAG
RUN git clone --depth 1 --branch ${MEET_TAG} https://github.com/jitsi/jitsi-meet/

FROM debian:bookworm

ARG PROSODY_VERSION
RUN apt-get update && \
    apt-get install -y wget gnupg2 extrepo && \
    extrepo enable prosody && \
    apt-get update && \
    apt-cache show prosody-0.12 && \
    apt-get install -y prosody-0.12=${PROSODY_VERSION} lua-event

RUN mkdir -p /usr/local/share/ca-certificates/ && \
    ln -sf \
      /var/lib/prosody/certs/auth.jitsi.crt \
      /usr/local/share/ca-certificates/auth.jitsi.crt && \
    mkdir /run/prosody && \
    touch /run/prosody/prosody.pid && \
    mkdir -p /var/lib/prosody && \
    chown -R prosody:prosody /var/lib/prosody /run/prosody

COPY --from=builder /jitsi-meet/resources/prosody-plugins /usr/share/jitsi-meet/prosody-plugins/
COPY xmpp_prosody /usr/local/bin/xmpp_prosody

WORKDIR /var/lib/prosody
USER prosody
CMD ["/usr/local/bin/xmpp_prosody"]
