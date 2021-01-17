# gitlab

1. gitlab
2. gitlab-runner

```
docker-compose -f gitlab/gitlab.yaml -d
```

访问 gitlab `http://localhost:80`

```sh
docker-compose -f gitlab/gitlab.yaml exec gitlab-runner gitlab-runner register \
--non-interactive \
--url http://gitlab.local/ \
--registration-token fHRvUfPyzmD9J-rsby3q \
--executor docker \
--docker-image alpine:3 \
--docker-network-mode selfhostsrv
```
