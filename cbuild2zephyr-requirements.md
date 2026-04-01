# cbuild zephyr mode — Requirements

> **In short:** Given a `.clayer.yml` that declares CMSIS-Pack components,
> generate a self-contained [Zephyr external module](https://docs.zephyrproject.org/latest/develop/modules.html)
> (`CMakeLists.txt`, `Kconfig`, `sources.cmake`, `zephyr/module.yml`) that can
> be consumed by `west build` without any CMSIS tooling at build time.

## Inputs

| Input | Description |
|---|---|
| `.clayer.yml` | User-authored layer declaring packs and components to include |
| resolved `.cbuild.yml` | Component metadata after pack resolution (sources, includes, defines, libraries, constructed files). Provided either directly or produced internally via `cbuild setup`. |

The `.clayer.yml` contains the pack references and the list of requested
components. The resolved `.cbuild.yml` contains the fully expanded per-component
file lists, include paths, compile definitions, and pre-built library references.

### Example `.clayer.yml` files

**ExecuTorch** (`cmsis-pack-modules/executorch.clayer.yml`):

```yaml
layer:
  type: AI
  packs:
    - pack: PyTorch::ExecuTorch
      path: ../../../packs/PyTorch.ExecuTorch.1.1.0-rc1-build.12
  define:
    - ET_LOG_ENABLED: 0
  components:
    - component: Machine Learning:ExecuTorch:Runtime
    - component: Machine Learning:ExecuTorch:Kernel Utils
    - component: Machine Learning:ExecuTorch:Kernel Registration
    - component: Machine Learning:ExecuTorch:Backend EthosU
    - component: Machine Learning:ExecuTorch:Platform Bare-Metal
    - component: Machine Learning:ExecuTorch:Stubs RandomOps
    - component: Machine Learning:ExecuTorch:Operators Quantized quantize
    - component: Machine Learning:ExecuTorch:Operators Quantized dequantize
    - component: Machine Learning:ExecuTorch:Backend CortexM
```

**CMSIS-NN** (`cmsis-pack-modules/cmsis-nn.clayer.yml`):

```yaml
layer:
  type: AI
  packs:
    - pack: ARM::CMSIS-NN
      path: ../../modules/lib/cmsis-nn
  components:
    - component: CMSIS:NN Lib
```

**CMSIS-DSP** (`cmsis-pack-modules/cmsis-dsp.clayer.yml`):

```yaml
layer:
  type: DSP
  packs:
    - pack: ARM::CMSIS-DSP
      path: ../../modules/lib/cmsis-dsp
  components:
    - component: CMSIS:DSP:Source
```

## Outputs

The tool writes a directory that is a valid Zephyr external module:

```
<output-dir>/
├── zephyr/
│   └── module.yml        # Zephyr module descriptor
├── CMakeLists.txt         # Top-level guard, includes sources.cmake
├── Kconfig                # menuconfig + per-component config symbols
├── sources.cmake          # zephyr_library_*() calls per component
└── RTE/                   # (if constructed files exist in the resolved build)
    └── RTE_Components.h
```

The generated module is consumed by `west build` via `ZEPHYR_EXTRA_MODULES` or
a west manifest entry. No CMSIS tooling is needed at Zephyr build time — only
pack source files must be reachable (via the pack `path` from `.clayer.yml` or
`CMSIS_PACK_ROOT`).

## Generation Rules

### 1. `zephyr/module.yml`

Standard Zephyr module descriptor pointing CMake and Kconfig to the parent
directory.

### 2. `Kconfig`

- One **menuconfig** for the module: `CMSIS_<MODULE_NAME>` (uppercased,
  non-alphanumeric → `_`).
  - `depends on CPP && STD_CPP17` when any component contains C++ sources.
- One **config** per resolved component: `CMSIS_<MODULE_NAME>_<COMPONENT_SHORT>`,
  `default y`.

### 3. `CMakeLists.txt`

Guards the module behind `CONFIG_CMSIS_<MODULE_NAME>` and includes
`sources.cmake`.

### 4. `sources.cmake`

Core generated file. For each resolved component:

| `.cbuild.yml` data | Zephyr CMake equivalent |
|---|---|
| `files[]` with category `sourceC` / `sourceCpp` / `sourceAsm` | `zephyr_library_sources()` |
| `includes[]` and header-file directories | `zephyr_include_directories()` |
| `defines[]` | `zephyr_compile_definitions()` |
| `files[]` with category `library` | `zephyr_library_import()` |
| C++ sources present in component | `zephyr_library_compile_options(-std=c++17 -fno-rtti -fno-exceptions)` |
| `constructed-files[]` (e.g. `RTE_Components.h`) | Copy into `<output-dir>/RTE/` and add include path |

Each component block is guarded by its Kconfig symbol
(`if(CONFIG_CMSIS_<MODULE>_<COMPONENT>)`).

Pack source paths are expressed relative to the pack root declared in the
`.clayer.yml` so the module works from a local pack checkout or
`CMSIS_PACK_ROOT`.

#### Pack path resolution

The `.clayer.yml` pack entry may contain an explicit `path`:

```yaml
packs:
  - pack: ARM::CMSIS-NN
    path: ../../modules/lib/cmsis-nn
```

When `path` is present, it is relative to the `.clayer.yml` location and
points to a specific directory containing the pack sources (e.g. a Git
submodule or a local checkout). The generated `sources.cmake` resolves this
to an absolute path relative to its own location
(`${CMAKE_CURRENT_LIST_DIR}/../../modules/lib/cmsis-nn`).

When `path` is absent, the pack was installed into `CMSIS_PACK_ROOT` via
`cpackget`. The generated `sources.cmake` constructs the path from the
environment variable — `$ENV{CMSIS_PACK_ROOT}/<vendor>/<pack>/<version>`.

When `path` is present the generated module should still fall back to
`CMSIS_PACK_ROOT` if the relative path does not exist, so the same module
works in both a workspace checkout and a CI environment where only the pack
cache is populated.

### 5. `.stamp`

SHA-256 of the input `.clayer.yml` content, allowing callers to skip
regeneration when the input has not changed.

## PDSC Condition → Zephyr Kconfig Mapping (Future)

For the initial implementation, resolving against a single generic device
(e.g. ARMCM55, covering the ARMv8.1-M superset) is sufficient — all sources
are included unconditionally and Zephyr's compiler flags handle architecture
specifics.

A follow-up may resolve the same clayer against multiple targets and emit
conditional CMake guards mapped from PDSC conditions to Zephyr Kconfig
symbols (e.g. `Dcore="Cortex-M55"` → `CONFIG_CPU_CORTEX_M55`).

## Reference Modules

This repo contains hand-authored reference modules under `cmsis-pack-modules/`
that demonstrate the expected output for validation:

| Directory | clayer | Pack |
|---|---|---|
| `cmsis-pack-modules/executorch/` | `executorch.clayer.yml` | `PyTorch::ExecuTorch` |
| `cmsis-pack-modules/cmsis-nn/` | `cmsis-nn.clayer.yml` | `ARM::CMSIS-NN` |
| `cmsis-pack-modules/cmsis-dsp/` | `cmsis-dsp.clayer.yml` | `ARM::CMSIS-DSP` |
