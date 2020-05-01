FROM quay.io/giantswarm/alpine:3.11

ARG VERSION=v1.17.5
RUN apk add --no-cache ca-certificates \
    && apk add --update -t deps curl \
    && curl https://storage.googleapis.com/kubernetes-release/release/$VERSION/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

ENTRYPOINT ["kubectl"]
