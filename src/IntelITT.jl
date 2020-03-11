module IntelITT

using CEnum

struct ___itt_domain
  flags  :: Cint               # volatile int; # !< Zero if disabled, non-zero if enabled. The meaning of different non-zero values is reserved to the runtime */
  nameA  :: Cstring            # const char*;  # !< Copy of original name in ASCII. */
  nameW  :: Ptr{Cvoid}         # void*;
  extra1 :: Cint               # int;          # !< Reserved to the runtime */
  extra2 :: Ptr{Cvoid}         # void*;        # !< Reserved to the runtime */
  next   :: Ptr{___itt_domain} # struct ___itt_domain* next;
end

struct ___itt_id
  d1::Culonglong
  d2::Culonglong
  d3::Culonglong
end
const __itt_id = ___itt_id

struct ___itt_string_handle
  strA   :: Cstring                   # const char*; /*!< Copy of original string in ASCII. */
  strW   :: Ptr{Cvoid}                # void*;
  extra1 :: Cint                      # int;         /*!< Reserved. Must be zero   */
  extra2 :: Ptr{Cvoid}                # void*;       /*!< Reserved. Must be zero   */
  next   :: Ptr{___itt_string_handle} # struct ___itt_string_handle*;
end
const __itt_string_handle = ___itt_string_handle

struct ___itt_clock_info
  clock_freq :: Culonglong # unsigned long long ; /*!< Clock domain frequency */
  clock_base :: Culonglong # unsigned long long ; /*!< Clock domain base timestamp */
end
const __itt_clock_info = ___itt_clock_info

struct ___itt_clock_domain
  info    :: __itt_clock_info         # __itt_clock_info;        /*!< Most recent clock domain info */
  fn      :: Ptr{Cvoid}               # __itt_get_clock_info_fn; /*!< Callback function pointer */
  fn_data :: Ptr{Cvoid}               # void*;                   /*!< Input argument for the callback function */
  extra1  :: Cint                     # int;                     /*!< Reserved. Must be zero */
  extra2  :: Ptr{Cvoid}               # void*;                   /*!< Reserved. Must be zero */
  next    :: Ptr{___itt_clock_domain} # struct ___itt_clock_domain*;
end


@cenum ___itt_track_group_type::UInt32 begin
    __itt_track_group_type_normal = 0
end
const __itt_track_group_type = ___itt_track_group_type

struct ___itt_track_group
  name   :: Ptr{__itt_string_handle} # __itt_string_handle*   /*!< Name of the track group */
  track  :: Ptr{Cvoid}               # struct ___itt_track*   /*!< List of child tracks    */
  tgtype :: __itt_track_group_type   # __itt_track_group_type /*!< Type of the track group */
  extra1 :: Cint                     # int                    /*!< Reserved. Must be zero  */
  extra2 :: Ptr{Cvoid}               # void*                  /*!< Reserved. Must be zero  */
  next   :: Ptr{___itt_track_group}  # struct ___itt_track_group*
end
const __itt_track_group = ___itt_track_group

@cenum ___itt_track_type::UInt32 begin
    __itt_track_type_normal = 0
end
const __itt_track_type = ___itt_track_type

struct ___itt_track
  name   :: Ptr{__itt_string_handle} # __itt_string_handle* /*!< Name of the track group */
  group  :: Ptr{__itt_track_group}   # __itt_track_group*   /*!< Parent group to a track */
  ttype  :: __itt_track_type         # __itt_track_type     /*!< Type of the track       */
  extra1 :: Cint                     # int                  /*!< Reserved. Must be zero  */
  extra2 :: Ptr{Cvoid}               # void*                /*!< Reserved. Must be zero  */
  next   :: Ptr{___itt_track}        # struct ___itt_track*
end


@cenum __itt_module_type::UInt32 begin
    __itt_module_type_unknown = 0
    __itt_module_type_elf = 1
    __itt_module_type_coff = 2
end

@cenum __itt_section_type::UInt32 begin
    itt_section_type_unknown = 0
    itt_section_type_bss = 1
    itt_section_type_data = 2
    itt_section_type_text = 3
end

struct ___itt_section_info
  name        :: Cstring            # const char*;        /*!< Section name in UTF8 */
  type        :: __itt_section_type # __itt_section_type; /*!< Section content and semantics description */
  flags       :: Csize_t            # size_t;             /*!< Section bit flags that describe attributes using bit mask Zero if disabled, non-zero if enabled */
  start_addr  :: Ptr{Cvoid}         # void*;              /*!< Section load(relocated) start address */
  size        :: Csize_t            # size_t;             /*!< Section file offset */
  file_offset :: Csize_t            # size_t;             /*!< Section size */
end
const __itt_section_info = ___itt_section_info

struct ___itt_module_object
  version        :: Cuint # unsigned int /*!< API version*/
  module_id      :: __itt_id # __itt_id /*!< Unique identifier. This is unchanged for sections that belong to the same module */
  module_type    :: __itt_module_type # __itt_module_type /*!< Binary module format */
  # Unique module name or path to module in UTF8
  # Contains module name when module_bufer and module_size exist
  # Contains module path when module_bufer and module_size absent
  # module_name remains the same for the certain module_id
  module_name    :: Cstring # const char*
  module_buffer  :: Ptr{Cvoid} # void* /*!< Module buffer content */
  module_size    :: Csize_t # size_t /*!< Module buffer size */
  # If module_buffer and module_size exist, the binary module is dumped onto the system.
  # If module_buffer and module_size do not exist,
  # the binary module exists on the system already.
  # The module_name parameter contains the path to the module.
  section_array  :: Ptr{__itt_section_info} # __itt_section_info* /*!< Reference to section information */
  section_number :: Csize_t # size_t
end

include("libintelitt_common.jl")

using Libdl
const LIBITTNOTIFY_PATH = joinpath(@__DIR__,"libittnotify.so")
const libittnotify = Ref{Ptr{Cvoid}}(C_NULL)

const fn_ptrs   = Ptr{Cvoid}[]
const fn_names  = Symbol[]
const fn_namedb = Dict{Symbol,Int64}()

# pointered function
macro mkfnptr(name,rtype,argtypes,argnames...)
  # println("$name")
  # symname = Symbol(string(name) * "_ptr__3_0")
  # fn_ptr = dlsym(libittnotify, symname)
  fn_id =
    if haskey(fn_namedb,name)
      fn_namedb[name]
    else
      push!(fn_ptrs,C_NULL)
      symname = Symbol(string(name) * "_ptr__3_0")
      push!(fn_names,symname)
      id = length(fn_ptrs)
      fn_namedb[name] = id
      id
    end
  # println("  fn       = $symname")
  # println("  fn_id    = $fn_id")
  # println("  ptr      = $fn_ptr")
  # println("  rtype    = $rtype")
  # println("  argtypes = $argtypes")
  # println("  argnames = $argnames")
  f_typed = quote
    export $(esc(name))
    function $(esc(name))($( (:( $arg::$T ) for (arg,T) in zip(argnames,argtypes.args))... ))
      ccall($__module__.fn_ptrs[$fn_id], $rtype, ($(argtypes.args...),), $(argnames...))
    end
  end
  f_untyped = quote
    export $(esc(name))
    function $(esc(name))( $(argnames...) )
      ccall($__module__.fn_ptrs[$fn_id], $rtype, ($(argtypes.args...),), $(argnames...))
    end
  end
  Nargs = length(argtypes.args)
  if Nargs > 0
    quote
      export $(esc(name))
      $f_typed
      $f_untyped
    end
  else
    quote
      export $(esc(name))
      $f_typed
    end
  end
end

# regular function
macro mkfn(name,rtype,argtypes,argnames...)
  # println("$name")
  # println("  rtype    = $rtype")
  # println("  argtypes = $argtypes")
  # println("  argnames = $argnames")
  # println("  argtypes :: $(typeof(argtypes.args))")
  # println("  argnames :: $(typeof(argnames))")
  f_typed = quote
    function $(esc(name))($( (:( $arg::$T ) for (arg,T) in zip(argnames,argtypes.args))... ))
      ccall(($name,LIBITTNOTIFY_PATH), $rtype, ($(argtypes.args...),), $(argnames...))
    end
  end
  f_untyped = quote
    function $(esc(name))( $(argnames...) )
      ccall(($name,LIBITTNOTIFY_PATH), $rtype, ($(argtypes.args...),), $(argnames...))
    end
  end
  Nargs = length(argtypes.args)
  if Nargs > 0
    quote
      export $(esc(name))
      $f_typed
      $f_untyped
    end
  else
    quote
      export $(esc(name))
      $f_typed
    end
  end
end

function __init__()
  libittnotify[] = dlopen(Symbol(LIBITTNOTIFY_PATH))
  if libittnotify[] == C_NULL
    # create a shared object with
    #   ar x libittnotify.a
    #   gcc -shared ittnotify_static.o ittptmark64.o -o libittnotify.so
    error("could not open $LIBITTNOTIFY_PATH")
  end
  for n in 1:length(fn_names)
    x = dlsym(libittnotify[], fn_names[n])
    if x == C_NULL
      println("WARNING: could not get symbol for $(fn_names[n])")
    end
    fn_ptrs[n] = unsafe_load(convert(Ptr{Ptr{Cvoid}},x))
    if fn_ptrs[n] == C_NULL
      println("WARNING: could not get function pointer for $(fn_names[n])")
    end
  end
end

include("libintelitt_functions.jl")

export __itt_null
const __itt_null = __itt_id(UInt64(0),UInt64(0),UInt64(0))

# __init__()

end # module
