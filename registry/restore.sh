#!/usr/bin/env bash
docker run -it -v registry_registry_volume:/volume -v $(pwd)/backup:/backup localhost:5000/alpine \
       sh -c "rm -rf /volume/* /volume/..?* /volume/.[!.]* ; tar -C /volume/ -xjf /backup/registry.tar.bz2"