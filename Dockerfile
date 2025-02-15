FROM quay.io/giantswarm/alpine:3.20.3

ARG VERSION=v1.32.2
RUN apk add --no-cache ca-certificates curl jq \
    && curl --silent --show-error --fail --location https://dl.k8s.io/release/${VERSION}/bin/linux/amd64/kubectl --output /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

RUN adduser -h "/home/giantswarm" -s /bin/sh -u 1000 -D giantswarm giantswarm

ENTRYPOINT ["kubectl"]
