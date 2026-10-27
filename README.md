# caddy-custom

用于构建 VPS 统一使用的自定义 Caddy Docker 镜像。

## 目标

- 基于官方 Caddy Builder 镜像构建；
- 固定 Caddy 与第三方模块版本；
- 保留当前部署需要的 cache、transform 与 Cloudflare DNS 模块；
- 通过镜像 tag 与 digest 支持可追踪升级和回滚；
- 不在仓库保存 Cloudflare Token 或其他运行时密钥。

## 当前部署基线

现有服务器使用的自定义镜像包含：

- `github.com/caddyserver/cache-handler`
- `github.com/caddyserver/transform-encoder`
- `github.com/caddy-dns/cloudflare`
- `github.com/ueffel/caddy-brotli`
- `github.com/WJQSERVER/caddy-ext/ratelimit`

后续构建前会逐项确认模块是否仍被配置使用，以及上游版本和维护状态。
