FROM ubuntu:trusty
#FROM java:openjdk-7

MAINTAINER Thomas Spellman <thos37@gmail.com>

# Add a repo where OpenJDK can be found.
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update

# Auto-accept the Oracle JDK license
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y oracle-java8-installer
RUN apt-get install -y unzip curl

ENV DATOMIC_VERSION 0.9.5302

RUN curl -L -o /tmp/datomic.zip https://my.datomic.com/downloads/free/${DATOMIC_VERSION}
#ADD https://my.datomic.com/downloads/free/${DATOMIC_VERSION} /tmp/datomic.zip

RUN unzip /tmp/datomic.zip
RUN rm /tmp/datomic.zip

WORKDIR datomic-free-${DATOMIC_VERSION}

RUN cp config/samples/free-transactor-template.properties transactor.properties

#RUN sed "s/host=localhost/host=0.0.0.0/" -i transactor.properties
#RUN sed "/host=0.0.0.0/a alt-host=datomicdb" -i transactor.properties
RUN sed "s/host=localhost/host=datomicdb/" -i transactor.properties
RUN sed "/host=datomicdb/a alt-host=127.0.0.1" -i transactor.properties

RUN sed "s/memory-index-max=256m/memory-index-max=128m/" -i transactor.properties

RUN mkdir /data
RUN sed "s/# data-dir=data/data-dir=\/data/" -i transactor.properties
VOLUME /data

RUN mkdir /log
RUN sed "s/# log-dir=log/log-dir=\/log/" -i transactor.properties
VOLUME /log

ADD start.sh ./
RUN chmod +x start.sh

EXPOSE 4334 4335 4336

ENV XMX=512m XMS=256m

CMD ["./start.sh"]
