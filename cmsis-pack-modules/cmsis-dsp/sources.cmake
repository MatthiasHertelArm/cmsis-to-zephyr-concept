# Generated from cmsis-pack-modules/cmsis-dsp.clayer.yml — CMSIS-DSP Zephyr module
#
# Resolved CMSIS-Pack component:
#   ARM::CMSIS:DSP:Source
#
# Pack: ARM::CMSIS-DSP

# Pack root — resolved via cmsis-dsp.clayer.yml path
cmake_path(SET _DSP_PACK NORMALIZE "${CMAKE_CURRENT_LIST_DIR}/../../modules/lib/cmsis-dsp")

if(NOT EXISTS "${_DSP_PACK}/ARM.CMSIS-DSP.pdsc")
  message(FATAL_ERROR "CMSIS-DSP pack not found at ${_DSP_PACK}.")
endif()

# RTE_Components.h (CMSIS-Pack component selection header)
zephyr_include_directories(
  ${CMAKE_CURRENT_LIST_DIR}
)

# Public include directories
zephyr_include_directories(
  ${_DSP_PACK}/Include
  ${_DSP_PACK}/PrivateInclude
)

# ── Basic Math Functions ────────────────────────────────────────────────────
if(CONFIG_CMSIS_DSP_BASICMATH)

  zephyr_library_named(cmsis_dsp_basicmath)

  zephyr_library_sources(
    ${_DSP_PACK}/Source/BasicMathFunctions/BasicMathFunctions.c
    ${_DSP_PACK}/Source/BasicMathFunctions/BasicMathFunctionsF16.c
  )

  zephyr_include_directories(
    ${_DSP_PACK}/Include
    ${_DSP_PACK}/PrivateInclude
  )

endif()

# ── Bayes Functions ─────────────────────────────────────────────────────────
if(CONFIG_CMSIS_DSP_BAYES)

  zephyr_library_named(cmsis_dsp_bayes)

  zephyr_library_sources(
    ${_DSP_PACK}/Source/BayesFunctions/BayesFunctions.c
    ${_DSP_PACK}/Source/BayesFunctions/BayesFunctionsF16.c
  )

  zephyr_include_directories(
    ${_DSP_PACK}/Include
    ${_DSP_PACK}/PrivateInclude
  )

endif()

# ── Common Tables ───────────────────────────────────────────────────────────
if(CONFIG_CMSIS_DSP_COMMONTABLES)

  zephyr_library_named(cmsis_dsp_commontables)

  zephyr_library_sources(
    ${_DSP_PACK}/Source/CommonTables/CommonTables.c
    ${_DSP_PACK}/Source/CommonTables/CommonTablesF16.c
  )

  zephyr_include_directories(
    ${_DSP_PACK}/Include
    ${_DSP_PACK}/PrivateInclude
  )

endif()

# ── Complex Math Functions ──────────────────────────────────────────────────
if(CONFIG_CMSIS_DSP_COMPLEXMATH)

  zephyr_library_named(cmsis_dsp_complexmath)

  zephyr_library_sources(
    ${_DSP_PACK}/Source/ComplexMathFunctions/ComplexMathFunctions.c
    ${_DSP_PACK}/Source/ComplexMathFunctions/ComplexMathFunctionsF16.c
  )

  zephyr_include_directories(
    ${_DSP_PACK}/Include
    ${_DSP_PACK}/PrivateInclude
  )

endif()

# ── Controller Functions ────────────────────────────────────────────────────
if(CONFIG_CMSIS_DSP_CONTROLLER)

  zephyr_library_named(cmsis_dsp_controller)

  zephyr_library_sources(
    ${_DSP_PACK}/Source/ControllerFunctions/ControllerFunctions.c
  )

  zephyr_include_directories(
    ${_DSP_PACK}/Include
    ${_DSP_PACK}/PrivateInclude
  )

endif()

# ── Distance Functions ──────────────────────────────────────────────────────
if(CONFIG_CMSIS_DSP_DISTANCE)

  zephyr_library_named(cmsis_dsp_distance)

  zephyr_library_sources(
    ${_DSP_PACK}/Source/DistanceFunctions/DistanceFunctions.c
    ${_DSP_PACK}/Source/DistanceFunctions/DistanceFunctionsF16.c
  )

  zephyr_include_directories(
    ${_DSP_PACK}/Include
    ${_DSP_PACK}/PrivateInclude
  )

endif()

# ── Fast Math Functions ─────────────────────────────────────────────────────
if(CONFIG_CMSIS_DSP_FASTMATH)

  zephyr_library_named(cmsis_dsp_fastmath)

  zephyr_library_sources(
    ${_DSP_PACK}/Source/FastMathFunctions/FastMathFunctions.c
    ${_DSP_PACK}/Source/FastMathFunctions/FastMathFunctionsF16.c
  )

  zephyr_include_directories(
    ${_DSP_PACK}/Include
    ${_DSP_PACK}/PrivateInclude
  )

endif()

# ── Filtering Functions ─────────────────────────────────────────────────────
if(CONFIG_CMSIS_DSP_FILTERING)

  zephyr_library_named(cmsis_dsp_filtering)

  zephyr_library_sources(
    ${_DSP_PACK}/Source/FilteringFunctions/FilteringFunctions.c
    ${_DSP_PACK}/Source/FilteringFunctions/FilteringFunctionsF16.c
  )

  zephyr_include_directories(
    ${_DSP_PACK}/Include
    ${_DSP_PACK}/PrivateInclude
  )

endif()

# ── Interpolation Functions ─────────────────────────────────────────────────
if(CONFIG_CMSIS_DSP_INTERPOLATION)

  zephyr_library_named(cmsis_dsp_interpolation)

  zephyr_library_sources(
    ${_DSP_PACK}/Source/InterpolationFunctions/InterpolationFunctions.c
    ${_DSP_PACK}/Source/InterpolationFunctions/InterpolationFunctionsF16.c
  )

  zephyr_include_directories(
    ${_DSP_PACK}/Include
    ${_DSP_PACK}/PrivateInclude
  )

endif()

# ── Matrix Functions ────────────────────────────────────────────────────────
if(CONFIG_CMSIS_DSP_MATRIX)

  zephyr_library_named(cmsis_dsp_matrix)

  zephyr_library_sources(
    ${_DSP_PACK}/Source/MatrixFunctions/MatrixFunctions.c
    ${_DSP_PACK}/Source/MatrixFunctions/MatrixFunctionsF16.c
  )

  zephyr_include_directories(
    ${_DSP_PACK}/Include
    ${_DSP_PACK}/PrivateInclude
  )

endif()

# ── Quaternion Math Functions ───────────────────────────────────────────────
if(CONFIG_CMSIS_DSP_QUATERNIONMATH)

  zephyr_library_named(cmsis_dsp_quaternionmath)

  zephyr_library_sources(
    ${_DSP_PACK}/Source/QuaternionMathFunctions/QuaternionMathFunctions.c
  )

  zephyr_include_directories(
    ${_DSP_PACK}/Include
    ${_DSP_PACK}/PrivateInclude
  )

endif()

# ── SVM Functions ───────────────────────────────────────────────────────────
if(CONFIG_CMSIS_DSP_SVM)

  zephyr_library_named(cmsis_dsp_svm)

  zephyr_library_sources(
    ${_DSP_PACK}/Source/SVMFunctions/SVMFunctions.c
    ${_DSP_PACK}/Source/SVMFunctions/SVMFunctionsF16.c
  )

  zephyr_include_directories(
    ${_DSP_PACK}/Include
    ${_DSP_PACK}/PrivateInclude
  )

endif()

# ── Statistics Functions ────────────────────────────────────────────────────
if(CONFIG_CMSIS_DSP_STATISTICS)

  zephyr_library_named(cmsis_dsp_statistics)

  zephyr_library_sources(
    ${_DSP_PACK}/Source/StatisticsFunctions/StatisticsFunctions.c
    ${_DSP_PACK}/Source/StatisticsFunctions/StatisticsFunctionsF16.c
  )

  zephyr_include_directories(
    ${_DSP_PACK}/Include
    ${_DSP_PACK}/PrivateInclude
  )

endif()

# ── Support Functions ───────────────────────────────────────────────────────
if(CONFIG_CMSIS_DSP_SUPPORT)

  zephyr_library_named(cmsis_dsp_support)

  zephyr_library_sources(
    ${_DSP_PACK}/Source/SupportFunctions/SupportFunctions.c
    ${_DSP_PACK}/Source/SupportFunctions/SupportFunctionsF16.c
  )

  zephyr_include_directories(
    ${_DSP_PACK}/Include
    ${_DSP_PACK}/PrivateInclude
  )

endif()

# ── Transform Functions ─────────────────────────────────────────────────────
if(CONFIG_CMSIS_DSP_TRANSFORM)

  zephyr_library_named(cmsis_dsp_transform)

  zephyr_library_sources(
    ${_DSP_PACK}/Source/TransformFunctions/TransformFunctions.c
    ${_DSP_PACK}/Source/TransformFunctions/TransformFunctionsF16.c
  )

  zephyr_include_directories(
    ${_DSP_PACK}/Include
    ${_DSP_PACK}/PrivateInclude
  )

endif()

# ── Window Functions ────────────────────────────────────────────────────────
if(CONFIG_CMSIS_DSP_WINDOW)

  zephyr_library_named(cmsis_dsp_window)

  zephyr_library_sources(
    ${_DSP_PACK}/Source/WindowFunctions/WindowFunctions.c
  )

  zephyr_include_directories(
    ${_DSP_PACK}/Include
    ${_DSP_PACK}/PrivateInclude
  )

endif()
