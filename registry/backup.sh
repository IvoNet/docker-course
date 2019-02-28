#!/usr/bin/env bash
docker run -it --rm -v registry_registry_volume:/volume -v $(pwd)/backup:/backup localhost:5000/alpine \
       tar -cjfv /backup/registry.tar.bz2 -C /volume ./

