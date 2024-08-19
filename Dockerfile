# Base image selection
ARG BASE_OSG_SERIES=23
ARG BASE_YUM_REPO=testing
ARG BASE_OS=el9

FROM opensciencegrid/software-base:${BASE_OSG_SERIES}-${BASE_OS}-${BASE_YUM_REPO}

RUN yum install -y wget perl-File-Copy python3-condor ca-certificates

#RUN groupadd -r condor && useradd -r -g condor -m -d /home/condor -s /bin/bash condor

WORKDIR /home/condor

#COPY ./wrapper /home/condor/wrapper

COPY ./glidein_startup.sh /home/condor/glidein_startup.sh
COPY ./container_startup.sh /home/condor/container_startup.sh
#COPY ./glidein_wrapper /home/condor/glidein_wrapper

# ADD https://raw.githubusercontent.com/glideinWMS/glideinwms/master/tools/manual_glidein_startup /home/condor/manual_glidein_startup.sh
COPY ./manual_glidein_startup /home/condor/manual_glidein_startup.sh

RUN chown -R condor:condor /home/condor && \
    chmod 755 /home/condor/container_startup.sh /home/condor/glidein_startup.sh /home/condor/manual_glidein_startup.sh


USER condor
CMD [ "/home/condor/container_startup.sh" ]


