#!/usr/bin/env bash
mkdir ./backup
docker run -it --name regbak --rm -v registry_registry_volume:/volume -v $(pwd)/backup:/backup localhost:5000/alpine \
       tar -cjf /backup/registry.tar.bz2 -C /volume ./

