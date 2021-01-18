#!/bin/env sh

# export K3S_TOKEN=${RANDOM}${RANDOM}${RANDOM}
export K3S_TOKEN=841923225372
export KUBECONFIG="${PWD}/kubeconfig.yaml"
export K3S_VERSION=v1.20.2-k3s1
# export K3S_VERSION=v1.20.0-rc1+k3s1
export ISTIO_HOME="${PWD}/bin/istio-1.8.0"
export PATH="${PWD}/bin":"${ISTIO_HOME}/bin":$PATH

zsh

autoload -Uz compinit
compinit
source "${ISTIO_HOME}/tools/_istioctl"
source <(kubectl completion zsh)
