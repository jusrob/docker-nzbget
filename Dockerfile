FROM ubuntu:latest
MAINTAINER jusrob <jrob48@gmail.com>

ENV LANG en_US.UTF-8
RUN locale-gen $LANG

RUN apt-get update -q  && \
    apt-get install wget -qy && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /var/tmp/*

RUN wget -O - http://nzbget.net/info/nzbget-version-linux.json | \
    sed -n "s/^.*stable-download.*: \"\(.*\)\".*/\1/p" | \
    wget --no-check-certificate -i - -O nzbget-latest-bin-linux.run || \
    echo "*** Download failed ***"

RUN sh nzbget-latest-bin-linux.run

ADD run.sh /run.sh

VOLUME ["/data"]
EXPOSE 6789

CMD ["/run.sh"]
