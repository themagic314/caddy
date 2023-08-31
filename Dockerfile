FROM caddy:2-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/gandi@master --with github.com/caddy-dns/cloudflare@master

FROM caddy:2.7.4-alpine

ENV GANDI_API_TOKEN SETMEUP

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
