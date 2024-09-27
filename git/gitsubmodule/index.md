# gitsubmodule

```sh
$ git submodule -h
usage: git submodule [--quiet] [--cached]
   or: git submodule [--quiet] add [-b <branch>] [-f|--force] [--name <name>] [--reference <repository>] [--] <repository> [<path>]
   or: git submodule [--quiet] status [--cached] [--recursive] [--] [<path>...]
   or: git submodule [--quiet] init [--] [<path>...]
   or: git submodule [--quiet] deinit [-f|--force] (--all| [--] <path>...)
   or: git submodule [--quiet] update [--init] [--remote] [-N|--no-fetch] [-f|--force] [--checkout|--merge|--rebase] [--[no-]recommend-shallow] [--reference <repository>] [--recursive] [--] [<path>...]
   or: git submodule [--quiet] set-branch (--default|--branch <branch>) [--] <path>
   or: git submodule [--quiet] set-url [--] <path> <newurl>
   or: git submodule [--quiet] summary [--cached|--files] [--summary-limit <n>] [commit] [--] [<path>...]
   or: git submodule [--quiet] foreach [--recursive] <command>
   or: git submodule [--quiet] sync [--recursive] [--] [<path>...]
   or: git submodule [--quiet] absorbgitdirs [--] [<path>...]
```

## 添加子模块

### 添加已在工程中存在的子模块

```sh
# 比方demo 已经在当前工程被拉取了, 路径为 demo
git submodule add ./demo
# 再更新子模块的地址
git submodule set-url demo {giturl}
# 更新子模块选取的分支
git submodule set-branch --branch {branch} demo
```

### 添加未在工程中存在的子模块

```sh
git submodule add -b {branch} {giturl} demo
```

## 拉取子模块

```sh
git submodule update --init --recursive
```

## 删除子模块

1. 取消对子模块的追踪：
```sh
git submodule deinit -f 子模块路径
```

2. 从 Git 中移除子模块：
```sh
git rm -f 子模块路径
```

3. 删除子模块目录：
```sh
rm -rf 子模块路径
```

4. 删除 .gitmodules 文件中的子模块条目： 打开 .gitmodules 文件，删除与子模块相关的条目。
5. 删除 .git/config 文件中的子模块条目： 打开 .git/config 文件，删除与子模块相关的条目。
6. 删除 .git/modules 目录中的子模块信息：
```sh
rm -rf .git/modules/子模块路径
```
