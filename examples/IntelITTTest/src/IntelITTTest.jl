module IntelITTTest
  # include(joinpath(@__DIR__,"../src/IntelITT.jl"))
  # using Main.IntelITT
  using IntelITT

  const N = 256
  const A = UInt64[]
  const B = UInt64[]

  const hdom_ptr         = Ref{Ptr{IntelITT.___itt_domain}}(C_NULL)
  const hstr_cumsum1_ptr = Ref{Ptr{IntelITT.___itt_string_handle}}(C_NULL)
  const hstr_cumsum2_ptr = Ref{Ptr{IntelITT.___itt_string_handle}}(C_NULL)
  const hstr_cumsum3_ptr = Ref{Ptr{IntelITT.___itt_string_handle}}(C_NULL)

  function test_01()
    B .= cumsum(A)
  end

  function test_02()
    cumsum!(B,A)
  end

  function test_03()
    x = B[1] = A[1]
    for n in 2:length(A)
      x += A[n]
      B[n] = x
    end
  end

  # export runtests
  function runtests()
    __itt_task_begin(hdom_ptr[], __itt_null, __itt_null, hstr_cumsum1_ptr[])
    
      test_01()
    
    __itt_task_end(hdom_ptr[])
    __itt_task_begin(hdom_ptr[], __itt_null, __itt_null, hstr_cumsum2_ptr[])
    
      test_02()
    
    __itt_task_end(hdom_ptr[])
    __itt_task_begin(hdom_ptr[], __itt_null, __itt_null, hstr_cumsum3_ptr[])
    
      test_03()
    
    __itt_task_end(hdom_ptr[])
  end

  function main()
    if !(haskey(ENV,"ENABLE_JITPROFILING") && ENV["ENABLE_JITPROFILING"] == "1")
      println("remember to set the environment variable `ENABLE_JITPROFILING = 1` to get function symbols resolved")
    end

    hdom_ptr[]         = __itt_domain_create("Test.Domain.Global")
    hstr_cumsum1_ptr[] = __itt_string_handle_create("cumsum")
    hstr_cumsum2_ptr[] = __itt_string_handle_create("cumsum!")
    hstr_cumsum3_ptr[] = __itt_string_handle_create("cumsum2!")
    L = 1024*1024*N
    resize!(A,L)
    resize!(B,L)
    A .= rand(UInt64,L) .% UInt64(17)
    B .= copy(A)
    
    runtests()

    __itt_resume()
    runtests()
    __itt_pause()

    __itt_detach()
  end
end # module
