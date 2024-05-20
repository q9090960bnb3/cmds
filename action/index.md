# github action

## 使用`docker`环境编译，并发布静态网页

- 发布到 github pages

```yml
name: publish github page

permissions:
  contents: read
  pages: write
  id-token: write
on:
  push:
    branches: [ main, doc ]
    paths:
      - '*.md'
      - '.github/workflows/github_doc.yml'

jobs:
  # Single deploy job since we're just deploying
  doc_deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - uses: addnab/docker-run-action@v3
        with:
          image: ${{github.repository}}:latest
          options: -v ${{ github.workspace }}:/doc -w /doc
          shell: bash
          run: |
            gbook install
            gbook build

      - name: Setup Pages
        uses: actions/configure-pages@v5
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          # Upload entire repository
          path: './_book'
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

** 特别注意以上 `permissions` 字段中内容，必须加上，否则失败

## 发布到`docekr hub`上

```yml
name: Docker Build and Push
on:
  push:
    tags:
      - '*'

jobs:
  build-and-push:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v2

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v1

      - name: Login to Docker Hub
        uses: docker/login-action@v1
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_PASSWORD }}

      - name: tag Set env
        run: echo "tag=${GITHUB_REF#refs/*/}" >> $GITHUB_ENV
        
      - name: Build and push
        uses: docker/build-push-action@v5
        with:
          context: .
          push: true
          tags: |
            ${{github.repository}}:latest
            ${{github.repository}}:${{env.tag}}
        
```

## 同步`docker hub overview`

```yml
name: publish docker hub doc

on:
  push:
    branches: [ main, hub ]
    paths:
      - 'README.md'

jobs:
  push_hub_doc:
    runs-on: ubuntu-latest
    steps:
      - name: push README to Dockerhub
        uses: christian-korneck/update-container-description-action@v1
        env:
          DOCKER_USER: ${{ secrets.DOCKER_USERNAME }}
          DOCKER_PASS: ${{ secrets.DOCKER_PASSWORD }}
        with:
          destination_container_repo: ${{github.repository}}
          provider: dockerhub
          short_description: ${{ github.event.repository.description }}
          readme_file: 'README.md'
```

** 提供给github 的docker token 需要读写删的权限，仅仅读写的权限会失败