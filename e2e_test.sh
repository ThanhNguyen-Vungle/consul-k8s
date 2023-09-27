#!/bin/bash
kubectx kind-dc1
make control-plane-dev-docker
docker tag consul-k8s-control-plane-dev thanhnguyenvungle/consul-k8s-ha
docker push thanhnguyenvungle/consul-k8s-ha
helm upgrade --install --values minimal-consul-values.yaml consul ./charts/consul --create-namespace --namespace consul --debug
kubectl rollout restart deployment consul-sync-catalog
