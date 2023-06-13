FROM golang:1.19.0-bullseye AS builder

ARG STOLON_VERSION
WORKDIR /stolon
RUN git clone https://github.com/sorintlab/stolon .
RUN git pull && git checkout ${STOLON_VERSION}
RUN go mod download
COPY 0001-Add-max-rate-to-pg_basebackup.patch .
RUN git apply 0001-Add-max-rate-to-pg_basebackup.patch
RUN make && chmod +x /stolon/bin/*

FROM postgres:14.5-bullseye
COPY --from=builder /stolon/bin /usr/local/bin
USER postgres
ENTRYPOINT []
CMD ["/bin/bash"]
