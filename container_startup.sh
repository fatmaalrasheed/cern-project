#!/bin/sh
#export TMPDIR=/tmp
export _CONDOR_SCRATCH_DIR=/tmp
echo "$TOKEN">credential_token.idtoken

CPUS=${CPUS:-4}
MEMORY=${MEMORY:-8192}
WALLTIME=${WALLTIME:-3600}
SITENAME=${SITENAME:-"MySite"}

# glidein_startup.sh command
#/home/condor/glidein_startup.sh 
echo $CPUS
./manual_glidein_startup.sh --wms-collector="vocms0204.cern.ch" --client-name="CMSG-ITB_gWMSFrontend-v1_0.main-vacuum" --req-name="CMSHTPC_T2_CH_CERN_P5@gfactory_instance@CERN-ITB-al9" --cmd-out-file="glidein_wrapper" --glidein-startup="./glidein_startup.sh" --override-args="-param_GLIDEIN_CMSSite $SITENAME -param_GLIDEIN_CPUS $CPUS -param_GLIDEIN_MaxMemMBs $MEMORY"


chmod +x glidein_wrapper
./glidein_wrapper
 
