#!/bin/bash
#Run the distiller pipeline
if [[ -z $1 ]]; then
        echo "Please supply the path to the configuration file"
        exit 1
fi
DISTILLER_NF="/mnt/data0/apps/pipelines/distiller/distiller.nf"
PARAMS_YML="$1" #Make sure you modify the dsired values / paths (default place for output paths is in distiller.nf location)
nohup nextflow run ${DISTILLER_NF} -params-file ${PARAMS_YML} &

