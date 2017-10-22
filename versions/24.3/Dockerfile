# Uses multi-stage builds
# See https://docs.docker.com/engine/userguide/eng-image/multistage-build/#use-multi-stage-builds
FROM alpine:3.6 as builder
RUN apk --no-cache add gcc automake autoconf wget gnutls gnutls-dev ca-certificates

RUN wget https://ftp.gnu.org/gnu/emacs/emacs-24.3.tar.gz && \
    tar xvfz emacs-24.3.tar.gz && \
    cd emacs-24.3 && \
    ./autogen.sh && \
    ./configure --prefix=/usr/local --without-makeinfo --without-dbus --without-x CC=gcc && \
    make install

FROM alpine:latest
RUN apk --no-cache add gnutls ca-certificates
COPY --from=builder /usr/local /usr/local
