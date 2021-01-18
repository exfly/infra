# k3s

## Usages

```sh
pwd # k3s
mkdir airgap
bash k3s/scripts/offline-k3s.sh
bash k3s/scripts/env.sh
docker-compose up -d
```

## TODO

1. 在 vboxfs 下，会有如下错误，需要在虚拟机中的 naivefs 中使用

```
ERROR: for k3s_server_1  Cannot start service server: OCI runtime create failed: container_linux.go:370: starting container process caused: process_linux.go:459: container init caused: rootfs_linux.go:59: mounting "/vagrant/github.com/exfly/cslab/selfhostsrv/k3s/airgap/k3s-v1.20.2-k3s1-airgap-images-amd64.tar" to rootfs at "/var/lib/docker/overlay2/b19cfe0e53d51e933e08e0dff36e72843cdbcd5725903fa4806deb93ee2313c1/merged/var/lib/rancher/k3s/agent/images/airgap/k3s-airgap-images-amd64.tar" caused: not a directory: unknown: Are you trying to mount a directory onto a file (or vice-versa)? Check if the specified host path exists and is the expected type
```
