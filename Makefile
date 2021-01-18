docker-compose ?= docker-compose
docker ?= docker

dep:
	${docker} network create selfhostsrv || true
.PHONY: dep

base:
	${docker-compose} up -d
.PHONY: base

minio: base
	${docker-compose} -f minio/minio.yaml up -d
.PHONY: minio

gitlab: base
	${docker-compose} -f gitlab/gitlab.yaml up -d
.PHONY: gitlab

registry: base
	${docker-compose} -f registry/registry.yml up -d
.PHONY: registry

grafana: base
	${docker-compose} -f monitor/grafana.yaml up -d
.PHONY: grafana

loki: base grafana
	docker-compose -f monitor/loki.yaml up -d
.PHONY: loki

netdata: base
	${docker-compose} -f monitor/netdata.yaml up -d
.PHONY: netdata

prometheus: base grafana
	${docker-compose} -f monitor/prometheus.yaml up -d
.PHONY: prometheus

opentracing: base
	${docker-compose} -f monitor/opentracing.yaml up -d
.PHONY: opentracing
