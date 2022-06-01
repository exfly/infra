FROM python:2.7-slim AS base

RUN sed -E -i -e 's/(archive|ports).ubuntu.com/mirrors.aliyun.com/g' -e '/security.ubuntu.com/d' /etc/apt/sources.list \
	&& apt update \
	&& apt install --fix-missing -y gcc curl tzdata rsync netcat tmux \
	&& rm -rf /var/lib/apt/lists/* \
	&& ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

WORKDIR /app
COPY requirements.txt /app/
RUN pip install --no-cache-dir -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt

WORKDIR /app

ENV PYTHONPATH=/usr/local/lib/python3.9/site-packages
# /usr/local/lib/python3.9/dist-packages/

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

CMD [".venv/bin/python", "main.py"]
