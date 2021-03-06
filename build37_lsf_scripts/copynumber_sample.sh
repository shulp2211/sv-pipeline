#!/bin/bash

set -eo pipefail

# DEPENDENCIES
# + svtools
# + bgzip
# + cnvnator-multi

BIN_DIR=$( dirname $0 )

# SET THE LOCATION OF THE thisroot.sh SHELL SCRIPT HERE:
THISROOTLOC="thisroot.sh"
source "$THISROOTLOC"

# SET SVTOOLS PATH HERE:
SVTOOLS="svtools"

# SET CNVNATOR PATH HERE:
CNVNATOR="cnvnator-multi"

# SET SAMPLE NAME TO PROCESS
INPUT_SAMPLE_NAME="$1"

# SET COORDINATE LIST FILE HERE:
INPUT_COORDINATES="$2"

# SET INPUT VCF PATH HERE:
INPUT_VCF="$3"

# SET CNVNATOR HISTOGRAM FILE HERE:
INPUT_ROOT_HIST="$4"

# SET OUTPUT FILE PATH HERE
OUTPUT="$5"

$SVTOOLS copynumber \
    --cnvnator $CNVNATOR \
    -s $INPUT_SAMPLE_NAME \
    -w 100 \
    -r $INPUT_ROOT_HIST \
    -c $INPUT_COORDINATES \
    -i $INPUT_VCF \
    | bgzip -c > $OUTPUT

