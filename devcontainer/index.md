# devcontainer

这个是非常好用，保证各个开发环境统一的工具

## features

非常号的特性

```json
"features": {
    "ghcr.io/devcontainers/features/github-cli:1": {}
}
```

- github-cli

建议用此特性，如果只用`git` 特性，会造成证书异常，需要每次创建环境后取消证书校验才能进行同步推送，不建议使用