# Generated from cmsis-pack-modules/cmsis-nn.clayer.yml — CMSIS-NN Zephyr module
#
# Resolved CMSIS-Pack component:
#   ARM::CMSIS:NN Lib
#
# Pack: ARM::CMSIS-NN

# Pack root — resolved via cmsis-nn.clayer.yml path
cmake_path(SET _NN_PACK NORMALIZE "${CMAKE_CURRENT_LIST_DIR}/../../modules/lib/cmsis-nn")

if(NOT EXISTS "${_NN_PACK}/ARM.CMSIS-NN.pdsc")
  message(FATAL_ERROR "CMSIS-NN pack not found at ${_NN_PACK}.")
endif()

# RTE_Components.h (CMSIS-Pack component selection header)
zephyr_include_directories(
  ${CMAKE_CURRENT_LIST_DIR}
)

# Public include directory
zephyr_include_directories(
  ${_NN_PACK}/Include
)

# ── Activation Functions ────────────────────────────────────────────────────
if(CONFIG_CMSIS_NN_ACTIVATION)

  zephyr_library_named(cmsis_nn_activation)

  zephyr_library_sources(
    ${_NN_PACK}/Source/ActivationFunctions/arm_nn_activation_s16.c
    ${_NN_PACK}/Source/ActivationFunctions/arm_relu6_s8.c
    ${_NN_PACK}/Source/ActivationFunctions/arm_relu_q15.c
    ${_NN_PACK}/Source/ActivationFunctions/arm_relu_q7.c
  )

endif()

# ── Basic Math Functions ────────────────────────────────────────────────────
if(CONFIG_CMSIS_NN_BASICMATH)

  zephyr_library_named(cmsis_nn_basicmath)

  zephyr_library_sources(
    ${_NN_PACK}/Source/BasicMathFunctions/arm_elementwise_add_s16.c
    ${_NN_PACK}/Source/BasicMathFunctions/arm_elementwise_add_s8.c
    ${_NN_PACK}/Source/BasicMathFunctions/arm_elementwise_mul_acc_s16.c
    ${_NN_PACK}/Source/BasicMathFunctions/arm_elementwise_mul_s16.c
    ${_NN_PACK}/Source/BasicMathFunctions/arm_elementwise_mul_s16_batch_offset.c
    ${_NN_PACK}/Source/BasicMathFunctions/arm_elementwise_mul_s16_s8.c
    ${_NN_PACK}/Source/BasicMathFunctions/arm_elementwise_mul_s8.c
    ${_NN_PACK}/Source/BasicMathFunctions/arm_maximum_s8.c
    ${_NN_PACK}/Source/BasicMathFunctions/arm_minimum_s8.c
  )

endif()

# ── Concatenation Functions ─────────────────────────────────────────────────
if(CONFIG_CMSIS_NN_CONCATENATION)

  zephyr_library_named(cmsis_nn_concatenation)

  zephyr_library_sources(
    ${_NN_PACK}/Source/ConcatenationFunctions/arm_concatenation_s8_w.c
    ${_NN_PACK}/Source/ConcatenationFunctions/arm_concatenation_s8_x.c
    ${_NN_PACK}/Source/ConcatenationFunctions/arm_concatenation_s8_y.c
    ${_NN_PACK}/Source/ConcatenationFunctions/arm_concatenation_s8_z.c
  )

endif()

# ── Convolution Functions ───────────────────────────────────────────────────
if(CONFIG_CMSIS_NN_CONVOLUTION)

  zephyr_library_named(cmsis_nn_convolution)

  zephyr_library_sources(
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_convolve_1_x_n_s4.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_convolve_1_x_n_s8.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_convolve_1x1_s4.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_convolve_1x1_s4_fast.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_convolve_1x1_s8.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_convolve_1x1_s8_fast.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_convolve_even_s4.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_convolve_get_buffer_sizes_s16.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_convolve_get_buffer_sizes_s4.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_convolve_get_buffer_sizes_s8.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_convolve_s16.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_convolve_s4.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_convolve_s8.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_convolve_wrapper_s16.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_convolve_wrapper_s4.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_convolve_wrapper_s8.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_depthwise_conv_3x3_s8.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_depthwise_conv_fast_s16.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_depthwise_conv_get_buffer_sizes_s16.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_depthwise_conv_get_buffer_sizes_s4.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_depthwise_conv_get_buffer_sizes_s8.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_depthwise_conv_s16.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_depthwise_conv_s4.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_depthwise_conv_s4_opt.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_depthwise_conv_s8.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_depthwise_conv_s8_opt.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_depthwise_conv_wrapper_s16.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_depthwise_conv_wrapper_s4.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_depthwise_conv_wrapper_s8.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_nn_depthwise_conv_s8_core.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_nn_mat_mult_kernel_row_offset_s8_s16.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_nn_mat_mult_kernel_s16.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_nn_mat_mult_kernel_s4_s16.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_nn_mat_mult_kernel_s8_s16.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_nn_mat_mult_s8.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_transpose_conv_get_buffer_sizes_s8.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_transpose_conv_s8.c
    ${_NN_PACK}/Source/ConvolutionFunctions/arm_transpose_conv_wrapper_s8.c
  )

endif()

# ── Fully Connected Functions ───────────────────────────────────────────────
if(CONFIG_CMSIS_NN_FULLYCONNECTED)

  zephyr_library_named(cmsis_nn_fullyconnected)

  zephyr_library_sources(
    ${_NN_PACK}/Source/FullyConnectedFunctions/arm_batch_matmul_s16.c
    ${_NN_PACK}/Source/FullyConnectedFunctions/arm_batch_matmul_s8.c
    ${_NN_PACK}/Source/FullyConnectedFunctions/arm_fully_connected_get_buffer_sizes_s16.c
    ${_NN_PACK}/Source/FullyConnectedFunctions/arm_fully_connected_get_buffer_sizes_s8.c
    ${_NN_PACK}/Source/FullyConnectedFunctions/arm_fully_connected_per_channel_s8.c
    ${_NN_PACK}/Source/FullyConnectedFunctions/arm_fully_connected_s16.c
    ${_NN_PACK}/Source/FullyConnectedFunctions/arm_fully_connected_s4.c
    ${_NN_PACK}/Source/FullyConnectedFunctions/arm_fully_connected_s8.c
    ${_NN_PACK}/Source/FullyConnectedFunctions/arm_fully_connected_wrapper_s8.c
    ${_NN_PACK}/Source/FullyConnectedFunctions/arm_vector_sum_s8.c
    ${_NN_PACK}/Source/FullyConnectedFunctions/arm_vector_sum_s8_s64.c
  )

endif()

# ── LSTM Functions ──────────────────────────────────────────────────────────
if(CONFIG_CMSIS_NN_LSTM)

  zephyr_library_named(cmsis_nn_lstm)

  zephyr_library_sources(
    ${_NN_PACK}/Source/LSTMFunctions/arm_lstm_unidirectional_s16.c
    ${_NN_PACK}/Source/LSTMFunctions/arm_lstm_unidirectional_s8.c
  )

endif()

# ── Pooling Functions ───────────────────────────────────────────────────────
if(CONFIG_CMSIS_NN_POOLING)

  zephyr_library_named(cmsis_nn_pooling)

  zephyr_library_sources(
    ${_NN_PACK}/Source/PoolingFunctions/arm_avgpool_get_buffer_sizes_s16.c
    ${_NN_PACK}/Source/PoolingFunctions/arm_avgpool_get_buffer_sizes_s8.c
    ${_NN_PACK}/Source/PoolingFunctions/arm_avgpool_s16.c
    ${_NN_PACK}/Source/PoolingFunctions/arm_avgpool_s8.c
    ${_NN_PACK}/Source/PoolingFunctions/arm_max_pool_s16.c
    ${_NN_PACK}/Source/PoolingFunctions/arm_max_pool_s8.c
  )

endif()

# ── Softmax Functions ───────────────────────────────────────────────────────
if(CONFIG_CMSIS_NN_SOFTMAX)

  zephyr_library_named(cmsis_nn_softmax)

  zephyr_library_sources(
    ${_NN_PACK}/Source/SoftmaxFunctions/arm_nn_softmax_common_s8.c
    ${_NN_PACK}/Source/SoftmaxFunctions/arm_softmax_s16.c
    ${_NN_PACK}/Source/SoftmaxFunctions/arm_softmax_s8.c
    ${_NN_PACK}/Source/SoftmaxFunctions/arm_softmax_s8_s16.c
    ${_NN_PACK}/Source/SoftmaxFunctions/arm_softmax_u8.c
  )

endif()

# ── SVDF Functions ──────────────────────────────────────────────────────────
if(CONFIG_CMSIS_NN_SVDF)

  zephyr_library_named(cmsis_nn_svdf)

  zephyr_library_sources(
    ${_NN_PACK}/Source/SVDFunctions/arm_svdf_get_buffer_sizes_s8.c
    ${_NN_PACK}/Source/SVDFunctions/arm_svdf_s8.c
    ${_NN_PACK}/Source/SVDFunctions/arm_svdf_state_s16_s8.c
  )

endif()

# ── Reshape Functions ───────────────────────────────────────────────────────
if(CONFIG_CMSIS_NN_RESHAPE)

  zephyr_library_named(cmsis_nn_reshape)

  zephyr_library_sources(
    ${_NN_PACK}/Source/ReshapeFunctions/arm_reshape_s8.c
  )

endif()

# ── Transpose Functions ─────────────────────────────────────────────────────
if(CONFIG_CMSIS_NN_TRANSPOSE)

  zephyr_library_named(cmsis_nn_transpose)

  zephyr_library_sources(
    ${_NN_PACK}/Source/TransposeFunctions/arm_transpose_s8.c
  )

endif()

# ── Pad Functions ───────────────────────────────────────────────────────────
if(CONFIG_CMSIS_NN_PAD)

  zephyr_library_named(cmsis_nn_pad)

  zephyr_library_sources(
    ${_NN_PACK}/Source/PadFunctions/arm_pad_s8.c
  )

endif()

# ── NN Support Functions ────────────────────────────────────────────────────
if(CONFIG_CMSIS_NN_SUPPORT)

  zephyr_library_named(cmsis_nn_support)

  zephyr_library_sources(
    ${_NN_PACK}/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_padded_s8.c
    ${_NN_PACK}/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_s16.c
    ${_NN_PACK}/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_s4.c
    ${_NN_PACK}/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_s8.c
    ${_NN_PACK}/Source/NNSupportFunctions/arm_nn_lstm_calculate_gate_s16.c
    ${_NN_PACK}/Source/NNSupportFunctions/arm_nn_lstm_calculate_gate_s8_s16.c
    ${_NN_PACK}/Source/NNSupportFunctions/arm_nn_lstm_step_s16.c
    ${_NN_PACK}/Source/NNSupportFunctions/arm_nn_lstm_step_s8.c
    ${_NN_PACK}/Source/NNSupportFunctions/arm_nn_mat_mul_core_1x_s4.c
    ${_NN_PACK}/Source/NNSupportFunctions/arm_nn_mat_mul_core_1x_s8.c
    ${_NN_PACK}/Source/NNSupportFunctions/arm_nn_mat_mul_core_4x_s8.c
    ${_NN_PACK}/Source/NNSupportFunctions/arm_nn_mat_mult_nt_interleaved_t_even_s4.c
    ${_NN_PACK}/Source/NNSupportFunctions/arm_nn_mat_mult_nt_t_s16.c
    ${_NN_PACK}/Source/NNSupportFunctions/arm_nn_mat_mult_nt_t_s4.c
    ${_NN_PACK}/Source/NNSupportFunctions/arm_nn_mat_mult_nt_t_s8.c
    ${_NN_PACK}/Source/NNSupportFunctions/arm_nn_mat_mult_nt_t_s8_s32.c
    ${_NN_PACK}/Source/NNSupportFunctions/arm_nn_transpose_conv_row_s8_s32.c
    ${_NN_PACK}/Source/NNSupportFunctions/arm_nn_vec_mat_mul_result_acc_s16.c
    ${_NN_PACK}/Source/NNSupportFunctions/arm_nn_vec_mat_mul_result_acc_s8_s16.c
    ${_NN_PACK}/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_per_ch_s8.c
    ${_NN_PACK}/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_s16.c
    ${_NN_PACK}/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_s16_s16.c
    ${_NN_PACK}/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_s4.c
    ${_NN_PACK}/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_s8.c
    ${_NN_PACK}/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_svdf_s8.c
    ${_NN_PACK}/Source/NNSupportFunctions/arm_nntables.c
    ${_NN_PACK}/Source/NNSupportFunctions/arm_q7_to_q15_with_offset.c
    ${_NN_PACK}/Source/NNSupportFunctions/arm_s8_to_s16_unordered_with_offset.c
  )

endif()
