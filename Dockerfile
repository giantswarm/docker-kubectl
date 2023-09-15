FROM quay.io/giantswarm/alpine:3.16

ARG VERSION=v1.28.2
RUN apk add --no-cache ca-certificates curl jq \
    && curl https://storage.googleapis.com/kubernetes-release/release/$VERSION/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

RUN adduser -h "/home/giantswarm" -s /bin/sh -u 1000 -D giantswarm giantswarm

ENTRYPOINT ["kubectl"]
