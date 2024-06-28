FROM ubuntu:trusty

RUN apt update
RUN apt install -y git-core wget build-essential
RUN git clone https://github.com/aolserver/aolserver.git

WORKDIR aolserver

RUN wget http://prdownloads.sourceforge.net/tcl/tcl8.4.11-src.tar.gz
RUN gunzip < tcl8.4.11-src.tar.gz | tar xvf -

WORKDIR tcl8.4.11/unix

RUN bash configure --prefix=/usr/local/aolserver --enable-threads
RUN make install

WORKDIR ../../

RUN cp examples/config/base.tcl /usr/local/aolserver/nsd.tcl

ENTRYPOINT exec /usr/local/aolserver/bin/tclsh8.4 /usr/local/aolserver/nsd.tcl
CMD []
