FROM alpine

RUN apk add --no-cache ca-certificates \
    && apk add --update -t deps curl \
    && curl https://storage.googleapis.com/kubernetes-release/release/v1.8.4/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

ENTRYPOINT ["kubectl"]
