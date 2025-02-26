FROM ubuntu:20.04

ARG PROFILE=release
ARG BINARY=http-server

COPY target/${PROFILE}/${BINARY} /usr/local/bin

# Checks
RUN chmod +x /usr/local/bin/${BINARY} && \
    ldd /usr/local/bin/${BINARY} && \
    /usr/local/bin/${BINARY} --version

EXPOSE 30333 9933 9944
VOLUME ["/data"]

CMD ["/usr/local/bin/${BINARY}"]