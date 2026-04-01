# ML Inference Example (CMSIS-Pack Components in Zephyr)

This example demonstrates how CMSIS-Pack middleware components (Executorch, CMSIS-NN, CMSIS-DSP) can be integrated into a Zephyr application as an external module.

## How it works

```
cmsis/executorch.clayer.yml     → declares which packs/components to use
        │
        ▼  (cbuild zephyr cmd)
cmsis-pack-modules/executorch/  → generated Zephyr external module
        │                        (module.yml, Kconfig, sources.cmake)
        ▼
ml_inference/CMakeLists.txt     → adds module via ZEPHYR_EXTRA_MODULES
        │
        ▼  (west build)
Zephyr picks up the module like any other
```

The application uses the LiteRT (TFLite Micro) runtime from a CMSIS-Pack, accelerated by CMSIS-NN optimized kernels. Source files stay in `$CMSIS_PACK_ROOT` — no vendoring, no duplication.

## Prerequisites

- Zephyr SDK installed ([setup guide](https://mdk-packs.github.io/vscode-cmsis-solution-docs/zephyr.html))
- CMSIS-Toolbox >= 2.13.0 in PATH
- Required packs installed:
  ```
  cpackget add tensorflow::tensorflow-lite-micro
  cpackget add ARM::CMSIS-NN
  cpackget add ARM::CMSIS-DSP
  cpackget add ARM::CMSIS
  ```

## Build

```bash
# Build for Corstone-320 FVP (Cortex-M55)
west build -b mps3/corstone320/an557 ml_inference

# Or via CMSIS solution:
cbuild zephyr.csolution.yml --context ml_inference.Debug+Corstone-320
```

## Run on FVP

```bash
FVP_Corstone_SSE-320 -a ml_inference/build/zephyr/zephyr.elf
```

## Files

| File | Description |
|---|---|
| `cmsis/ML.clayer.yml` | Declares CMSIS-Pack components (user input) |
| `cmsis-pack-modules/litert-ml/` | Generated Zephyr module (output of cbuild2zephyr) |
| `ml_inference/CMakeLists.txt` | Hooks the module via ZEPHYR_EXTRA_MODULES |
| `ml_inference/prj.conf` | Enables CONFIG_CMSIS_LITERT_ML=y |
| `ml_inference/src/main.c` | LiteRT MicroInterpreter inference loop |
| `ml_inference/src/model_data.c` | Model bytes (placeholder) |

## Regenerating the module

If `cmsis/ML.clayer.yml` changes (e.g. add a new component):

```bash
cbuild2zephyr \
  --clayer cmsis/ML.clayer.yml \
  --output-dir cmsis-pack-modules/litert-ml \
  --module-name litert-ml
```


