############################################################
# Dockerfile to build Pulsar container images
# Based on ubuntu 16.04
#############################################################

# Set the base image to official ubuntu 16.04
FROM ubuntu:16.04

# File Author / Maintainer
MAINTAINER Rafa Hernandez <https://github.com/fikipollo>

################## BEGIN INSTALLATION ######################

RUN apt-get update  \
    && apt-get install -y apt-utils vim python-dev python-pip curl wget libcurl4-gnutls-dev unzip rsync

RUN pip install --upgrade pip \
    && pip install virtualenv

RUN mkdir /usr/local/pulsar_dist \
    && cd /usr/local/pulsar_dist

RUN wget -O /tmp/pulsar.zip https://github.com/galaxyproject/pulsar/archive/master.zip
RUN unzip /tmp/pulsar.zip -d /tmp/pulsar \
    && mv /tmp/pulsar/*/* /usr/local/pulsar_dist/ \
    && rm -r /tmp/pulsar/ \
    && rm /tmp/pulsar.zip

RUN cd /usr/local/pulsar_dist \
    && virtualenv .venv \
    && . .venv/bin/activate \
    && pip install -r requirements.txt \
    && cp app.yml.sample app.yml \
    && mkdir dependencies \
    && sed -i 's/#private_token:/private_token :/g' app.yml \
    && sed -i 's/# dependency_resolvers_config_file:/dependency_resolvers_config_file :/g' app.yml \
    && sed -i 's/host = localhost/host = 0.0.0.0/g' server.ini.sample \
    && sed -i 's/PULSAR_CONFIG_DIR:-"."/PULSAR_CONFIG_DIR:-$PROJECT_DIRECTORY/g' scripts/pulsar

COPY configs/entrypoint.sh /usr/bin/entrypoint.sh
COPY configs/dependency_resolvers_conf.xml /usr/local/pulsar_dist/dependency_resolvers_conf.xml
COPY configs/app.yml /usr/local/pulsar_dist/app.yml

RUN chmod +x /usr/bin/entrypoint.sh

##################### INSTALLATION END #####################

VOLUME ["/usr/local/pulsar"]

EXPOSE 8913

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
