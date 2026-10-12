# Start from Alpine.
FROM gsoci.azurecr.io/giantswarm/alpine:3.24.2

# Define target OS & architecture.
ARG TARGETOS
ARG TARGETARCH

# Add Giant Swarm user and install CA certificates & jq.
RUN adduser -u 1000 -D giantswarm && apk add --no-cache ca-certificates jq

# Install kubectl.
ARG VERSION=v1.37.1
ADD --chmod=755 https://dl.k8s.io/release/${VERSION}/bin/${TARGETOS}/${TARGETARCH}/kubectl /usr/local/bin/kubectl

# Run kubectl.
ENTRYPOINT [ "kubectl" ]
