
(WARNING: proof of concept! Times this was tested: 1)

A wrapper for the [Intel Instrumentation and Tracing Technology APIs](https://software.intel.com/en-us/vtune-help-instrumentation-and-tracing-technology-apis)

## What works

see [intelitttest.jl](examples/intelitttest.jl) file

## Installation requirements (Linux)

This currently works with a shared object `libittnotify.so`. You need to modify its path in `IntelITT.jl`

```julia
const LIBITTNOTIFY_PATH = joinpath(@__DIR__,"libittnotify.so")
```

The `libittnotify.so` is NOT distributed with Intel vtune amplifier/profiler.
Intel vtune amplifier/profiler comes with a `libittnotify.a` instead.
This file is usually found in the `lib64` folder of your Intel vtune amplifier/profiler installation, e.g.

```
/opt/intel/some_intel_vtune_product/lib64/libittnotify.a
```

I've created a shared object by extracting the `libittnotify.a`

```bash
ar x libittnotify.a
```

and linking it into a shared object

```bash
gcc -shared ittnotify_static.o ittptmark64.o -o libittnotify.so
```
