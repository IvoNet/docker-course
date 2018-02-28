# Registry

A local Docker registry 

## run

```bash
docker-compose up -d
```

## First time

The first time as preparation for the course run the `init.sh` command on a good network.
This will download and push the needed images to the local registry

## Cleanup

To cleanup the whole registry just run:

```bash
docker-compose down -v
#or
teardown.sh
```

# examples

## backup.sh

Will backup the docker regitry volume to a backup folder

## restore.sh

Will restore the created backup to the volume.

## show.sh

Will show all the images in the registry through a trick.