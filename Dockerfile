# syntax=docker/dockerfile:1

FROM caddy:2.11.7-builder-alpine AS builder

ARG CACHE_HANDLER_REF=07d7af2130699eb840e1f4ed49ef817da4201c2e
ARG TRANSFORM_ENCODER_REF=ba4124974830222da7f12a091cf11ddf4d49363f
ARG CLOUDFLARE_DNS_REF=a8737d095ad5a48ca031cea6ab704057dbc2d250
ARG BROTLI_REF=a11b086aedd96b143eb18ea6e84cedf909b1bd25
ARG RATE_LIMIT_REF=4b45cfcaf5edfe53b95f4d4192431fda01e9626f

RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    xcaddy build \
      --output /usr/bin/caddy \
      --with github.com/caddyserver/cache-handler@${CACHE_HANDLER_REF} \
      --with github.com/caddyserver/transform-encoder@${TRANSFORM_ENCODER_REF} \
      --with github.com/caddy-dns/cloudflare@${CLOUDFLARE_DNS_REF} \
      --with github.com/ueffel/caddy-brotli@${BROTLI_REF} \
      --with github.com/WJQSERVER/caddy-ext/ratelimit@${RATE_LIMIT_REF}

FROM caddy:2.11.7-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
