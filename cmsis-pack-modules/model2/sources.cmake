# Generated from model2.clayer.yml — Model 2 Zephyr module
#
# Resolved CMSIS-Pack components:
#   PyTorch::Machine Learning:ExecuTorch:Operators Portable add
#   PyTorch::Machine Learning:ExecuTorch:Operators Portable exp
#   PyTorch::Machine Learning:ExecuTorch:Operators Portable mul
#   PyTorch::Machine Learning:ExecuTorch:Operators Portable reciprocal
#   PyTorch::Machine Learning:ExecuTorch:Operators Portable sigmoid
#   PyTorch::Machine Learning:ExecuTorch:Operators Portable sum
#   PyTorch::Machine Learning:ExecuTorch:Operators Portable unsqueeze_copy
#   PyTorch::Machine Learning:ExecuTorch:Operators Quantized quantize
#   PyTorch::Machine Learning:ExecuTorch:Operators Quantized dequantize
#
# Pack: PyTorch::ExecuTorch@1.1.0-rc1-build.12

# Pack root — resolved via model2.clayer.yml path
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

# ── Operators Portable ──────────────────────────────────────────────────────
if(CONFIG_CMSIS_MODEL2_OPS_PORTABLE)

  zephyr_library_named(model2_ops_portable)

  zephyr_library_sources(
    ${_ET_PACK}/src/kernels/portable/cpu/op_add.cpp
    ${_ET_PACK}/src/kernels/portable/cpu/op_exp.cpp
    ${_ET_PACK}/src/kernels/portable/cpu/op_mul.cpp
    ${_ET_PACK}/src/kernels/portable/cpu/op_reciprocal.cpp
    ${_ET_PACK}/src/kernels/portable/cpu/op_sigmoid.cpp
    ${_ET_PACK}/src/kernels/portable/cpu/op_sum.cpp
    ${_ET_PACK}/src/kernels/portable/cpu/op_unsqueeze_copy.cpp
    ${_ET_PACK}/src/kernels/quantized/cpu/op_quantize.cpp
    ${_ET_PACK}/src/kernels/quantized/cpu/op_dequantize.cpp
  )

  zephyr_include_directories(
    ${_ET_PACK}/include
  )

  zephyr_library_compile_options(-std=c++17 -fno-rtti -fno-exceptions)

endif()
