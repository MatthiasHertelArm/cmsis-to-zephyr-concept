/*
 * Copyright (c) 2026 Arm Limited
 * SPDX-License-Identifier: Apache-2.0
 *
 * Minimal ML inference example using ExecuTorch from CMSIS-Packs.
 *
 * The CMSIS-Pack components (ExecuTorch runtime, Ethos-U backend, Cortex-M
 * backend) are delivered as a Zephyr external module generated from
 * cmsis-ai/ML.clayer.yml. See cmsis-pack-modules/executorch-ml/.
 */

#include <stdio.h>
#include <zephyr/kernel.h>

#include <executorch/extension/data_loader/buffer_data_loader.h>
#include <executorch/runtime/executor/program.h>
#include <executorch/runtime/executor/method.h>
#include <executorch/runtime/executor/method_meta.h>
#include <executorch/runtime/platform/runtime.h>

/* Model data — ExecuTorch .pte embedded as a C array */
#include "model_pte.h"

using executorch::extension::BufferDataLoader;
using executorch::runtime::Program;
using executorch::runtime::Result;
using executorch::runtime::Error;
using executorch::runtime::MethodMeta;
using executorch::runtime::Method;

int main(void)
{
    printf("ML Inference Example (ExecuTorch from CMSIS-Pack)\n");

    /* Initialise the ExecuTorch runtime */
    executorch::runtime::runtime_init();

    /* Create a data loader that reads from the in-memory PTE blob */
    BufferDataLoader loader(model_pte, sizeof(model_pte));

    /* Load the ExecuTorch program */
    Result<Program> program_result = Program::load(&loader);
    if (!program_result.ok()) {
        printf("Program::load() failed: 0x%x\n", (unsigned)program_result.error());
        return -1;
    }
    Program &program = program_result.get();

    printf("ExecuTorch program loaded successfully (%u bytes)\n",
           (unsigned)sizeof(model_pte));
    printf("Number of methods: %u\n", (unsigned)program.num_methods());

    /* Query the "forward" method metadata */
    Result<MethodMeta> method_meta = program.method_meta("forward");
    if (!method_meta.ok()) {
        printf("method_meta(\"forward\") failed: 0x%x\n",
               (unsigned)method_meta.error());
        return -1;
    }

    printf("Method 'forward': %u inputs, %u outputs\n",
           (unsigned)method_meta->num_inputs(),
           (unsigned)method_meta->num_outputs());

    printf("Inference setup complete.\n");
    return 0;
}
