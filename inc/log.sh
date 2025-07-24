#!/bin/bash
file $LOG_FILE

function check_log {
    MDL_NAME=`less $LOG_FILE | grep "print_info: general.name" | cut -c 32-50`
    MDL_PARAMS=`less $LOG_FILE | grep "print_info: model params" | cut -c 32-50`
    MDL_ARCH=`less $LOG_FILE | grep "print_info: arch" | cut -c 32-50`
    MDL_TYPE=`less $LOG_FILE | grep "print_info: file type" | cut -c 27-50`
    MDL_SIZE=`less $LOG_FILE | grep  "print_info: file size" | cut -c 27-50 | cut -d "(" -f 1`
    MDL_BPW=`less $LOG_FILE | grep  "print_info: file size" | cut -c 27-50 | cut -d "(" -f 2 | cut -d ")" -f 1 `
    NGL=`less $LOG_FILE | grep  "load_tensors: offloaded" | cut -c 25-30 | cut -d "/" -f 1`
    NL=`less $LOG_FILE | grep  "load_tensors: offloaded" | cut -c 25-30 | cut -d "/" -f 2`
    CUDA=`less $LOG_FILE | grep  "load_tensors:        CUDA0 model buffer size" | cut -c 47-60 | cut -d "M" -f 1`
    CPU=`less $LOG_FILE | grep  "load_tensors:   CPU_Mapped model buffer size" | cut -c 47-60 | cut -d "M" -f 1`
    CUDA_KV=`less $LOG_FILE | grep  "llama_kv_cache_unified:      CUDA0 KV buffer size" | cut -c 52-60 | cut -d "M" -f 1`
    CPU_KV=`less $LOG_FILE | grep  "llama_kv_cache_unified:        CPU KV buffer size" | cut -c 52-60 | cut -d "M" -f 1`    
    CUDA_CB=`less $LOG_FILE | grep  "llama_context:      CUDA0 compute buffer size"| cut -c 48-60 | cut -d "M" -f 1`
    CUDA_HCB=`less $LOG_FILE | grep  "llama_context:  CUDA_Host compute buffer size"| cut -c 48-60 | cut -d "M" -f 1`
    PROM_T=`less $LOG_FILE | grep  "llama_perf_context_print: prompt eval time" | cut -c 46-60| cut -d "m" -f 1`
    PROM_TS=`less $LOG_FILE | grep  "llama_perf_context_print: prompt eval time" | cut -c 100-120| cut -d "t" -f 1`
    EVAL_T=`less $LOG_FILE | grep  "llama_perf_context_print:        eval time"| cut -c 46-60| cut -d "m" -f 1`
    EVAL_TS=`less $LOG_FILE | grep  "llama_perf_context_print:        eval time"| cut -c 100-120| cut -d "t" -f 1`    
    #Out of Memory/CUDA    
    CUDA_OOM=`less $LOG_FILE | grep  "ggml_backend_cuda_buffer_type_alloc_buffer:" | cut -c 55-100 | cut -d "M" -f 1`
}


function check_log_show {
    echo "MDL_NAME" `less $LOG_FILE | grep "print_info: general.name" | cut -c 32-50`
    echo "MDL_PARAMS" `less $LOG_FILE | grep "print_info: model params" | cut -c 32-50`
    echo "MDL_ARCH" `less $LOG_FILE | grep "print_info: arch" | cut -c 32-50`
    echo "MDL_TYPE" `less $LOG_FILE | grep "print_info: file type" | cut -c 27-50`
    echo "MDL_SIZE" `less $LOG_FILE | grep  "print_info: file size" | cut -c 27-50 | cut -d "(" -f 1`
    echo "MDL_BPW" `less $LOG_FILE | grep  "print_info: file size" | cut -c 27-50 | cut -d "(" -f 2 | cut -d ")" -f 1 `
    echo "NGL" `less $LOG_FILE | grep  "load_tensors: offloaded" | cut -c 25-30 | cut -d "/" -f 1`
    echo "NL " `less $LOG_FILE | grep  "load_tensors: offloaded" | cut -c 25-30 | cut -d "/" -f 2`
    echo "CUDA" `less $LOG_FILE | grep  "load_tensors:        CUDA0 model buffer size" | cut -c 47-60 | cut -d "M" -f 1`
    echo "CPU" `less $LOG_FILE | grep  "load_tensors:   CPU_Mapped model buffer size" | cut -c 47-60 | cut -d "M" -f 1`
    echo "CUDA_KV" `less $LOG_FILE | grep  "llama_kv_cache_unified:      CUDA0 KV buffer size" | cut -c 52-60 | cut -d "M" -f 1`
    echo "CPU_KV" `less $LOG_FILE | grep  "llama_kv_cache_unified:        CPU KV buffer size" | cut -c 52-60 | cut -d "M" -f 1`    
    echo "CUDA_CB" `less $LOG_FILE | grep  "llama_context:      CUDA0 compute buffer size"| cut -c 48-60 | cut -d "M" -f 1`
    echo "CUDA_HCB" `less $LOG_FILE | grep  "llama_context:  CUDA_Host compute buffer size"| cut -c 48-60 | cut -d "M" -f 1`
    echo "PROM_T" `less $LOG_FILE | grep  "llama_perf_context_print: prompt eval time" | cut -c 46-60| cut -d "m" -f 1`
    echo "PROM_TS" `less $LOG_FILE | grep  "llama_perf_context_print: prompt eval time" | cut -c 100-120| cut -d "t" -f 1`
    echo "EVAL_T" `less $LOG_FILE | grep  "llama_perf_context_print:        eval time"| cut -c 46-60| cut -d "m" -f 1`
    echo "EVAL_TS" `less $LOG_FILE | grep  "llama_perf_context_print:        eval time"| cut -c 100-120| cut -d "t" -f 1`    
    #Out of Memory/CUDA    
    echo "CUDA_OOM" `less $LOG_FILE | grep  "ggml_backend_cuda_buffer_type_alloc_buffer:" | cut -c 55-100 | cut -d "M" -f 1`
}

