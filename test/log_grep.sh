log_list=("../data/test/log_ok.txt")

for i in ${!log_list[@]}; do
  echo "element $i in ${log_list[$i]}"
done

for i in ${!log_list[@]}; do
    file ${log_list[$i]}
    less ${log_list[$i]} | grep "print_info: general.name"
    less ${log_list[$i]} | grep "print_info: model params"
    less ${log_list[$i]} | grep "print_info: arch"
    less ${log_list[$i]} | grep "print_info: file type"
    less ${log_list[$i]} | grep  "print_info: file size"
    less ${log_list[$i]} | grep  "load_tensors: offloaded"
    echo "NGL" `less ${log_list[$i]} | grep  "load_tensors: offloaded" | cut -c 25-30 | cut -d "/" -f 1`
    echo "NL " `less ${log_list[$i]} | grep  "load_tensors: offloaded" | cut -c 25-30 | cut -d "/" -f 2`
    less ${log_list[$i]} | grep  "load_tensors:        CUDA0 model buffer size"
    less ${log_list[$i]} | grep  "load_tensors:   CPU_Mapped model buffer size"
    less ${log_list[$i]} | grep  "llama_kv_cache_unified:      CUDA0 KV buffer size"
    less ${log_list[$i]} | grep  "llama_kv_cache_unified:        CPU KV buffer size"
    less ${log_list[$i]} | grep  "llama_context:      CUDA0 compute buffer size"
    less ${log_list[$i]} | grep  "llama_context:  CUDA_Host compute buffer size"
    less ${log_list[$i]} | grep  "llama_perf_context_print: prompt eval time"
    less ${log_list[$i]} | grep  "llama_perf_context_print:        eval time";
#Out of Memory/CUDA
    less ${log_list[$i]} | grep  "ggml_backend_cuda_buffer_type_alloc_buffer:"
done 