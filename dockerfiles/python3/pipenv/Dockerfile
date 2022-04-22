# docker build -t tmp:dev-slim -f Dockerfile .
# docker run --rm -it --entrypoint=sh tmp:dev-slim
FROM python:3.9-slim AS base
FROM base AS builder

RUN pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple pipenv

WORKDIR /app
COPY Pipfile Pipfile.lock /app/
RUN bash -c 'PIPENV_VENV_IN_PROJECT=1 pipenv install --deploy'

FROM base

RUN sed -E -i -e 's/(archive|ports).ubuntu.com/mirrors.aliyun.com/g' -e '/security.ubuntu.com/d' /etc/apt/sources.list \
	&& apt update \
	&& apt install --fix-missing -y tzdata sshpass rsync netcat tmux \
	&& rm -rf /var/lib/apt/lists/* \
	&& ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

WORKDIR /app

COPY --from=builder /app /app/

# ENV PYTHONPATH=/usr/local/lib/python3.9/site-packages
# /usr/local/lib/python3.9/dist-packages/

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

ENV PATH="/app/.venv/bin:$PATH"

# CMD [".venv/bin/python", "main.py"]
