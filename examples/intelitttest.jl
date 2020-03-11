include(joinpath(@__DIR__,"../src/IntelITT.jl"))
using Main.IntelITT

N = 256
A = rand(UInt32,1024*1024*N) .% UInt32(17)

hdom_ptr = __itt_domain_create("Test.Domain.Global")
hstr_cumsum1_ptr  =  __itt_string_handle_create("cumsum")
hstr_cumsum2_ptr  =  __itt_string_handle_create("cumsum!")

function f01()
  __itt_task_begin(hdom_ptr, __itt_null, __itt_null, hstr_cumsum1_ptr)

  B = cumsum(A)

   __itt_task_end(hdom_ptr)
end

function f02()
  __itt_task_begin(hdom_ptr, __itt_null, __itt_null, hstr_cumsum2_ptr)

  cumsum!(B,A)

   __itt_task_end(hdom_ptr)
end

B = copy(A)

function runtests()
  f01()
  f02()
end

runtests()

__itt_resume()
runtests()
__itt_pause()

__itt_detach()
