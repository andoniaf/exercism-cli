FROM alpine:3.10.1 as builder

WORKDIR /tmp

RUN addgroup -g 1000 -S exercism && \
adduser -u 1000 -S exercism -G exercism

ADD https://github.com/exercism/cli/releases/download/v3.0.12/exercism-linux-64bit.tgz .

RUN tar -xf exercism-linux-64bit.tgz


FROM scratch 

# Copy unprivileged user
COPY --from=builder /etc/passwd /etc/passwd

# Copy bin from builder
COPY --from=builder /tmp/exercism /bin/exercism

USER exercism

ENTRYPOINT ["/bin/exercism"]

