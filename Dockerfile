FROM alpine

RUN apk add --no-cache ca-certificates \
    && apk add --update -t deps curl \
    && curl https://storage.googleapis.com/kubernetes-release/release/v1.15.5/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

RUN adduser -u 1010 -D nouser
USER 1010

ENTRYPOINT ["kubectl"]

