# dd

## 测试写

```sh
$ dd if=/dev/zero of=testfile bs=8k count=128000 oflag=direct
128000+0 records in
128000+0 records out
1048576000 bytes (1.0 GB, 1000 MiB) copied, 32.397 s, 32.4 MB/s
```

## 测试读

```sh
$ dd if=testfile of=/dev/null bs=8k iflag=direct
128000+0 records in
128000+0 records out
1048576000 bytes (1.0 GB, 1000 MiB) copied, 8.35926 s, 125 MB/s
```