# netsh

- port
- forward

## windows 端口转发

- netsh interface portproxy add v4tov4 listenport=源端口 listenaddress=本地IP connectport=目标端口 connectaddress=目标IP protocol=tcp

```sh
# 添加转发
netsh interface portproxy add v4tov4 listenport=15006 connectaddress=127.0.0.1 connectport=5006
# 查看转发
netsh interface portproxy show all
# 删除转发
netsh interface portproxy delete v4tov4 listenport=15006
```