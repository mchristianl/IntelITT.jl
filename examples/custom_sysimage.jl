Base.init_depot_path()
Base.init_load_path()

# julia --startup-file=no --trace-compile=trace.jl intelitttest.jl
# julia --startup-file=no --output-o customsys.o -J"/usr/lib/julia/sys.so" custom_sysimage.jl
# gcc -shared -o customsys.so -Wl,--whole-archive customsys.o -Wl,--no-whole-archive -L"/usr/lib/julia/" -ljulia
# julia -Jcustomsys.so

# Pkg.develop(path="./IntelITTTest")
using IntelITT
using IntelITTTest

@eval Module() begin
    for (pkgid, mod) in Base.loaded_modules
        if !(pkgid.name in ("Main", "Core", "Base"))
            eval(@__MODULE__, :(const $(Symbol(mod)) = $mod))
        end
    end
    for statement in readlines("trace.jl")
        try
            Base.include_string(@__MODULE__, statement)
        catch e
            # See julia issue #28808
            @info "failed to compile statement: $statement"
            error(e)
        end
    end
end # module

empty!(LOAD_PATH)
empty!(DEPOT_PATH)
