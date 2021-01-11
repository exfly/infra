# selfhosts

本地托管的一些基础设施服务 in docker compose

1. gitlab
2. gitlab-runner
3. minio

## TODO

- opentracing
- prometheus
- grafana
- loki

## Usages

本仓库包含各种自己托管的服务。

主要需要解决两个问题：
1. 自托管各种服务
2. 分成不同的 yaml 文件，方便选择性启动不同的服务（docker compose 比较麻烦的问题是多 yaml 共用一个 network）

如何共用相同 network：
```yaml
networks:
  minio:
    external:
      name: selfhostsrv
```
+ 手动创建 network

TODO: 如何验证多个 服务是在同一个网络

### cmd

```
docker network create selfhostsrv

docker-compose -f minio.yaml up -d
```

#### 安装 gitlab

```
docker-compose -f gitlab.yaml up -d

```

访问 gitlab `http://localhost:80`

```sh
docker-compose exec gitlab-runner gitlab-runner register

docker-compose -f gitlab.yaml exec gitlab-runner gitlab-runner register \
--non-interactive \
--url http://gitlab.local/ \
--registration-token fHRvUfPyzmD9J-rsby3q \
--executor docker \
--docker-image alpine:3 \
--docker-network-mode selfhostsrv
```
