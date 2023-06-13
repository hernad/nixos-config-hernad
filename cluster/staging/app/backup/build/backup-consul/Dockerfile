FROM golang:buster as builder

WORKDIR /root
RUN git clone https://filippo.io/age && cd age/cmd/age && go build -o age .

FROM amd64/debian:buster

COPY --from=builder /root/age/cmd/age/age /usr/local/bin/age

RUN apt-get update && \
	apt-get -qq -y full-upgrade && \
	apt-get install -y rsync wget openssh-client unzip && \
	apt-get clean && \
	rm -f /var/lib/apt/lists/*_*

RUN mkdir -p /root/.ssh
WORKDIR /root

RUN wget https://releases.hashicorp.com/consul/1.8.5/consul_1.8.5_linux_amd64.zip && \
	unzip consul_1.8.5_linux_amd64.zip && \
	chmod +x consul && \
	mv consul /usr/local/bin && \
	rm consul_1.8.5_linux_amd64.zip

COPY do_backup.sh /root/do_backup.sh

CMD "/root/do_backup.sh"

