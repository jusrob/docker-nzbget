# docker-nzbget

This is just a docker container for nzbget usenet download tool.

It is setup to store the config file in the /data volume.  I set mine up with /data as my maindir and then mount my nas under /mnt/media and have it move my completed downloads to it.  This works really well for my setup.

```docker run --name="nzbget" --publish=6789:6789 --volume=/data/warehouse/nzbget:/data --volume=/mnt/media:/mnt/media --restart="always" --detach=true jusrob/nzbget```
