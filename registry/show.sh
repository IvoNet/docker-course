#!/usr/bin/env bash
docker run -v registry_registry_volume:/volume 0.0.0.0:5000/alpine ls /volume/docker/registry/v2/repositories