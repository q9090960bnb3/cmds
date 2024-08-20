# 配置

## .wslconfig

在 %UserProfile% 目录下创建 .wslconfig 文件，配置如下：

### 配置指定内存

```ini
[wsl2]
memory=14GB
```

### 配置wsl走网络代理

```ini
[experimental]
autoMemoryReclaim=gradual  
networkingMode=mirrored
dnsTunneling=true
firewall=true
autoProxy=true
```