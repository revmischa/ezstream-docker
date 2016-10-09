FROM revmischa/mp3:latest

RUN ["yum", "-y", "install", "gcc", "make", "libshout-devel", "libxml2-devel", "taglib-devel", "libvorbis-devel", "wget", "libid3tag-devel"]

RUN ["useradd", "-m", "streamer"]
WORKDIR /home/streamer
USER streamer
RUN ["wget", "http://downloads.xiph.org/releases/ezstream/ezstream-0.6.0.tar.gz"]
RUN ["tar", "-zxf", "ezstream-0.6.0.tar.gz"]
WORKDIR ezstream-0.6.0
RUN ["./configure"]
RUN ["make", "-j2"]
USER root
RUN ["make", "install"]
