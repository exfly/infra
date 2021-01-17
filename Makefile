docker-compose ?= docker-compose
docker ?= docker

dep:
	${docker} network create selfhostsrv || true
.PHONY: dep

minio:
	${docker-compose} -f minio/minio.yaml up -d
.PHONY: minio

gitlab:
	${docker-compose} -f gitlab/gitlab.yaml up -d
.PHONY: gitlab

registry:
	${docker-compose} -f registry/registry.yml up -d
.PHONY: registry

grafana:
	${docker-compose} -f monitor/grafana.yaml up -d
.PHONY: grafana

loki: grafana
	docker-compose -f monitor/loki.yaml up -d
.PHONY: loki

netdata:
	${docker-compose} -f monitor/netdata.yaml up -d
.PHONY: netdata

prometheus: grafana
	${docker-compose} -f monitor/prometheus.yaml up -d
.PHONY: prometheus

opentracing:
	${docker-compose} -f monitor/opentracing.yaml up -d
.PHONY: opentracing
