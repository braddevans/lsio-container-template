FROM ghcr.io/linuxserver/baseimage-alpine:3.13

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="owo"

# environment settings
ENV HOME="/app"
ENV S6_BEHAVIOUR_IF_STAGE2_FAILS=2

RUN \
 echo "**** install build packages ****" && \
 apk add --no-cache \
    curl && \
 apk add --no-cache --virtual=build-dependencies \
    git \
    jq && \
 echo "**** install <aaaa> ****" && \
 echo "install stuff Here" && \
 echo "**** cleanup ****" && \
 apk del --purge \
    build-dependencies && \
 rm -rf \
    /root/.cache \
    /tmp/*

# copy local files
COPY root/ /