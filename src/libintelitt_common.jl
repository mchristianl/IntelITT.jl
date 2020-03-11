# Automatically generated using Clang.jl


const ptrdiff_t = Clong
const size_t = Culong
const wchar_t = Cint

struct max_align_t
    __max_align_ll::Clonglong
    __max_align_ld::Float64
end

const __u_char = Cuchar
const __u_short = UInt16
const __u_int = UInt32
const __u_long = Culong
const __int8_t = UInt8
const __uint8_t = Cuchar
const __int16_t = Int16
const __uint16_t = UInt16
const __int32_t = Cint
const __uint32_t = UInt32
const __int64_t = Clong
const __uint64_t = Culong
const __int_least8_t = __int8_t
const __uint_least8_t = __uint8_t
const __int_least16_t = __int16_t
const __uint_least16_t = __uint16_t
const __int_least32_t = __int32_t
const __uint_least32_t = __uint32_t
const __int_least64_t = __int64_t
const __uint_least64_t = __uint64_t
const __quad_t = Clong
const __u_quad_t = Culong
const __intmax_t = Clong
const __uintmax_t = Culong
const __dev_t = Culong
const __uid_t = UInt32
const __gid_t = UInt32
const __ino_t = Culong
const __ino64_t = Culong
const __mode_t = UInt32
const __nlink_t = Culong
const __off_t = Clong
const __off64_t = Clong
const __pid_t = Cint

struct __fsid_t
    __val::NTuple{2, Cint}
end

const __clock_t = Clong
const __rlim_t = Culong
const __rlim64_t = Culong
const __id_t = UInt32
const __time_t = Clong
const __useconds_t = UInt32
const __suseconds_t = Clong
const __daddr_t = Cint
const __key_t = Cint
const __clockid_t = Cint
const __timer_t = Ptr{Cvoid}
const __blksize_t = Clong
const __blkcnt_t = Clong
const __blkcnt64_t = Clong
const __fsblkcnt_t = Culong
const __fsblkcnt64_t = Culong
const __fsfilcnt_t = Culong
const __fsfilcnt64_t = Culong
const __fsword_t = Clong
const __ssize_t = Clong
const __syscall_slong_t = Clong
const __syscall_ulong_t = Culong
const __loff_t = __off64_t
const __caddr_t = Cstring
const __intptr_t = Clong
const __socklen_t = UInt32
const __sig_atomic_t = Cint
const int8_t = __int8_t
const int16_t = __int16_t
const int32_t = __int32_t
const int64_t = __int64_t
const uint8_t = __uint8_t
const uint16_t = __uint16_t
const uint32_t = __uint32_t
const uint64_t = __uint64_t
const int_least8_t = __int_least8_t
const int_least16_t = __int_least16_t
const int_least32_t = __int_least32_t
const int_least64_t = __int_least64_t
const uint_least8_t = __uint_least8_t
const uint_least16_t = __uint_least16_t
const uint_least32_t = __uint_least32_t
const uint_least64_t = __uint_least64_t
const int_fast8_t = UInt8
const int_fast16_t = Clong
const int_fast32_t = Clong
const int_fast64_t = Clong
const uint_fast8_t = Cuchar
const uint_fast16_t = Culong
const uint_fast32_t = Culong
const uint_fast64_t = Culong
const intptr_t = Clong
const uintptr_t = Culong
const intmax_t = __intmax_t
const uintmax_t = __uintmax_t
const __itt_pause_ptr__3_0_t = Ptr{Cvoid}
const __itt_resume_ptr__3_0_t = Ptr{Cvoid}
const __itt_detach_ptr__3_0_t = Ptr{Cvoid}
const __itt_pt_region = Cuchar
const __itt_pt_region_create_ptr__3_0_t = Ptr{Cvoid}
const __itt_thread_set_name_ptr__3_0_t = Ptr{Cvoid}
const __itt_thread_ignore_ptr__3_0_t = Ptr{Cvoid}
const __itt_suppress_push_ptr__3_0_t = Ptr{Cvoid}
const __itt_suppress_pop_ptr__3_0_t = Ptr{Cvoid}

@cenum __itt_suppress_mode::UInt32 begin
    __itt_unsuppress_range = 0
    __itt_suppress_range = 1
end


const __itt_suppress_mode_t = __itt_suppress_mode
const __itt_suppress_mark_range_ptr__3_0_t = Ptr{Cvoid}
const __itt_suppress_clear_range_ptr__3_0_t = Ptr{Cvoid}
const __itt_sync_create_ptr__3_0_t = Ptr{Cvoid}
const __itt_sync_rename_ptr__3_0_t = Ptr{Cvoid}
const __itt_sync_destroy_ptr__3_0_t = Ptr{Cvoid}
const __itt_sync_prepare_ptr__3_0_t = Ptr{Cvoid}
const __itt_sync_cancel_ptr__3_0_t = Ptr{Cvoid}
const __itt_sync_acquired_ptr__3_0_t = Ptr{Cvoid}
const __itt_sync_releasing_ptr__3_0_t = Ptr{Cvoid}
const __itt_fsync_prepare_ptr__3_0_t = Ptr{Cvoid}
const __itt_fsync_cancel_ptr__3_0_t = Ptr{Cvoid}
const __itt_fsync_acquired_ptr__3_0_t = Ptr{Cvoid}
const __itt_fsync_releasing_ptr__3_0_t = Ptr{Cvoid}
const __itt_model_site = Ptr{Cvoid}
const __itt_model_site_instance = Ptr{Cvoid}
const __itt_model_task = Ptr{Cvoid}
const __itt_model_task_instance = Ptr{Cvoid}

@cenum __itt_model_disable::UInt32 begin
    __itt_model_disable_observation = 0
    __itt_model_disable_collection = 1
end


const __itt_model_site_begin_ptr__3_0_t = Ptr{Cvoid}
const __itt_model_site_beginA_ptr__3_0_t = Ptr{Cvoid}
const __itt_model_site_beginAL_ptr__3_0_t = Ptr{Cvoid}
const __itt_model_site_end_ptr__3_0_t = Ptr{Cvoid}
const __itt_model_site_end_2_ptr__3_0_t = Ptr{Cvoid}
const __itt_model_task_begin_ptr__3_0_t = Ptr{Cvoid}
const __itt_model_task_beginA_ptr__3_0_t = Ptr{Cvoid}
const __itt_model_task_beginAL_ptr__3_0_t = Ptr{Cvoid}
const __itt_model_iteration_taskA_ptr__3_0_t = Ptr{Cvoid}
const __itt_model_iteration_taskAL_ptr__3_0_t = Ptr{Cvoid}
const __itt_model_task_end_ptr__3_0_t = Ptr{Cvoid}
const __itt_model_task_end_2_ptr__3_0_t = Ptr{Cvoid}
const __itt_model_lock_acquire_ptr__3_0_t = Ptr{Cvoid}
const __itt_model_lock_acquire_2_ptr__3_0_t = Ptr{Cvoid}
const __itt_model_lock_release_ptr__3_0_t = Ptr{Cvoid}
const __itt_model_lock_release_2_ptr__3_0_t = Ptr{Cvoid}
const __itt_model_record_allocation_ptr__3_0_t = Ptr{Cvoid}
const __itt_model_record_deallocation_ptr__3_0_t = Ptr{Cvoid}
const __itt_model_induction_uses_ptr__3_0_t = Ptr{Cvoid}
const __itt_model_reduction_uses_ptr__3_0_t = Ptr{Cvoid}
const __itt_model_observe_uses_ptr__3_0_t = Ptr{Cvoid}
const __itt_model_clear_uses_ptr__3_0_t = Ptr{Cvoid}
const __itt_model_disable_push_ptr__3_0_t = Ptr{Cvoid}
const __itt_model_disable_pop_ptr__3_0_t = Ptr{Cvoid}
const __itt_model_aggregate_task_ptr__3_0_t = Ptr{Cvoid}
const __itt_heap_function = Ptr{Cvoid}
const __itt_heap_function_create_ptr__3_0_t = Ptr{Cvoid}
const __itt_heap_allocate_begin_ptr__3_0_t = Ptr{Cvoid}
const __itt_heap_allocate_end_ptr__3_0_t = Ptr{Cvoid}
const __itt_heap_free_begin_ptr__3_0_t = Ptr{Cvoid}
const __itt_heap_free_end_ptr__3_0_t = Ptr{Cvoid}
const __itt_heap_reallocate_begin_ptr__3_0_t = Ptr{Cvoid}
const __itt_heap_reallocate_end_ptr__3_0_t = Ptr{Cvoid}
const __itt_heap_internal_access_begin_ptr__3_0_t = Ptr{Cvoid}
const __itt_heap_internal_access_end_ptr__3_0_t = Ptr{Cvoid}
const __itt_heap_record_memory_growth_begin_ptr__3_0_t = Ptr{Cvoid}
const __itt_heap_record_memory_growth_end_ptr__3_0_t = Ptr{Cvoid}
const __itt_heap_reset_detection_ptr__3_0_t = Ptr{Cvoid}
const __itt_heap_record_ptr__3_0_t = Ptr{Cvoid}
const __itt_domain = ___itt_domain
const __itt_domain_create_ptr__3_0_t = Ptr{Cvoid}
const __itt_id = ___itt_id
const __itt_id_create_ptr__3_0_t = Ptr{Cvoid}
const __itt_id_destroy_ptr__3_0_t = Ptr{Cvoid}
const __itt_string_handle = ___itt_string_handle
const __itt_string_handle_create_ptr__3_0_t = Ptr{Cvoid}
const __itt_timestamp = Culonglong
const __itt_get_timestamp_ptr__3_0_t = Ptr{Cvoid}
const __itt_region_begin_ptr__3_0_t = Ptr{Cvoid}
const __itt_region_end_ptr__3_0_t = Ptr{Cvoid}
const __itt_frame_begin_v3_ptr__3_0_t = Ptr{Cvoid}
const __itt_frame_end_v3_ptr__3_0_t = Ptr{Cvoid}
const __itt_frame_submit_v3_ptr__3_0_t = Ptr{Cvoid}
const __itt_task_group_ptr__3_0_t = Ptr{Cvoid}
const __itt_task_begin_ptr__3_0_t = Ptr{Cvoid}
const __itt_task_begin_fn_ptr__3_0_t = Ptr{Cvoid}
const __itt_task_end_ptr__3_0_t = Ptr{Cvoid}
const __itt_task_begin_overlapped_ptr__3_0_t = Ptr{Cvoid}
const __itt_task_end_overlapped_ptr__3_0_t = Ptr{Cvoid}

@cenum __itt_scope::UInt32 begin
    __itt_scope_unknown = 0
    __itt_scope_global = 1
    __itt_scope_track_group = 2
    __itt_scope_track = 3
    __itt_scope_task = 4
    __itt_scope_marker = 5
end


const __itt_marker_ptr__3_0_t = Ptr{Cvoid}

@cenum __itt_metadata_type::UInt32 begin
    __itt_metadata_unknown = 0
    __itt_metadata_u64 = 1
    __itt_metadata_s64 = 2
    __itt_metadata_u32 = 3
    __itt_metadata_s32 = 4
    __itt_metadata_u16 = 5
    __itt_metadata_s16 = 6
    __itt_metadata_float = 7
    __itt_metadata_double = 8
end


const __itt_metadata_add_ptr__3_0_t = Ptr{Cvoid}
const __itt_metadata_str_add_ptr__3_0_t = Ptr{Cvoid}
const __itt_metadata_add_with_scope_ptr__3_0_t = Ptr{Cvoid}
const __itt_metadata_str_add_with_scope_ptr__3_0_t = Ptr{Cvoid}

@cenum __itt_relation::UInt32 begin
    __itt_relation_is_unknown = 0
    __itt_relation_is_dependent_on = 1
    __itt_relation_is_sibling_of = 2
    __itt_relation_is_parent_of = 3
    __itt_relation_is_continuation_of = 4
    __itt_relation_is_child_of = 5
    __itt_relation_is_continued_by = 6
    __itt_relation_is_predecessor_to = 7
end


const __itt_relation_add_to_current_ptr__3_0_t = Ptr{Cvoid}
const __itt_relation_add_ptr__3_0_t = Ptr{Cvoid}
const __itt_clock_info = ___itt_clock_info
const __itt_get_clock_info_fn = Ptr{Cvoid}
const __itt_clock_domain = ___itt_clock_domain
const __itt_clock_domain_create_ptr__3_0_t = Ptr{Cvoid}
const __itt_clock_domain_reset_ptr__3_0_t = Ptr{Cvoid}
const __itt_id_create_ex_ptr__3_0_t = Ptr{Cvoid}
const __itt_id_destroy_ex_ptr__3_0_t = Ptr{Cvoid}
const __itt_task_begin_ex_ptr__3_0_t = Ptr{Cvoid}
const __itt_task_begin_fn_ex_ptr__3_0_t = Ptr{Cvoid}
const __itt_task_end_ex_ptr__3_0_t = Ptr{Cvoid}
const ___itt_counter = Cvoid
const __itt_counter = Ptr{___itt_counter}
const __itt_counter_create_ptr__3_0_t = Ptr{Cvoid}
const __itt_counter_inc_ptr__3_0_t = Ptr{Cvoid}
const __itt_counter_inc_delta_ptr__3_0_t = Ptr{Cvoid}
const __itt_counter_dec_ptr__3_0_t = Ptr{Cvoid}
const __itt_counter_dec_delta_ptr__3_0_t = Ptr{Cvoid}
const __itt_counter_inc_v3_ptr__3_0_t = Ptr{Cvoid}
const __itt_counter_inc_delta_v3_ptr__3_0_t = Ptr{Cvoid}
const __itt_counter_dec_v3_ptr__3_0_t = Ptr{Cvoid}
const __itt_counter_dec_delta_v3_ptr__3_0_t = Ptr{Cvoid}
const __itt_counter_set_value_ptr__3_0_t = Ptr{Cvoid}
const __itt_counter_set_value_ex_ptr__3_0_t = Ptr{Cvoid}
const __itt_counter_create_typed_ptr__3_0_t = Ptr{Cvoid}
const __itt_counter_destroy_ptr__3_0_t = Ptr{Cvoid}
const __itt_marker_ex_ptr__3_0_t = Ptr{Cvoid}
const __itt_relation_add_to_current_ex_ptr__3_0_t = Ptr{Cvoid}
const __itt_relation_add_ex_ptr__3_0_t = Ptr{Cvoid}

@cenum ___itt_track_group_type::UInt32 begin
    __itt_track_group_type_normal = 0
end


const __itt_track_group_type = ___itt_track_group_type
const __itt_track_group = ___itt_track_group

@cenum ___itt_track_type::UInt32 begin
    __itt_track_type_normal = 0
end


const __itt_track_type = ___itt_track_type
const __itt_track = ___itt_track
const __itt_track_group_create_ptr__3_0_t = Ptr{Cvoid}
const __itt_track_create_ptr__3_0_t = Ptr{Cvoid}
const __itt_set_track_ptr__3_0_t = Ptr{Cvoid}
const __itt_event = Cint
const __itt_event_create_ptr__3_0_t = Ptr{Cvoid}
const __itt_event_start_ptr__3_0_t = Ptr{Cvoid}
const __itt_event_end_ptr__3_0_t = Ptr{Cvoid}

@cenum __itt_av_data_type::UInt32 begin
    __itt_e_first = 0
    __itt_e_char = 0
    __itt_e_uchar = 1
    __itt_e_int16 = 2
    __itt_e_uint16 = 3
    __itt_e_int32 = 4
    __itt_e_uint32 = 5
    __itt_e_int64 = 6
    __itt_e_uint64 = 7
    __itt_e_float = 8
    __itt_e_double = 9
    __itt_e_last = 9
end


const __itt_av_save_ptr__3_0_t = Ptr{Cvoid}
const __itt_enable_attach_ptr__3_0_t = Ptr{Cvoid}
const __itt_module_load_ptr__3_0_t = Ptr{Cvoid}
const __itt_module_unload_ptr__3_0_t = Ptr{Cvoid}

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


const __itt_section_info = ___itt_section_info
const __itt_module_object = ___itt_module_object
const __itt_module_load_with_sections_ptr__3_0_t = Ptr{Cvoid}
const __itt_module_unload_with_sections_ptr__3_0_t = Ptr{Cvoid}
