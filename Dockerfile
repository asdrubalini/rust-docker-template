FROM alpine:3.14

RUN apk update --no-cache
RUN apk upgrade --no-cache

RUN addgroup -S runner && adduser -S runner -G runner
RUN mkdir /app && chown -R runner:runner /app
WORKDIR /app

COPY target/x86_64-unknown-linux-musl/release/rust-docker-template /usr/local/bin/rust-docker-template
RUN chmod +x /usr/local/bin/rust-docker-template

USER runner

CMD [ "/usr/local/bin/rust-docker-template" ]

