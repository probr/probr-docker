FROM golang:1.14.4-alpine AS probr-build

RUN apk update && apk upgrade && apk add --update bash
RUN apk add --update make git build-base
RUN apk add --no-cache \
        python3 \
        py3-pip \
    && pip3 install --upgrade pip \
    && pip3 install \
        awscli \
    && rm -rf /var/cache/apk/*

RUN go get -v github.com/markbates/pkger/cmd/pkger
RUN go get -u golang.org/x/lint/golint

WORKDIR /probr
RUN mkdir -p cmd/bin && \
    mkdir output
COPY . .

# Args may be overridden at build time
ARG VERSION_PROBR=v0.1.2
ARG VERSION_K8S=v0.1.1
ARG VERSION_AKS=v0.1.0

RUN make probr VERSION=${VERSION_PROBR} && \
    mv /probr/cmd/bin/probr /probr/cmd/probr
RUN make kubernetes VERSION=${VERSION_K8S}
RUN make aks VERSION=${VERSION_AKS}

ENV PROBR_INSTALL_DIR=/probr/cmd
ENV PROBR_WRITE_DIRECTORY=/probr/run

# At runtime:
# Config file and Output directory must be mounted to /probr/run
# Service packs may be overridden for debugging by mounting to /probr/cmd/bin
# Entrypoint may be overridden by mounting to /probr/entrypoint.sh
WORKDIR /probr/run
ENTRYPOINT [ "/probr/entrypoint.sh" ] 
