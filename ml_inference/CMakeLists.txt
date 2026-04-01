# SPDX-License-Identifier: Apache-2.0

cmake_minimum_required(VERSION 3.20.0)

# Add CMSIS-Pack middleware components as a Zephyr external module.
# The module in cmsis-pack-modules/executorch-ml/ is generated from
# cmsis-ai/ML.clayer.yml. Sources reference files in the ExecuTorch pack.
list(APPEND ZEPHYR_EXTRA_MODULES
  ${CMAKE_CURRENT_SOURCE_DIR}/../cmsis-pack-modules/executorch
  ${CMAKE_CURRENT_SOURCE_DIR}/../cmsis-pack-modules/model1
  ${CMAKE_CURRENT_SOURCE_DIR}/../cmsis-pack-modules/model2
)

find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})
project(ml_inference)

target_sources(app PRIVATE src/main.cpp)

# Model data is included via model_pte.h from cmsis-ai/model/
target_include_directories(app PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../cmsis-ai/model)
