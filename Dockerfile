FROM --platform=$BUILDPLATFORM gsoci.azurecr.io/giantswarm/alpine:3.22.1 AS prep
USER root
ARG VERSION=v1.36.0
ARG TARGETARCH
RUN apk add --no-cache ca-certificates curl jq \
    && curl --silent --show-error --fail --location https://dl.k8s.io/release/${VERSION}/bin/linux/${TARGETARCH}/kubectl --output /kubectl \
    && chmod +x /kubectl \
    && adduser -h "/home/giantswarm" -s /bin/sh -u 1000 -D giantswarm giantswarm

FROM gsoci.azurecr.io/giantswarm/alpine:3.22.1

COPY --from=prep /kubectl /usr/local/bin/kubectl
COPY --from=prep /etc/ssl/certs /etc/ssl/certs
COPY --from=prep /usr/share/ca-certificates /usr/share/ca-certificates
COPY --from=prep /usr/bin/jq /usr/bin/jq
COPY --from=prep /etc/passwd /etc/passwd
COPY --from=prep /etc/group /etc/group
COPY --from=prep /etc/shadow /etc/shadow
COPY --from=prep --chown=1000:1000 /home/giantswarm /home/giantswarm

ENTRYPOINT ["kubectl"]
