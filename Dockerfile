FROM alpine:3.10.1 as builder

ENV EXERCISM_CLI_VERSION v3.0.12

WORKDIR /tmp

RUN apk add --no-cache ca-certificates

RUN wget "https://github.com/exercism/cli/releases/download/$EXERCISM_CLI_VERSION/exercism-linux-64bit.tgz"

RUN tar -xf exercism-linux-64bit.tgz


FROM alpine:3.10.1

RUN addgroup -g 1000 -S exercism && \
    adduser -u 1000 -S exercism -G exercism

RUN mkdir -p /home/exercism/.config/exercism

# Copy bin from builder
COPY --from=builder /tmp/exercism /bin/exercism

# Copy ca-certificates
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

USER exercism
WORKDIR /Exercism

ENTRYPOINT ["/bin/exercism"]

