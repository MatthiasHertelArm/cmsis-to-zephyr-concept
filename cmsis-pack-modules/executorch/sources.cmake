# Generated from cmsis-ai/ML.clayer.yml — ExecuTorch Zephyr module
#
# Resolved CMSIS-Pack components:
#   PyTorch::Machine Learning:ExecuTorch:Runtime
#   PyTorch::Machine Learning:ExecuTorch:Kernel Utils
#   PyTorch::Machine Learning:ExecuTorch:Kernel Registration
#   PyTorch::Machine Learning:ExecuTorch:Backend EthosU
#   PyTorch::Machine Learning:ExecuTorch:Platform Bare-Metal
#   PyTorch::Machine Learning:ExecuTorch:Stubs RandomOps
#   PyTorch::Machine Learning:ExecuTorch:Operators Quantized quantize
#   PyTorch::Machine Learning:ExecuTorch:Operators Quantized dequantize
#   PyTorch::Machine Learning:ExecuTorch:Backend CortexM
#
# Pack: PyTorch::ExecuTorch@1.1.0-rc1-build.12

# Pack root — resolved via ML.clayer.yml path: ../../../packs/PyTorch.ExecuTorch.1.1.0-rc1-build.12
cmake_path(SET _ET_PACK NORMALIZE "${CMAKE_CURRENT_LIST_DIR}/../../../packs/PyTorch.ExecuTorch.1.1.0-rc1-build.12")

if(NOT EXISTS "${_ET_PACK}/PyTorch.ExecuTorch.pdsc")
  # Fallback: try CMSIS_PACK_ROOT
  if(DEFINED ENV{CMSIS_PACK_ROOT})
    set(_ET_PACK "$ENV{CMSIS_PACK_ROOT}/PyTorch/ExecuTorch/1.1.0-rc1-build.12")
  else()
    message(FATAL_ERROR "ExecuTorch pack not found. Set pack path or CMSIS_PACK_ROOT.")
  endif()
endif()

# ── Global pre-include defines (from PDSC Pre_Include_Global_h) ─────────────
zephyr_compile_definitions(
  C10_USING_CUSTOM_GENERATED_MACROS
  FLATBUFFERS_MAX_ALIGNMENT=1024
  FLATBUFFERS_LOCALE_INDEPENDENT=0
)

# RTE_Components.h (CMSIS-Pack component selection header)
zephyr_include_directories(
  ${CMAKE_CURRENT_LIST_DIR}
)

# ── ExecuTorch Runtime ──────────────────────────────────────────────────────
if(CONFIG_CMSIS_EXECUTORCH_RUNTIME)

  zephyr_library_named(executorch_runtime)

  zephyr_library_sources(
    ${_ET_PACK}/src/runtime/backend/interface.cpp
    ${_ET_PACK}/src/runtime/core/evalue.cpp
    ${_ET_PACK}/src/runtime/core/exec_aten/util/tensor_shape_to_c_string.cpp
    ${_ET_PACK}/src/runtime/core/exec_aten/util/tensor_util_portable.cpp
    ${_ET_PACK}/src/runtime/core/portable_type/tensor_impl.cpp
    ${_ET_PACK}/src/runtime/core/tag.cpp
    ${_ET_PACK}/src/runtime/core/tensor_layout.cpp
    ${_ET_PACK}/src/runtime/executor/method.cpp
    ${_ET_PACK}/src/runtime/executor/method_meta.cpp
    ${_ET_PACK}/src/runtime/executor/program.cpp
    ${_ET_PACK}/src/runtime/executor/pte_data_map.cpp
    ${_ET_PACK}/src/runtime/executor/tensor_parser_exec_aten.cpp
    ${_ET_PACK}/src/runtime/executor/tensor_parser_portable.cpp
    ${_ET_PACK}/src/runtime/kernel/operator_registry.cpp
    ${_ET_PACK}/src/runtime/platform/abort.cpp
    ${_ET_PACK}/src/runtime/platform/default/minimal.cpp
    ${_ET_PACK}/src/runtime/platform/log.cpp
    ${_ET_PACK}/src/runtime/platform/platform.cpp
    ${_ET_PACK}/src/runtime/platform/profiler.cpp
    ${_ET_PACK}/src/runtime/platform/runtime.cpp
    ${_ET_PACK}/src/schema/extended_header.cpp
  )

  zephyr_include_directories(
    ${_ET_PACK}/include
  )

  zephyr_compile_definitions(
    ET_LOG_ENABLED=0
  )

  zephyr_library_compile_options(-std=c++17 -fno-rtti -fno-exceptions)

endif()

# ── Kernel Utils ────────────────────────────────────────────────────────────
if(CONFIG_CMSIS_EXECUTORCH_KERNEL_UTILS)

  zephyr_library_named(executorch_kernel_utils)

  zephyr_library_sources(
    ${_ET_PACK}/src/kernels/portable/cpu/util/activation_ops_util.cpp
    ${_ET_PACK}/src/kernels/portable/cpu/util/advanced_index_util.cpp
    ${_ET_PACK}/src/kernels/portable/cpu/util/arange_util.cpp
    ${_ET_PACK}/src/kernels/portable/cpu/util/broadcast_util.cpp
    ${_ET_PACK}/src/kernels/portable/cpu/util/copy_ops_util.cpp
    ${_ET_PACK}/src/kernels/portable/cpu/util/delinearize_index.cpp
    ${_ET_PACK}/src/kernels/portable/cpu/util/distance_util.cpp
    ${_ET_PACK}/src/kernels/portable/cpu/util/dtype_util.cpp
    ${_ET_PACK}/src/kernels/portable/cpu/util/grid_sampler_2d_util.cpp
    ${_ET_PACK}/src/kernels/portable/cpu/util/index_util.cpp
    ${_ET_PACK}/src/kernels/portable/cpu/util/kernel_ops_util.cpp
    ${_ET_PACK}/src/kernels/portable/cpu/util/matmul_ops_util.cpp
    ${_ET_PACK}/src/kernels/portable/cpu/util/normalization_ops_util.cpp
    ${_ET_PACK}/src/kernels/portable/cpu/util/padding_util.cpp
    ${_ET_PACK}/src/kernels/portable/cpu/util/reduce_util.cpp
    ${_ET_PACK}/src/kernels/portable/cpu/util/repeat_util.cpp
    ${_ET_PACK}/src/kernels/portable/cpu/util/select_copy_util.cpp
    ${_ET_PACK}/src/kernels/portable/cpu/util/slice_util.cpp
    ${_ET_PACK}/src/kernels/portable/cpu/util/stack_util.cpp
    ${_ET_PACK}/src/kernels/portable/cpu/util/upsample_util.cpp
  )

  zephyr_include_directories(
    ${_ET_PACK}/include
  )

  zephyr_library_compile_options(-std=c++17 -fno-rtti -fno-exceptions)

endif()

# ── Kernel Registration ─────────────────────────────────────────────────────
if(CONFIG_CMSIS_EXECUTORCH_KERNEL_REGISTRATION)

  zephyr_library_named(executorch_kernel_reg)

  zephyr_library_sources(
    ${_ET_PACK}/src/registration/RegisterAllKernels.cpp
  )

  zephyr_include_directories(
    ${_ET_PACK}/include
  )

  zephyr_library_compile_options(-std=c++17 -fno-rtti -fno-exceptions)

endif()

# ── Backend EthosU ──────────────────────────────────────────────────────────
if(CONFIG_CMSIS_EXECUTORCH_BACKEND_ETHOSU)

  zephyr_library_named(executorch_backend_ethosu)

  zephyr_library_sources(
    ${_ET_PACK}/src/backends/arm/runtime/EthosUBackend.cpp
    ${_ET_PACK}/src/backends/arm/runtime/VelaBinStream.cpp
  )

  zephyr_include_directories(
    ${_ET_PACK}/include
  )

  # Ethos-U driver headers
  zephyr_include_directories(
    ${ZEPHYR_BASE}/../modules/hal/ethos_u/include
  )

  zephyr_compile_definitions(
    EXECUTORCH_BUILD_ARM_BAREMETAL=1
    ET_USE_ETHOS_U_BACKEND=1
  )

  zephyr_library_compile_options(-std=c++17 -fno-rtti -fno-exceptions)

endif()

# ── Platform Bare-Metal ─────────────────────────────────────────────────────
if(CONFIG_CMSIS_EXECUTORCH_PLATFORM_BARE_METAL)

  zephyr_library_named(executorch_platform_bm)

  zephyr_library_sources(
    ${_ET_PACK}/src/stubs/posix_stub.cpp
  )

  zephyr_include_directories(
    ${_ET_PACK}/include
  )

  zephyr_library_compile_options(-std=c++17 -fno-rtti -fno-exceptions)

endif()

# ── Stubs RandomOps ─────────────────────────────────────────────────────────
if(CONFIG_CMSIS_EXECUTORCH_STUBS_RANDOM)

  zephyr_library_named(executorch_stubs_random)

  zephyr_library_sources(
    ${_ET_PACK}/src/stubs/random_ops_stubs.cpp
  )

  zephyr_include_directories(
    ${_ET_PACK}/include
  )

  zephyr_library_compile_options(-std=c++17 -fno-rtti -fno-exceptions)

endif()

# ── Operators Quantized (quantize + dequantize) ─────────────────────────────
if(CONFIG_CMSIS_EXECUTORCH_OPS_QUANTIZED)

  zephyr_library_named(executorch_ops_quantized)

  zephyr_library_sources(
    ${_ET_PACK}/src/kernels/quantized/cpu/op_quantize.cpp
    ${_ET_PACK}/src/kernels/quantized/cpu/op_dequantize.cpp
  )

  zephyr_include_directories(
    ${_ET_PACK}/include
  )

  zephyr_library_compile_options(-std=c++17 -fno-rtti -fno-exceptions)

endif()

# ── Backend CortexM (CMSIS-NN optimized) ────────────────────────────────────
if(CONFIG_CMSIS_EXECUTORCH_BACKEND_CORTEXM)

  zephyr_library_named(executorch_backend_cortexm)

  zephyr_library_sources(
    ${_ET_PACK}/src/backends/cortex_m/ops/op_dequantize_per_tensor.cpp
    ${_ET_PACK}/src/backends/cortex_m/ops/op_maximum.cpp
    ${_ET_PACK}/src/backends/cortex_m/ops/op_minimum.cpp
    ${_ET_PACK}/src/backends/cortex_m/ops/op_quantize_per_tensor.cpp
    ${_ET_PACK}/src/backends/cortex_m/ops/op_quantized_add.cpp
    ${_ET_PACK}/src/backends/cortex_m/ops/op_quantized_avg_pool2d.cpp
    ${_ET_PACK}/src/backends/cortex_m/ops/op_quantized_conv2d.cpp
    ${_ET_PACK}/src/backends/cortex_m/ops/op_quantized_depthwise_conv2d.cpp
    ${_ET_PACK}/src/backends/cortex_m/ops/op_quantized_linear.cpp
    ${_ET_PACK}/src/backends/cortex_m/ops/op_quantized_mul.cpp
    ${_ET_PACK}/src/backends/cortex_m/ops/op_softmax.cpp
    ${_ET_PACK}/src/backends/cortex_m/ops/op_transpose.cpp
  )

  zephyr_include_directories(
    ${_ET_PACK}/include
  )

  # CMSIS-NN headers
  zephyr_include_directories(
    ${ZEPHYR_BASE}/../modules/lib/cmsis-nn/Include
  )

  zephyr_compile_definitions(
    EXECUTORCH_BUILD_CORTEX_M=1
  )

  zephyr_library_compile_options(-std=c++17 -fno-rtti -fno-exceptions)

endif()
