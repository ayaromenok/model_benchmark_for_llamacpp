#!/bin/bash
log_list=("../data/test/log_ok.txt")

for i in ${!log_list[@]}; do
  echo "element $i in ${log_list[$i]}"
done

for i in ${!log_list[@]}; do
    file ${log_list[$i]}
    echo "Name" `less ${log_list[$i]} | grep "print_info: general.name" | cut -c 32-50`
    echo "Params" `less ${log_list[$i]} | grep "print_info: model params" | cut -c 32-50`
    echo "arch" `less ${log_list[$i]} | grep "print_info: arch" | cut -c 32-50`
    echo "Type" `less ${log_list[$i]} | grep "print_info: file type" | cut -c 27-50`
    echo "Size" `less ${log_list[$i]} | grep  "print_info: file size" | cut -c 27-50 | cut -d "(" -f 1`
    echo "BpW" `less ${log_list[$i]} | grep  "print_info: file size" | cut -c 27-50 | cut -d "(" -f 2 | cut -d ")" -f 1 `
    echo "NGL" `less ${log_list[$i]} | grep  "load_tensors: offloaded" | cut -c 25-30 | cut -d "/" -f 1`
    echo "NL " `less ${log_list[$i]} | grep  "load_tensors: offloaded" | cut -c 25-30 | cut -d "/" -f 2`
    echo "CUDA" `less ${log_list[$i]} | grep  "load_tensors:        CUDA0 model buffer size" | cut -c 47-60 | cut -d "M" -f 1`
    echo "CPU" `less ${log_list[$i]} | grep  "load_tensors:   CPU_Mapped model buffer size" | cut -c 47-60 | cut -d "M" -f 1`
    echo "CUDA_KV" `less ${log_list[$i]} | grep  "llama_kv_cache_unified:      CUDA0 KV buffer size" | cut -c 52-60 | cut -d "M" -f 1`
    echo "CPU_KV" `less ${log_list[$i]} | grep  "llama_kv_cache_unified:        CPU KV buffer size" | cut -c 52-60 | cut -d "M" -f 1`    
    echo "CUDA_CB" `less ${log_list[$i]} | grep  "llama_context:      CUDA0 compute buffer size"| cut -c 48-60 | cut -d "M" -f 1`
    echo "CUDA_HCB" `less ${log_list[$i]} | grep  "llama_context:  CUDA_Host compute buffer size"| cut -c 48-60 | cut -d "M" -f 1`
    echo "PROM_T" `less ${log_list[$i]} | grep  "llama_perf_context_print: prompt eval time" | cut -c 46-60| cut -d "m" -f 1`
    echo "PROM_TS" `less ${log_list[$i]} | grep  "llama_perf_context_print: prompt eval time" | cut -c 100-120| cut -d "t" -f 1`
    echo "EVAL_T" `less ${log_list[$i]} | grep  "llama_perf_context_print:        eval time"| cut -c 46-60| cut -d "m" -f 1`
    echo "EVAL_TS" `less ${log_list[$i]} | grep  "llama_perf_context_print:        eval time"| cut -c 100-120| cut -d "t" -f 1`    
    #Out of Memory/CUDA
    less ${log_list[$i]} | grep  "ggml_backend_cuda_buffer_type_alloc_buffer:"
    echo "CUDA_OOM" `less ${log_list[$i]} | grep  "ggml_backend_cuda_buffer_type_alloc_buffer:" | cut -c 55-100 | cut -d "M" -f 1`
done 
