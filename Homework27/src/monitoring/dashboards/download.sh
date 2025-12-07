#!/bin/bash

download() {
  id=$1
  rev=$2
  name=$3

  echo "Downloading $name (ID=$id, rev=$rev)"
  curl -fsSL "https://grafana.com/api/dashboards/$id/revisions/$rev/download" -o "$name.json"
}

download 1860 27 node-exporter-full
download 15172 1 docker-host-overview
download 14282 1 cadvisor
echo "Done."

