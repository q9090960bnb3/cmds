# wsl

## 查看基本信息

```sh
wsl -l -v
```

## 关闭系统

```sh
wsl --shutdown
```

## 导出虚拟系统

```sh
wsl --export {wslName} {location/name.tar}
```

## 注销虚拟系统

此会删除虚拟系统，释放磁盘空间

```sh
wslconfig /u {wslName}
```

## 导入虚拟系统

```sh
wsl --import {wslName} {系统的存放位置} {系统tar路径}
```

## 其他，查看安装位置

```powershell
(Get-ChildItem -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Lxss | Where-Object { $_.GetValue("DistributionName") -eq '{wslName}' }).GetValue("BasePath") + "\ext4.vhdx"
```