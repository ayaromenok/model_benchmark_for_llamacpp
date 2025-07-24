#!/bin/bash
LOG_FILE="data/test/log_ok.txt"
source $(dirname "$0")/inc/log.sh
check_log
echo "Model" "Type" "NGL" "NL"	"CPU"  "GPU" "Promt t/s" "Eval t/s"
echo  $MDL_NAME $MDL_TYPE $NGL $NL $CPU_ALL $CUDA_ALL $PROM_TS $EVAL_TS

