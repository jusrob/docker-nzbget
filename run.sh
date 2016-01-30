#! /bin/sh

set -e

[ ! -f /data/nzbget.conf ] && cp /nzbget/webui/nzbget.conf.template /data/nzbget.conf

/nzbget/nzbget --configfile /data/nzbget.conf -s -o OutputMode=log
