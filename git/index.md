# git

## 克隆

```sh

```

## 切换分支

- 切换并创建分支

```sh
git checkout -b my_branch
```

- 切换并创建空记录分支

```sh
git push -u origin new_branch
```

## 标签操作

### 创建标签

```sh
# 轻量标签
git tag -a {tag_name}
# 带注释标签
git tag -a {tag_name} -m "tag message"
# 给指定commit 打标签
git tag -a {tag_name} -m "tag message" {commit_id}
```

### 推送标签

```sh
# 推送单个标签
git push origin v1.0.0
# 推送所有标签
git push origin --tags
```

### 查看标签

```sh
# 查看本地标签
git tag -n
# 查看远程标签
git ls-remote --tags origin
```

### 删除本地标签

```sh
# 删除单个
git tag -d {tag_name}
# 删除多个
git tag -d $(git tag)
```

### 删除远程标签

必须先删除本地标签

```sh
# 删除单个
git push origin :refs/tags/{tag_name}
# 或
git push origin --delete {tag_name}
# 删除多个
git push origin :refs/tags/$(git tag)
```

### 重命名标签

先删除旧标签，再创建新标签