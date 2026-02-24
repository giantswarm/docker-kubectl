FROM gsoci.azurecr.io/giantswarm/alpine:3.22.1

ARG VERSION=v1.34.4
RUN apk add --no-cache ca-certificates curl jq \
    && curl --silent --show-error --fail --location https://dl.k8s.io/release/${VERSION}/bin/linux/amd64/kubectl --output /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

RUN adduser -h "/home/giantswarm" -s /bin/sh -u 1000 -D giantswarm giantswarm

ENTRYPOINT ["kubectl"]
