FROM alpine:3.17

RUN apk add rclone curl bash jq

COPY do-backup.sh /do-backup.sh

CMD bash /do-backup.sh
