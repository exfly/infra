# selfhosts

本地托管的一些基础设施服务 in docker compose

1. gitlab
2. gitlab-runner
3. minio
4. loki
5. prometheus
6. grafana
7. jaeger all in one
8. netdata

## TODO

- k3s

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
make dep
make minio
make gitlab
make registry
make grafana
make loki
make netdata
make prometheus
make opentracing
```
