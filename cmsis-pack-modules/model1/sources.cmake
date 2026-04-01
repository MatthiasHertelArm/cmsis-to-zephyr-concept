# Generated from model1.clayer.yml — Model 1 Zephyr module
#
# Resolved CMSIS-Pack components:
#   PyTorch::Machine Learning:ExecuTorch:Operators Quantized quantize
#   PyTorch::Machine Learning:ExecuTorch:Operators Quantized dequantize
#
# Pack: PyTorch::ExecuTorch@1.1.0-rc1-build.12

# Pack root — resolved via model1.clayer.yml path
cmake_path(SET _ET_PACK NORMALIZE "${CMAKE_CURRENT_LIST_DIR}/../../../packs/PyTorch.ExecuTorch.1.1.0-rc1-build.12")

if(NOT EXISTS "${_ET_PACK}/PyTorch.ExecuTorch.pdsc")
  # Fallback: try CMSIS_PACK_ROOT
  if(DEFINED ENV{CMSIS_PACK_ROOT})
    set(_ET_PACK "$ENV{CMSIS_PACK_ROOT}/PyTorch/ExecuTorch/1.1.0-rc1-build.12")
  else()
    message(FATAL_ERROR "ExecuTorch pack not found. Set pack path or CMSIS_PACK_ROOT.")
  endif()
endif()

# RTE_Components.h
zephyr_include_directories(
  ${CMAKE_CURRENT_LIST_DIR}
)

# ── Operators Quantized (quantize + dequantize) ─────────────────────────────
if(CONFIG_CMSIS_MODEL1_OPS_QUANTIZED)

  zephyr_library_named(model1_ops_quantized)

  zephyr_library_sources(
    ${_ET_PACK}/src/kernels/quantized/cpu/op_quantize.cpp
    ${_ET_PACK}/src/kernels/quantized/cpu/op_dequantize.cpp
  )

  zephyr_include_directories(
    ${_ET_PACK}/include
  )

  zephyr_library_compile_options(-std=c++17 -fno-rtti -fno-exceptions)

endif()
