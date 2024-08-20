# winsat

```sh
$ winsat disk -drive D:
Windows 系统评估工具
> 正在运行: 功能枚举 ''
> 运行时间 00:00:00.00
> 正在运行: 存储评估 '-drive D: -ran -read'
> 运行时间 00:00:00.86
> 正在运行: 存储评估 '-drive D: -seq -read'
> 运行时间 00:00:01.58
> 正在运行: 存储评估 '-drive D: -seq -write'
> 运行时间 00:00:01.05
> 正在运行: 存储评估 '-drive D: -flush -seq'
> 运行时间 00:00:00.33
> 正在运行: 存储评估 '-drive D: -flush -ran'
> 运行时间 00:00:00.31
> Dshow 视频编码时间                                 0.00000 s
> Dshow 视频解码时间                                 0.00000 s
> 媒体基础解码时间                                     0.00000 s
> Disk  Random 16.0 Read                       674.46 MB/s          8.5
> Disk  Sequential 64.0 Read                   3044.69 MB/s          9.2
> Disk  Sequential 64.0 Write                  2314.26 MB/s          9.1
> 顺序写操作的平均读取时间                                 0.053 ms          8.9
> 延迟: 95%                                      0.151 ms          8.9
> 延迟: 最大                                       3.167 ms          8.7
> 随机写操作的平均读取时间                                 0.061 ms          8.9
> 总运行时间 00:00:04.34
```