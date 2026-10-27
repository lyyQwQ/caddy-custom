# caddy-custom

用于构建 VPS 统一使用的自定义 Caddy Docker 镜像。

## 构建内容

- 基于官方 `caddy:2.11.7-builder-alpine` 构建；
- 固定 Caddy 与第三方模块 commit；
- 发布 `linux/amd64` 和 `linux/arm64` 到 GHCR；
- CI 在发布前检查 Caddy 版本和模块是否存在。

插件清单及固定版本见 [`plugins.txt`](./plugins.txt)。

当前模块：

- `github.com/caddyserver/cache-handler`
- `github.com/caddyserver/transform-encoder`
- `github.com/caddy-dns/cloudflare`
- `github.com/ueffel/caddy-brotli`
- `github.com/WJQSERVER/caddy-ext/ratelimit`

## 本地构建

```bash
docker buildx build --load -t caddy-custom:local .
docker run --rm caddy-custom:local caddy version
docker run --rm caddy-custom:local caddy list-modules
```

## 镜像

CI 发布到：

```text
ghcr.io/lyyqwq/caddy-custom
```

Cloudflare API Token 等运行时密钥只通过部署环境注入，不写入仓库。
