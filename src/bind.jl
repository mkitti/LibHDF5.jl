module HDF5Bindings

using HDF5_jll
export HDF5_jll

using CEnum

const __time64_t = Clonglong

const time_t = __time64_t

const off32_t = Clong

const off_t = off32_t

const hid_t = Int64

@bind h5a_create2(loc_id::hid_t, attr_name::Ptr{Cchar}, type_id::hid_t, space_id::hid_t, acpl_id::hid_t, aapl_id::hid_t)::hid_t "Error in h5a_create2 (not annotated)"

@cenum H5_index_t::Int32 begin
    H5_INDEX_UNKNOWN = -1
    H5_INDEX_NAME = 0
    H5_INDEX_CRT_ORDER = 1
    H5_INDEX_N = 2
end

@cenum H5_iter_order_t::Int32 begin
    H5_ITER_UNKNOWN = -1
    H5_ITER_INC = 0
    H5_ITER_DEC = 1
    H5_ITER_NATIVE = 2
    H5_ITER_N = 3
end

const hsize_t = Culonglong

# typedef herr_t ( * H5A_operator2_t ) ( hid_t location_id /*in*/ , const char * attr_name /*in*/ , const H5A_info_t * ainfo /*in*/ , void * op_data /*in,out*/ )
const H5A_operator2_t = Ptr{Cvoid}

const herr_t = Cint

@bind h5a_iterate2(loc_id::hid_t, idx_type::H5_index_t, order::H5_iter_order_t, idx::Ptr{hsize_t}, op::H5A_operator2_t, op_data::Ptr{Cvoid})::herr_t "Error in h5a_iterate2 (not annotated)"

@bind h5d_create2(loc_id::hid_t, name::Ptr{Cchar}, type_id::hid_t, space_id::hid_t, lcpl_id::hid_t, dcpl_id::hid_t, dapl_id::hid_t)::hid_t "Error in h5d_create2 (not annotated)"

@bind h5d_open2(loc_id::hid_t, name::Ptr{Cchar}, dapl_id::hid_t)::hid_t "Error in h5d_open2 (not annotated)"

@bind h5e_clear2(err_stack::hid_t)::herr_t "Error in h5e_clear2 (not annotated)"

# typedef herr_t ( * H5E_auto2_t ) ( hid_t estack , void * client_data )
const H5E_auto2_t = Ptr{Cvoid}

@bind h5e_get_auto2(estack_id::hid_t, func::Ptr{H5E_auto2_t}, client_data::Ptr{Ptr{Cvoid}})::herr_t "Error in h5e_get_auto2 (not annotated)"

@bind h5e_print2(err_stack::hid_t, stream::Ptr{Libc.FILE})::herr_t "Error in h5e_print2 (not annotated)"

@bind h5e_set_auto2(estack_id::hid_t, func::H5E_auto2_t, client_data::Ptr{Cvoid})::herr_t "Error in h5e_set_auto2 (not annotated)"

@cenum H5E_direction_t::UInt32 begin
    H5E_WALK_UPWARD = 0
    H5E_WALK_DOWNWARD = 1
end

# typedef herr_t ( * H5E_walk2_t ) ( unsigned n , const H5E_error2_t * err_desc , void * client_data )
const H5E_walk2_t = Ptr{Cvoid}

@bind h5e_walk2(err_stack::hid_t, direction::H5E_direction_t, func::H5E_walk2_t, client_data::Ptr{Cvoid})::herr_t "Error in h5e_walk2 (not annotated)"

struct H5E_error2_t
    cls_id::hid_t
    maj_num::hid_t
    min_num::hid_t
    line::Cuint
    func_name::Ptr{Cchar}
    file_name::Ptr{Cchar}
    desc::Ptr{Cchar}
end

struct var"##Ctag#297"
    version::Cuint
    super_size::hsize_t
    super_ext_size::hsize_t
end
function Base.getproperty(x::Ptr{var"##Ctag#297"}, f::Symbol)
    f === :version && return Ptr{Cuint}(x + 0)
    f === :super_size && return Ptr{hsize_t}(x + 8)
    f === :super_ext_size && return Ptr{hsize_t}(x + 16)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#297", f::Symbol)
    r = Ref{var"##Ctag#297"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#297"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#297"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#298"
    version::Cuint
    meta_size::hsize_t
    tot_space::hsize_t
end
function Base.getproperty(x::Ptr{var"##Ctag#298"}, f::Symbol)
    f === :version && return Ptr{Cuint}(x + 0)
    f === :meta_size && return Ptr{hsize_t}(x + 8)
    f === :tot_space && return Ptr{hsize_t}(x + 16)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#298", f::Symbol)
    r = Ref{var"##Ctag#298"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#298"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#298"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct H5_ih_info_t
    index_size::hsize_t
    heap_size::hsize_t
end

struct var"##Ctag#299"
    version::Cuint
    hdr_size::hsize_t
    msgs_info::H5_ih_info_t
end
function Base.getproperty(x::Ptr{var"##Ctag#299"}, f::Symbol)
    f === :version && return Ptr{Cuint}(x + 0)
    f === :hdr_size && return Ptr{hsize_t}(x + 8)
    f === :msgs_info && return Ptr{H5_ih_info_t}(x + 16)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#299", f::Symbol)
    r = Ref{var"##Ctag#299"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#299"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#299"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct H5F_info2_t
    data::NTuple{80, UInt8}
end

function Base.getproperty(x::Ptr{H5F_info2_t}, f::Symbol)
    f === :super && return Ptr{var"##Ctag#297"}(x + 0)
    f === :free && return Ptr{var"##Ctag#298"}(x + 24)
    f === :sohm && return Ptr{var"##Ctag#299"}(x + 48)
    return getfield(x, f)
end

function Base.getproperty(x::H5F_info2_t, f::Symbol)
    r = Ref{H5F_info2_t}(x)
    ptr = Base.unsafe_convert(Ptr{H5F_info2_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{H5F_info2_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

@bind h5f_get_info2(obj_id::hid_t, file_info::Ptr{H5F_info2_t})::herr_t "Error in h5f_get_info2 (not annotated)"

@bind h5g_create2(loc_id::hid_t, name::Ptr{Cchar}, lcpl_id::hid_t, gcpl_id::hid_t, gapl_id::hid_t)::hid_t "Error in h5g_create2 (not annotated)"

@bind h5g_open2(loc_id::hid_t, name::Ptr{Cchar}, gapl_id::hid_t)::hid_t "Error in h5g_open2 (not annotated)"

@cenum H5L_type_t::Int32 begin
    H5L_TYPE_ERROR = -1
    H5L_TYPE_HARD = 0
    H5L_TYPE_SOFT = 1
    H5L_TYPE_EXTERNAL = 64
    H5L_TYPE_MAX = 255
end

const hbool_t = Bool

@cenum H5T_cset_t::Int32 begin
    H5T_CSET_ERROR = -1
    H5T_CSET_ASCII = 0
    H5T_CSET_UTF8 = 1
    H5T_CSET_RESERVED_2 = 2
    H5T_CSET_RESERVED_3 = 3
    H5T_CSET_RESERVED_4 = 4
    H5T_CSET_RESERVED_5 = 5
    H5T_CSET_RESERVED_6 = 6
    H5T_CSET_RESERVED_7 = 7
    H5T_CSET_RESERVED_8 = 8
    H5T_CSET_RESERVED_9 = 9
    H5T_CSET_RESERVED_10 = 10
    H5T_CSET_RESERVED_11 = 11
    H5T_CSET_RESERVED_12 = 12
    H5T_CSET_RESERVED_13 = 13
    H5T_CSET_RESERVED_14 = 14
    H5T_CSET_RESERVED_15 = 15
end

struct var"##Ctag#300"
    data::NTuple{16, UInt8}
end

function Base.getproperty(x::Ptr{var"##Ctag#300"}, f::Symbol)
    f === :token && return Ptr{H5O_token_t}(x + 0)
    f === :val_size && return Ptr{Csize_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#300", f::Symbol)
    r = Ref{var"##Ctag#300"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#300"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#300"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct H5L_info2_t
    type::H5L_type_t
    corder_valid::hbool_t
    corder::Int64
    cset::H5T_cset_t
    u::var"##Ctag#300"
end

@bind h5l_get_info2(loc_id::hid_t, name::Ptr{Cchar}, linfo::Ptr{H5L_info2_t}, lapl_id::hid_t)::herr_t "Error in h5l_get_info2 (not annotated)"

@bind h5l_get_info_by_idx2(loc_id::hid_t, group_name::Ptr{Cchar}, idx_type::H5_index_t, order::H5_iter_order_t, n::hsize_t, linfo::Ptr{H5L_info2_t}, lapl_id::hid_t)::herr_t "Error in h5l_get_info_by_idx2 (not annotated)"

# typedef herr_t ( * H5L_iterate2_t ) ( hid_t group , const char * name , const H5L_info2_t * info , void * op_data )
const H5L_iterate2_t = Ptr{Cvoid}

@bind h5l_iterate2(grp_id::hid_t, idx_type::H5_index_t, order::H5_iter_order_t, idx::Ptr{hsize_t}, op::H5L_iterate2_t, op_data::Ptr{Cvoid})::herr_t "Error in h5l_iterate2 (not annotated)"

@bind h5l_iterate_by_name2(loc_id::hid_t, group_name::Ptr{Cchar}, idx_type::H5_index_t, order::H5_iter_order_t, idx::Ptr{hsize_t}, op::H5L_iterate2_t, op_data::Ptr{Cvoid}, lapl_id::hid_t)::herr_t "Error in h5l_iterate_by_name2 (not annotated)"

@bind h5l_visit2(grp_id::hid_t, idx_type::H5_index_t, order::H5_iter_order_t, op::H5L_iterate2_t, op_data::Ptr{Cvoid})::herr_t "Error in h5l_visit2 (not annotated)"

@bind h5l_visit_by_name2(loc_id::hid_t, group_name::Ptr{Cchar}, idx_type::H5_index_t, order::H5_iter_order_t, op::H5L_iterate2_t, op_data::Ptr{Cvoid}, lapl_id::hid_t)::herr_t "Error in h5l_visit_by_name2 (not annotated)"

struct H5O_token_t
    __data::NTuple{16, UInt8}
end

@cenum H5O_type_t::Int32 begin
    H5O_TYPE_UNKNOWN = -1
    H5O_TYPE_GROUP = 0
    H5O_TYPE_DATASET = 1
    H5O_TYPE_NAMED_DATATYPE = 2
    H5O_TYPE_MAP = 3
    H5O_TYPE_NTYPES = 4
end

struct H5O_info2_t
    fileno::Culong
    token::H5O_token_t
    type::H5O_type_t
    rc::Cuint
    atime::time_t
    mtime::time_t
    ctime::time_t
    btime::time_t
    num_attrs::hsize_t
end

@bind h5o_get_info3(loc_id::hid_t, oinfo::Ptr{H5O_info2_t}, fields::Cuint)::herr_t "Error in h5o_get_info3 (not annotated)"

@bind h5o_get_info_by_idx3(loc_id::hid_t, group_name::Ptr{Cchar}, idx_type::H5_index_t, order::H5_iter_order_t, n::hsize_t, oinfo::Ptr{H5O_info2_t}, fields::Cuint, lapl_id::hid_t)::herr_t "Error in h5o_get_info_by_idx3 (not annotated)"

@bind h5o_get_info_by_name3(loc_id::hid_t, name::Ptr{Cchar}, oinfo::Ptr{H5O_info2_t}, fields::Cuint, lapl_id::hid_t)::herr_t "Error in h5o_get_info_by_name3 (not annotated)"

# typedef herr_t ( * H5O_iterate2_t ) ( hid_t obj , const char * name , const H5O_info2_t * info , void * op_data )
const H5O_iterate2_t = Ptr{Cvoid}

@bind h5o_visit3(obj_id::hid_t, idx_type::H5_index_t, order::H5_iter_order_t, op::H5O_iterate2_t, op_data::Ptr{Cvoid}, fields::Cuint)::herr_t "Error in h5o_visit3 (not annotated)"

@bind h5o_visit_by_name3(loc_id::hid_t, obj_name::Ptr{Cchar}, idx_type::H5_index_t, order::H5_iter_order_t, op::H5O_iterate2_t, op_data::Ptr{Cvoid}, fields::Cuint, lapl_id::hid_t)::herr_t "Error in h5o_visit_by_name3 (not annotated)"

@bind h5p_encode2(plist_id::hid_t, buf::Ptr{Cvoid}, nalloc::Ptr{Csize_t}, fapl_id::hid_t)::herr_t "Error in h5p_encode2 (not annotated)"

const H5Z_filter_t = Cint

@bind h5p_get_filter2(plist_id::hid_t, idx::Cuint, flags::Ptr{Cuint}, cd_nelmts::Ptr{Csize_t}, cd_values::Ptr{Cuint}, namelen::Csize_t, name::Ptr{Cchar}, filter_config::Ptr{Cuint})::H5Z_filter_t "Error in h5p_get_filter2 (not annotated)"

@bind h5p_get_filter_by_id2(plist_id::hid_t, filter_id::H5Z_filter_t, flags::Ptr{Cuint}, cd_nelmts::Ptr{Csize_t}, cd_values::Ptr{Cuint}, namelen::Csize_t, name::Ptr{Cchar}, filter_config::Ptr{Cuint})::herr_t "Error in h5p_get_filter_by_id2 (not annotated)"

# typedef herr_t ( * H5P_prp_cb2_t ) ( hid_t prop_id , const char * name , size_t size , void * value )
const H5P_prp_cb2_t = Ptr{Cvoid}

const H5P_prp_set_func_t = H5P_prp_cb2_t

const H5P_prp_get_func_t = H5P_prp_cb2_t

const H5P_prp_delete_func_t = H5P_prp_cb2_t

# typedef herr_t ( * H5P_prp_cb1_t ) ( const char * name , size_t size , void * value )
const H5P_prp_cb1_t = Ptr{Cvoid}

const H5P_prp_copy_func_t = H5P_prp_cb1_t

# typedef int ( * H5P_prp_compare_func_t ) ( const void * value1 , const void * value2 , size_t size )
const H5P_prp_compare_func_t = Ptr{Cvoid}

const H5P_prp_close_func_t = H5P_prp_cb1_t

@bind h5p_insert2(plist_id::hid_t, name::Ptr{Cchar}, size::Csize_t, value::Ptr{Cvoid}, set::H5P_prp_set_func_t, get::H5P_prp_get_func_t, prp_del::H5P_prp_delete_func_t, copy::H5P_prp_copy_func_t, compare::H5P_prp_compare_func_t, close::H5P_prp_close_func_t)::herr_t "Error in h5p_insert2 (not annotated)"

const H5P_prp_create_func_t = H5P_prp_cb1_t

@bind h5p_register2(cls_id::hid_t, name::Ptr{Cchar}, size::Csize_t, def_value::Ptr{Cvoid}, create::H5P_prp_create_func_t, set::H5P_prp_set_func_t, get::H5P_prp_get_func_t, prp_del::H5P_prp_delete_func_t, copy::H5P_prp_copy_func_t, compare::H5P_prp_compare_func_t, close::H5P_prp_close_func_t)::herr_t "Error in h5p_register2 (not annotated)"

@cenum H5R_type_t::Int32 begin
    H5R_BADTYPE = -1
    H5R_OBJECT1 = 0
    H5R_DATASET_REGION1 = 1
    H5R_OBJECT2 = 2
    H5R_DATASET_REGION2 = 3
    H5R_ATTR = 4
    H5R_MAXTYPE = 5
end

@bind h5r_dereference2(obj_id::hid_t, oapl_id::hid_t, ref_type::H5R_type_t, ref::Ptr{Cvoid})::hid_t "Error in h5r_dereference2 (not annotated)"

@bind h5r_get_obj_type2(id::hid_t, ref_type::H5R_type_t, ref::Ptr{Cvoid}, obj_type::Ptr{H5O_type_t})::herr_t "Error in h5r_get_obj_type2 (not annotated)"

@bind h5s_encode2(obj_id::hid_t, buf::Ptr{Cvoid}, nalloc::Ptr{Csize_t}, fapl::hid_t)::herr_t "Error in h5s_encode2 (not annotated)"

@bind h5t_array_create2(base_id::hid_t, ndims::Cuint, dim::Ptr{hsize_t})::hid_t "Error in h5t_array_create2 (not annotated)"

@bind h5t_commit2(loc_id::hid_t, name::Ptr{Cchar}, type_id::hid_t, lcpl_id::hid_t, tcpl_id::hid_t, tapl_id::hid_t)::herr_t "Error in h5t_commit2 (not annotated)"

@bind h5t_get_array_dims2(type_id::hid_t, dims::Ptr{hsize_t})::Cint "Error in h5t_get_array_dims2 (not annotated)"

@bind h5t_open2(loc_id::hid_t, name::Ptr{Cchar}, tapl_id::hid_t)::hid_t "Error in h5t_open2 (not annotated)"

# typedef htri_t ( * H5Z_can_apply_func_t ) ( hid_t dcpl_id , hid_t type_id , hid_t space_id )
const H5Z_can_apply_func_t = Ptr{Cvoid}

# typedef herr_t ( * H5Z_set_local_func_t ) ( hid_t dcpl_id , hid_t type_id , hid_t space_id )
const H5Z_set_local_func_t = Ptr{Cvoid}

# typedef size_t ( * H5Z_func_t ) ( unsigned int flags , size_t cd_nelmts , const unsigned int cd_values [ ] , size_t nbytes , size_t * buf_size , void * * buf )
const H5Z_func_t = Ptr{Cvoid}

struct H5Z_class2_t
    version::Cint
    id::H5Z_filter_t
    encoder_present::Cuint
    decoder_present::Cuint
    name::Ptr{Cchar}
    can_apply::H5Z_can_apply_func_t
    set_local::H5Z_set_local_func_t
    filter::H5Z_func_t
end

@bind h5_check_version(majnum::Cuint, minnum::Cuint, relnum::Cuint)::herr_t "Error in h5_check_version (not annotated)"

@bind h5_open()::herr_t "Error in h5_open (not annotated)"

# typedef herr_t ( * H5E_auto1_t ) ( void * client_data )
const H5E_auto1_t = Ptr{Cvoid}

@bind h5e_auto_is_v2(err_stack::hid_t, is_stack::Ptr{Cuint})::herr_t "Error in h5e_auto_is_v2 (not annotated)"

@bind h5e_get_auto1(func::Ptr{H5E_auto1_t}, client_data::Ptr{Ptr{Cvoid}})::herr_t "Error in h5e_get_auto1 (not annotated)"

@bind h5e_set_auto1(func::H5E_auto1_t, client_data::Ptr{Cvoid})::herr_t "Error in h5e_set_auto1 (not annotated)"

const haddr_t = Culonglong

@bind h5vl__native_register()::hid_t "Error in h5vl__native_register (not annotated)"

@bind h5fd__core_init()::hid_t "Error in h5fd__core_init (not annotated)"

@bind h5fd__family_init()::hid_t "Error in h5fd__family_init (not annotated)"

@bind h5fd__log_init()::hid_t "Error in h5fd__log_init (not annotated)"

@bind h5fd__multi_init()::hid_t "Error in h5fd__multi_init (not annotated)"

@bind h5fd__sec2_init()::hid_t "Error in h5fd__sec2_init (not annotated)"

@bind h5fd__splitter_init()::hid_t "Error in h5fd__splitter_init (not annotated)"

@bind h5fd__stdio_init()::hid_t "Error in h5fd__stdio_init (not annotated)"

@bind h5vl__pass_through_register()::hid_t "Error in h5vl__pass_through_register (not annotated)"

const htri_t = Cint

const hssize_t = Clonglong

struct H5_alloc_stats_t
    total_alloc_bytes::Culonglong
    curr_alloc_bytes::Csize_t
    peak_alloc_bytes::Csize_t
    max_block_size::Csize_t
    total_alloc_blocks_count::Csize_t
    curr_alloc_blocks_count::Csize_t
    peak_alloc_blocks_count::Csize_t
end

@bind h5_close()::herr_t "Error in h5_close (not annotated)"

@bind h5_dont_atexit()::herr_t "Error in h5_dont_atexit (not annotated)"

@bind h5_garbage_collect()::herr_t "Error in h5_garbage_collect (not annotated)"

@bind h5_set_free_list_limits(reg_global_lim::Cint, reg_list_lim::Cint, arr_global_lim::Cint, arr_list_lim::Cint, blk_global_lim::Cint, blk_list_lim::Cint)::herr_t "Error in h5_set_free_list_limits (not annotated)"

@bind h5_get_free_list_sizes(reg_size::Ptr{Csize_t}, arr_size::Ptr{Csize_t}, blk_size::Ptr{Csize_t}, fac_size::Ptr{Csize_t})::herr_t "Error in h5_get_free_list_sizes (not annotated)"

@bind h5_get_alloc_stats(stats::Ptr{H5_alloc_stats_t})::herr_t "Error in h5_get_alloc_stats (not annotated)"

@bind h5_get_libversion(majnum::Ptr{Cuint}, minnum::Ptr{Cuint}, relnum::Ptr{Cuint})::herr_t "Error in h5_get_libversion (not annotated)"

@bind h5_is_library_threadsafe(is_ts::Ptr{hbool_t})::herr_t "Error in h5_is_library_threadsafe (not annotated)"

@bind h5_free_memory(mem::Ptr{Cvoid})::herr_t "Error in h5_free_memory (not annotated)"

@bind h5_allocate_memory(size::Csize_t, clear::hbool_t)::Ptr{Cvoid} "Error in h5_allocate_memory (not annotated)"

@bind h5_resize_memory(mem::Ptr{Cvoid}, size::Csize_t)::Ptr{Cvoid} "Error in h5_resize_memory (not annotated)"

@cenum H5I_type_t::Int32 begin
    H5I_UNINIT = -2
    H5I_BADID = -1
    H5I_FILE = 1
    H5I_GROUP = 2
    H5I_DATATYPE = 3
    H5I_DATASPACE = 4
    H5I_DATASET = 5
    H5I_MAP = 6
    H5I_ATTR = 7
    H5I_VFL = 8
    H5I_VOL = 9
    H5I_GENPROP_CLS = 10
    H5I_GENPROP_LST = 11
    H5I_ERROR_CLASS = 12
    H5I_ERROR_MSG = 13
    H5I_ERROR_STACK = 14
    H5I_SPACE_SEL_ITER = 15
    H5I_NTYPES = 16
end

# typedef herr_t ( * H5I_free_t ) ( void * )
const H5I_free_t = Ptr{Cvoid}

# typedef int ( * H5I_search_func_t ) ( void * obj , hid_t id , void * key )
const H5I_search_func_t = Ptr{Cvoid}

# typedef herr_t ( * H5I_iterate_func_t ) ( hid_t id , void * udata )
const H5I_iterate_func_t = Ptr{Cvoid}

@bind h5i_register(type::H5I_type_t, object::Ptr{Cvoid})::hid_t "Error in h5i_register (not annotated)"

@bind h5i_object_verify(id::hid_t, type::H5I_type_t)::Ptr{Cvoid} "Error in h5i_object_verify (not annotated)"

@bind h5i_remove_verify(id::hid_t, type::H5I_type_t)::Ptr{Cvoid} "Error in h5i_remove_verify (not annotated)"

@bind h5i_get_type(id::hid_t)::H5I_type_t "Error in h5i_get_type (not annotated)"

@bind h5i_get_file_id(id::hid_t)::hid_t "Error in h5i_get_file_id (not annotated)"

@bind h5i_get_name(id::hid_t, name::Ptr{Cchar}, size::Csize_t)::Cssize_t "Error in h5i_get_name (not annotated)"

@bind h5i_inc_ref(id::hid_t)::Cint "Error in h5i_inc_ref (not annotated)"

@bind h5i_dec_ref(id::hid_t)::Cint "Error in h5i_dec_ref (not annotated)"

@bind h5i_get_ref(id::hid_t)::Cint "Error in h5i_get_ref (not annotated)"

@bind h5i_register_type(hash_size::Csize_t, reserved::Cuint, free_func::H5I_free_t)::H5I_type_t "Error in h5i_register_type (not annotated)"

@bind h5i_clear_type(type::H5I_type_t, force::hbool_t)::herr_t "Error in h5i_clear_type (not annotated)"

@bind h5i_destroy_type(type::H5I_type_t)::herr_t "Error in h5i_destroy_type (not annotated)"

@bind h5i_inc_type_ref(type::H5I_type_t)::Cint "Error in h5i_inc_type_ref (not annotated)"

@bind h5i_dec_type_ref(type::H5I_type_t)::Cint "Error in h5i_dec_type_ref (not annotated)"

@bind h5i_get_type_ref(type::H5I_type_t)::Cint "Error in h5i_get_type_ref (not annotated)"

@bind h5i_search(type::H5I_type_t, func::H5I_search_func_t, key::Ptr{Cvoid})::Ptr{Cvoid} "Error in h5i_search (not annotated)"

@bind h5i_iterate(type::H5I_type_t, op::H5I_iterate_func_t, op_data::Ptr{Cvoid})::herr_t "Error in h5i_iterate (not annotated)"

@bind h5i_nmembers(type::H5I_type_t, num_members::Ptr{hsize_t})::herr_t "Error in h5i_nmembers (not annotated)"

@bind h5i_type_exists(type::H5I_type_t)::htri_t "Error in h5i_type_exists (not annotated)"

@bind h5i_is_valid(id::hid_t)::htri_t "Error in h5i_is_valid (not annotated)"

@cenum H5T_class_t::Int32 begin
    H5T_NO_CLASS = -1
    H5T_INTEGER = 0
    H5T_FLOAT = 1
    H5T_TIME = 2
    H5T_STRING = 3
    H5T_BITFIELD = 4
    H5T_OPAQUE = 5
    H5T_COMPOUND = 6
    H5T_REFERENCE = 7
    H5T_ENUM = 8
    H5T_VLEN = 9
    H5T_ARRAY = 10
    H5T_NCLASSES = 11
end

@cenum H5T_order_t::Int32 begin
    H5T_ORDER_ERROR = -1
    H5T_ORDER_LE = 0
    H5T_ORDER_BE = 1
    H5T_ORDER_VAX = 2
    H5T_ORDER_MIXED = 3
    H5T_ORDER_NONE = 4
end

@cenum H5T_sign_t::Int32 begin
    H5T_SGN_ERROR = -1
    H5T_SGN_NONE = 0
    H5T_SGN_2 = 1
    H5T_NSGN = 2
end

@cenum H5T_norm_t::Int32 begin
    H5T_NORM_ERROR = -1
    H5T_NORM_IMPLIED = 0
    H5T_NORM_MSBSET = 1
    H5T_NORM_NONE = 2
end

@cenum H5T_str_t::Int32 begin
    H5T_STR_ERROR = -1
    H5T_STR_NULLTERM = 0
    H5T_STR_NULLPAD = 1
    H5T_STR_SPACEPAD = 2
    H5T_STR_RESERVED_3 = 3
    H5T_STR_RESERVED_4 = 4
    H5T_STR_RESERVED_5 = 5
    H5T_STR_RESERVED_6 = 6
    H5T_STR_RESERVED_7 = 7
    H5T_STR_RESERVED_8 = 8
    H5T_STR_RESERVED_9 = 9
    H5T_STR_RESERVED_10 = 10
    H5T_STR_RESERVED_11 = 11
    H5T_STR_RESERVED_12 = 12
    H5T_STR_RESERVED_13 = 13
    H5T_STR_RESERVED_14 = 14
    H5T_STR_RESERVED_15 = 15
end

@cenum H5T_pad_t::Int32 begin
    H5T_PAD_ERROR = -1
    H5T_PAD_ZERO = 0
    H5T_PAD_ONE = 1
    H5T_PAD_BACKGROUND = 2
    H5T_NPAD = 3
end

@cenum H5T_cmd_t::UInt32 begin
    H5T_CONV_INIT = 0
    H5T_CONV_CONV = 1
    H5T_CONV_FREE = 2
end

@cenum H5T_bkg_t::UInt32 begin
    H5T_BKG_NO = 0
    H5T_BKG_TEMP = 1
    H5T_BKG_YES = 2
end

struct H5T_cdata_t
    command::H5T_cmd_t
    need_bkg::H5T_bkg_t
    recalc::hbool_t
    priv::Ptr{Cvoid}
end

@cenum H5T_pers_t::Int32 begin
    H5T_PERS_DONTCARE = -1
    H5T_PERS_HARD = 0
    H5T_PERS_SOFT = 1
end

@cenum H5T_direction_t::UInt32 begin
    H5T_DIR_DEFAULT = 0
    H5T_DIR_ASCEND = 1
    H5T_DIR_DESCEND = 2
end

@cenum H5T_conv_except_t::UInt32 begin
    H5T_CONV_EXCEPT_RANGE_HI = 0
    H5T_CONV_EXCEPT_RANGE_LOW = 1
    H5T_CONV_EXCEPT_PRECISION = 2
    H5T_CONV_EXCEPT_TRUNCATE = 3
    H5T_CONV_EXCEPT_PINF = 4
    H5T_CONV_EXCEPT_NINF = 5
    H5T_CONV_EXCEPT_NAN = 6
end

@cenum H5T_conv_ret_t::Int32 begin
    H5T_CONV_ABORT = -1
    H5T_CONV_UNHANDLED = 0
    H5T_CONV_HANDLED = 1
end

struct hvl_t
    len::Csize_t
    p::Ptr{Cvoid}
end

# typedef herr_t ( * H5T_conv_t ) ( hid_t src_id , hid_t dst_id , H5T_cdata_t * cdata , size_t nelmts , size_t buf_stride , size_t bkg_stride , void * buf , void * bkg , hid_t dset_xfer_plist )
const H5T_conv_t = Ptr{Cvoid}

# typedef H5T_conv_ret_t ( * H5T_conv_except_func_t ) ( H5T_conv_except_t except_type , hid_t src_id , hid_t dst_id , void * src_buf , void * dst_buf , void * user_data )
const H5T_conv_except_func_t = Ptr{Cvoid}

@bind h5t_create(type::H5T_class_t, size::Csize_t)::hid_t "Error in h5t_create (not annotated)"

@bind h5t_copy(type_id::hid_t)::hid_t "Error in h5t_copy (not annotated)"

@bind h5t_close(type_id::hid_t)::herr_t "Error in h5t_close (not annotated)"

@bind h5t_equal(type1_id::hid_t, type2_id::hid_t)::htri_t "Error in h5t_equal (not annotated)"

@bind h5t_lock(type_id::hid_t)::herr_t "Error in h5t_lock (not annotated)"

@bind h5t_commit_anon(loc_id::hid_t, type_id::hid_t, tcpl_id::hid_t, tapl_id::hid_t)::herr_t "Error in h5t_commit_anon (not annotated)"

@bind h5t_get_create_plist(type_id::hid_t)::hid_t "Error in h5t_get_create_plist (not annotated)"

@bind h5t_committed(type_id::hid_t)::htri_t "Error in h5t_committed (not annotated)"

@bind h5t_encode(obj_id::hid_t, buf::Ptr{Cvoid}, nalloc::Ptr{Csize_t})::herr_t "Error in h5t_encode (not annotated)"

@bind h5t_decode(buf::Ptr{Cvoid})::hid_t "Error in h5t_decode (not annotated)"

@bind h5t_flush(type_id::hid_t)::herr_t "Error in h5t_flush (not annotated)"

@bind h5t_refresh(type_id::hid_t)::herr_t "Error in h5t_refresh (not annotated)"

@bind h5t_insert(parent_id::hid_t, name::Ptr{Cchar}, offset::Csize_t, member_id::hid_t)::herr_t "Error in h5t_insert (not annotated)"

@bind h5t_pack(type_id::hid_t)::herr_t "Error in h5t_pack (not annotated)"

@bind h5t_enum_create(base_id::hid_t)::hid_t "Error in h5t_enum_create (not annotated)"

@bind h5t_enum_insert(type::hid_t, name::Ptr{Cchar}, value::Ptr{Cvoid})::herr_t "Error in h5t_enum_insert (not annotated)"

@bind h5t_enum_nameof(type::hid_t, value::Ptr{Cvoid}, name::Ptr{Cchar}, size::Csize_t)::herr_t "Error in h5t_enum_nameof (not annotated)"

@bind h5t_enum_valueof(type::hid_t, name::Ptr{Cchar}, value::Ptr{Cvoid})::herr_t "Error in h5t_enum_valueof (not annotated)"

@bind h5t_vlen_create(base_id::hid_t)::hid_t "Error in h5t_vlen_create (not annotated)"

@bind h5t_get_array_ndims(type_id::hid_t)::Cint "Error in h5t_get_array_ndims (not annotated)"

@bind h5t_set_tag(type::hid_t, tag::Ptr{Cchar})::herr_t "Error in h5t_set_tag (not annotated)"

@bind h5t_get_tag(type::hid_t)::Ptr{Cchar} "Error in h5t_get_tag (not annotated)"

@bind h5t_get_super(type::hid_t)::hid_t "Error in h5t_get_super (not annotated)"

@bind h5t_get_class(type_id::hid_t)::H5T_class_t "Error in h5t_get_class (not annotated)"

@bind h5t_detect_class(type_id::hid_t, cls::H5T_class_t)::htri_t "Error in h5t_detect_class (not annotated)"

@bind h5t_get_size(type_id::hid_t)::Csize_t "Error in h5t_get_size (not annotated)"

@bind h5t_get_order(type_id::hid_t)::H5T_order_t "Error in h5t_get_order (not annotated)"

@bind h5t_get_precision(type_id::hid_t)::Csize_t "Error in h5t_get_precision (not annotated)"

@bind h5t_get_offset(type_id::hid_t)::Cint "Error in h5t_get_offset (not annotated)"

@bind h5t_get_pad(type_id::hid_t, lsb::Ptr{H5T_pad_t}, msb::Ptr{H5T_pad_t})::herr_t "Error in h5t_get_pad (not annotated)"

@bind h5t_get_sign(type_id::hid_t)::H5T_sign_t "Error in h5t_get_sign (not annotated)"

@bind h5t_get_fields(type_id::hid_t, spos::Ptr{Csize_t}, epos::Ptr{Csize_t}, esize::Ptr{Csize_t}, mpos::Ptr{Csize_t}, msize::Ptr{Csize_t})::herr_t "Error in h5t_get_fields (not annotated)"

@bind h5t_get_ebias(type_id::hid_t)::Csize_t "Error in h5t_get_ebias (not annotated)"

@bind h5t_get_norm(type_id::hid_t)::H5T_norm_t "Error in h5t_get_norm (not annotated)"

@bind h5t_get_inpad(type_id::hid_t)::H5T_pad_t "Error in h5t_get_inpad (not annotated)"

@bind h5t_get_strpad(type_id::hid_t)::H5T_str_t "Error in h5t_get_strpad (not annotated)"

@bind h5t_get_nmembers(type_id::hid_t)::Cint "Error in h5t_get_nmembers (not annotated)"

@bind h5t_get_member_name(type_id::hid_t, membno::Cuint)::Ptr{Cchar} "Error in h5t_get_member_name (not annotated)"

@bind h5t_get_member_index(type_id::hid_t, name::Ptr{Cchar})::Cint "Error in h5t_get_member_index (not annotated)"

@bind h5t_get_member_offset(type_id::hid_t, membno::Cuint)::Csize_t "Error in h5t_get_member_offset (not annotated)"

@bind h5t_get_member_class(type_id::hid_t, membno::Cuint)::H5T_class_t "Error in h5t_get_member_class (not annotated)"

@bind h5t_get_member_type(type_id::hid_t, membno::Cuint)::hid_t "Error in h5t_get_member_type (not annotated)"

@bind h5t_get_member_value(type_id::hid_t, membno::Cuint, value::Ptr{Cvoid})::herr_t "Error in h5t_get_member_value (not annotated)"

@bind h5t_get_cset(type_id::hid_t)::H5T_cset_t "Error in h5t_get_cset (not annotated)"

@bind h5t_is_variable_str(type_id::hid_t)::htri_t "Error in h5t_is_variable_str (not annotated)"

@bind h5t_get_native_type(type_id::hid_t, direction::H5T_direction_t)::hid_t "Error in h5t_get_native_type (not annotated)"

@bind h5t_set_size(type_id::hid_t, size::Csize_t)::herr_t "Error in h5t_set_size (not annotated)"

@bind h5t_set_order(type_id::hid_t, order::H5T_order_t)::herr_t "Error in h5t_set_order (not annotated)"

@bind h5t_set_precision(type_id::hid_t, prec::Csize_t)::herr_t "Error in h5t_set_precision (not annotated)"

@bind h5t_set_offset(type_id::hid_t, offset::Csize_t)::herr_t "Error in h5t_set_offset (not annotated)"

@bind h5t_set_pad(type_id::hid_t, lsb::H5T_pad_t, msb::H5T_pad_t)::herr_t "Error in h5t_set_pad (not annotated)"

@bind h5t_set_sign(type_id::hid_t, sign::H5T_sign_t)::herr_t "Error in h5t_set_sign (not annotated)"

@bind h5t_set_fields(type_id::hid_t, spos::Csize_t, epos::Csize_t, esize::Csize_t, mpos::Csize_t, msize::Csize_t)::herr_t "Error in h5t_set_fields (not annotated)"

@bind h5t_set_ebias(type_id::hid_t, ebias::Csize_t)::herr_t "Error in h5t_set_ebias (not annotated)"

@bind h5t_set_norm(type_id::hid_t, norm::H5T_norm_t)::herr_t "Error in h5t_set_norm (not annotated)"

@bind h5t_set_inpad(type_id::hid_t, pad::H5T_pad_t)::herr_t "Error in h5t_set_inpad (not annotated)"

@bind h5t_set_cset(type_id::hid_t, cset::H5T_cset_t)::herr_t "Error in h5t_set_cset (not annotated)"

@bind h5t_set_strpad(type_id::hid_t, strpad::H5T_str_t)::herr_t "Error in h5t_set_strpad (not annotated)"

@bind h5t_register(pers::H5T_pers_t, name::Ptr{Cchar}, src_id::hid_t, dst_id::hid_t, func::H5T_conv_t)::herr_t "Error in h5t_register (not annotated)"

@bind h5t_unregister(pers::H5T_pers_t, name::Ptr{Cchar}, src_id::hid_t, dst_id::hid_t, func::H5T_conv_t)::herr_t "Error in h5t_unregister (not annotated)"

@bind h5t_find(src_id::hid_t, dst_id::hid_t, pcdata::Ptr{Ptr{H5T_cdata_t}})::H5T_conv_t "Error in h5t_find (not annotated)"

@bind h5t_compiler_conv(src_id::hid_t, dst_id::hid_t)::htri_t "Error in h5t_compiler_conv (not annotated)"

@bind h5t_convert(src_id::hid_t, dst_id::hid_t, nelmts::Csize_t, buf::Ptr{Cvoid}, background::Ptr{Cvoid}, plist_id::hid_t)::herr_t "Error in h5t_convert (not annotated)"

@bind h5t_reclaim(type_id::hid_t, space_id::hid_t, plist_id::hid_t, buf::Ptr{Cvoid})::herr_t "Error in h5t_reclaim (not annotated)"

@bind h5t_commit1(loc_id::hid_t, name::Ptr{Cchar}, type_id::hid_t)::herr_t "Error in h5t_commit1 (not annotated)"

@bind h5t_open1(loc_id::hid_t, name::Ptr{Cchar})::hid_t "Error in h5t_open1 (not annotated)"

@bind h5t_array_create1(base_id::hid_t, ndims::Cint, dim::Ptr{hsize_t}, perm::Ptr{Cint})::hid_t "Error in h5t_array_create1 (not annotated)"

@bind h5t_get_array_dims1(type_id::hid_t, dims::Ptr{hsize_t}, perm::Ptr{Cint})::Cint "Error in h5t_get_array_dims1 (not annotated)"

# typedef herr_t ( * H5L_create_func_t ) ( const char * link_name , hid_t loc_group , const void * lnkdata , size_t lnkdata_size , hid_t lcpl_id )
const H5L_create_func_t = Ptr{Cvoid}

# typedef herr_t ( * H5L_move_func_t ) ( const char * new_name , hid_t new_loc , const void * lnkdata , size_t lnkdata_size )
const H5L_move_func_t = Ptr{Cvoid}

# typedef herr_t ( * H5L_copy_func_t ) ( const char * new_name , hid_t new_loc , const void * lnkdata , size_t lnkdata_size )
const H5L_copy_func_t = Ptr{Cvoid}

# typedef hid_t ( * H5L_traverse_func_t ) ( const char * link_name , hid_t cur_group , const void * lnkdata , size_t lnkdata_size , hid_t lapl_id , hid_t dxpl_id )
const H5L_traverse_func_t = Ptr{Cvoid}

# typedef herr_t ( * H5L_delete_func_t ) ( const char * link_name , hid_t file , const void * lnkdata , size_t lnkdata_size )
const H5L_delete_func_t = Ptr{Cvoid}

# typedef ssize_t ( * H5L_query_func_t ) ( const char * link_name , const void * lnkdata , size_t lnkdata_size , void * buf /*out*/ , size_t buf_size )
const H5L_query_func_t = Ptr{Cvoid}

struct H5L_class_t
    version::Cint
    id::H5L_type_t
    comment::Ptr{Cchar}
    create_func::H5L_create_func_t
    move_func::H5L_move_func_t
    copy_func::H5L_copy_func_t
    trav_func::H5L_traverse_func_t
    del_func::H5L_delete_func_t
    query_func::H5L_query_func_t
end

# typedef herr_t ( * H5L_elink_traverse_t ) ( const char * parent_file_name , const char * parent_group_name , const char * child_file_name , const char * child_object_name , unsigned * acc_flags , hid_t fapl_id , void * op_data )
const H5L_elink_traverse_t = Ptr{Cvoid}

@bind h5l_move(src_loc::hid_t, src_name::Ptr{Cchar}, dst_loc::hid_t, dst_name::Ptr{Cchar}, lcpl_id::hid_t, lapl_id::hid_t)::herr_t "Error in h5l_move (not annotated)"

@bind h5l_copy(src_loc::hid_t, src_name::Ptr{Cchar}, dst_loc::hid_t, dst_name::Ptr{Cchar}, lcpl_id::hid_t, lapl_id::hid_t)::herr_t "Error in h5l_copy (not annotated)"

@bind h5l_create_hard(cur_loc::hid_t, cur_name::Ptr{Cchar}, dst_loc::hid_t, dst_name::Ptr{Cchar}, lcpl_id::hid_t, lapl_id::hid_t)::herr_t "Error in h5l_create_hard (not annotated)"

@bind h5l_create_soft(link_target::Ptr{Cchar}, link_loc_id::hid_t, link_name::Ptr{Cchar}, lcpl_id::hid_t, lapl_id::hid_t)::herr_t "Error in h5l_create_soft (not annotated)"

@bind h5l_delete(loc_id::hid_t, name::Ptr{Cchar}, lapl_id::hid_t)::herr_t "Error in h5l_delete (not annotated)"

@bind h5l_delete_by_idx(loc_id::hid_t, group_name::Ptr{Cchar}, idx_type::H5_index_t, order::H5_iter_order_t, n::hsize_t, lapl_id::hid_t)::herr_t "Error in h5l_delete_by_idx (not annotated)"

@bind h5l_get_val(loc_id::hid_t, name::Ptr{Cchar}, buf::Ptr{Cvoid}, size::Csize_t, lapl_id::hid_t)::herr_t "Error in h5l_get_val (not annotated)"

@bind h5l_get_val_by_idx(loc_id::hid_t, group_name::Ptr{Cchar}, idx_type::H5_index_t, order::H5_iter_order_t, n::hsize_t, buf::Ptr{Cvoid}, size::Csize_t, lapl_id::hid_t)::herr_t "Error in h5l_get_val_by_idx (not annotated)"

@bind h5l_exists(loc_id::hid_t, name::Ptr{Cchar}, lapl_id::hid_t)::htri_t "Error in h5l_exists (not annotated)"

@bind h5l_get_name_by_idx(loc_id::hid_t, group_name::Ptr{Cchar}, idx_type::H5_index_t, order::H5_iter_order_t, n::hsize_t, name::Ptr{Cchar}, size::Csize_t, lapl_id::hid_t)::Cssize_t "Error in h5l_get_name_by_idx (not annotated)"

@bind h5l_create_ud(link_loc_id::hid_t, link_name::Ptr{Cchar}, link_type::H5L_type_t, udata::Ptr{Cvoid}, udata_size::Csize_t, lcpl_id::hid_t, lapl_id::hid_t)::herr_t "Error in h5l_create_ud (not annotated)"

@bind h5l_register(cls::Ptr{H5L_class_t})::herr_t "Error in h5l_register (not annotated)"

@bind h5l_unregister(id::H5L_type_t)::herr_t "Error in h5l_unregister (not annotated)"

@bind h5l_is_registered(id::H5L_type_t)::htri_t "Error in h5l_is_registered (not annotated)"

@bind h5l_unpack_elink_val(ext_linkval::Ptr{Cvoid}, link_size::Csize_t, flags::Ptr{Cuint}, filename::Ptr{Ptr{Cchar}}, obj_path::Ptr{Ptr{Cchar}})::herr_t "Error in h5l_unpack_elink_val (not annotated)"

@bind h5l_create_external(file_name::Ptr{Cchar}, obj_name::Ptr{Cchar}, link_loc_id::hid_t, link_name::Ptr{Cchar}, lcpl_id::hid_t, lapl_id::hid_t)::herr_t "Error in h5l_create_external (not annotated)"

struct var"##Ctag#296"
    data::NTuple{8, UInt8}
end

function Base.getproperty(x::Ptr{var"##Ctag#296"}, f::Symbol)
    f === :address && return Ptr{haddr_t}(x + 0)
    f === :val_size && return Ptr{Csize_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#296", f::Symbol)
    r = Ref{var"##Ctag#296"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#296"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#296"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct H5L_info1_t
    type::H5L_type_t
    corder_valid::hbool_t
    corder::Int64
    cset::H5T_cset_t
    u::var"##Ctag#296"
end

# typedef hid_t ( * H5L_traverse_0_func_t ) ( const char * link_name , hid_t cur_group , const void * lnkdata , size_t lnkdata_size , hid_t lapl_id )
const H5L_traverse_0_func_t = Ptr{Cvoid}

struct H5L_class_0_t
    version::Cint
    id::H5L_type_t
    comment::Ptr{Cchar}
    create_func::H5L_create_func_t
    move_func::H5L_move_func_t
    copy_func::H5L_copy_func_t
    trav_func::H5L_traverse_0_func_t
    del_func::H5L_delete_func_t
    query_func::H5L_query_func_t
end

# typedef herr_t ( * H5L_iterate1_t ) ( hid_t group , const char * name , const H5L_info1_t * info , void * op_data )
const H5L_iterate1_t = Ptr{Cvoid}

@bind h5l_get_info1(loc_id::hid_t, name::Ptr{Cchar}, linfo::Ptr{H5L_info1_t}, lapl_id::hid_t)::herr_t "Error in h5l_get_info1 (not annotated)"

@bind h5l_get_info_by_idx1(loc_id::hid_t, group_name::Ptr{Cchar}, idx_type::H5_index_t, order::H5_iter_order_t, n::hsize_t, linfo::Ptr{H5L_info1_t}, lapl_id::hid_t)::herr_t "Error in h5l_get_info_by_idx1 (not annotated)"

@bind h5l_iterate1(grp_id::hid_t, idx_type::H5_index_t, order::H5_iter_order_t, idx::Ptr{hsize_t}, op::H5L_iterate1_t, op_data::Ptr{Cvoid})::herr_t "Error in h5l_iterate1 (not annotated)"

@bind h5l_iterate_by_name1(loc_id::hid_t, group_name::Ptr{Cchar}, idx_type::H5_index_t, order::H5_iter_order_t, idx::Ptr{hsize_t}, op::H5L_iterate1_t, op_data::Ptr{Cvoid}, lapl_id::hid_t)::herr_t "Error in h5l_iterate_by_name1 (not annotated)"

@bind h5l_visit1(grp_id::hid_t, idx_type::H5_index_t, order::H5_iter_order_t, op::H5L_iterate1_t, op_data::Ptr{Cvoid})::herr_t "Error in h5l_visit1 (not annotated)"

@bind h5l_visit_by_name1(loc_id::hid_t, group_name::Ptr{Cchar}, idx_type::H5_index_t, order::H5_iter_order_t, op::H5L_iterate1_t, op_data::Ptr{Cvoid}, lapl_id::hid_t)::herr_t "Error in h5l_visit_by_name1 (not annotated)"

struct var"##Ctag#291"
    total::hsize_t
    meta::hsize_t
    mesg::hsize_t
    free::hsize_t
end
function Base.getproperty(x::Ptr{var"##Ctag#291"}, f::Symbol)
    f === :total && return Ptr{hsize_t}(x + 0)
    f === :meta && return Ptr{hsize_t}(x + 8)
    f === :mesg && return Ptr{hsize_t}(x + 16)
    f === :free && return Ptr{hsize_t}(x + 24)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#291", f::Symbol)
    r = Ref{var"##Ctag#291"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#291"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#291"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct var"##Ctag#292"
    present::UInt64
    shared::UInt64
end
function Base.getproperty(x::Ptr{var"##Ctag#292"}, f::Symbol)
    f === :present && return Ptr{UInt64}(x + 0)
    f === :shared && return Ptr{UInt64}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#292", f::Symbol)
    r = Ref{var"##Ctag#292"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#292"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#292"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct H5O_hdr_info_t
    data::NTuple{64, UInt8}
end

function Base.getproperty(x::Ptr{H5O_hdr_info_t}, f::Symbol)
    f === :version && return Ptr{Cuint}(x + 0)
    f === :nmesgs && return Ptr{Cuint}(x + 4)
    f === :nchunks && return Ptr{Cuint}(x + 8)
    f === :flags && return Ptr{Cuint}(x + 12)
    f === :space && return Ptr{var"##Ctag#291"}(x + 16)
    f === :mesg && return Ptr{var"##Ctag#292"}(x + 48)
    return getfield(x, f)
end

function Base.getproperty(x::H5O_hdr_info_t, f::Symbol)
    r = Ref{H5O_hdr_info_t}(x)
    ptr = Base.unsafe_convert(Ptr{H5O_hdr_info_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{H5O_hdr_info_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct var"##Ctag#290"
    obj::H5_ih_info_t
    attr::H5_ih_info_t
end
function Base.getproperty(x::Ptr{var"##Ctag#290"}, f::Symbol)
    f === :obj && return Ptr{H5_ih_info_t}(x + 0)
    f === :attr && return Ptr{H5_ih_info_t}(x + 16)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#290", f::Symbol)
    r = Ref{var"##Ctag#290"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#290"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#290"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct H5O_native_info_t
    data::NTuple{96, UInt8}
end

function Base.getproperty(x::Ptr{H5O_native_info_t}, f::Symbol)
    f === :hdr && return Ptr{H5O_hdr_info_t}(x + 0)
    f === :meta_size && return Ptr{var"##Ctag#290"}(x + 64)
    return getfield(x, f)
end

function Base.getproperty(x::H5O_native_info_t, f::Symbol)
    r = Ref{H5O_native_info_t}(x)
    ptr = Base.unsafe_convert(Ptr{H5O_native_info_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{H5O_native_info_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

const H5O_msg_crt_idx_t = UInt32

@cenum H5O_mcdt_search_ret_t::Int32 begin
    H5O_MCDT_SEARCH_ERROR = -1
    H5O_MCDT_SEARCH_CONT = 0
    H5O_MCDT_SEARCH_STOP = 1
end

# typedef H5O_mcdt_search_ret_t ( * H5O_mcdt_search_cb_t ) ( void * op_data )
const H5O_mcdt_search_cb_t = Ptr{Cvoid}

@bind h5o_open(loc_id::hid_t, name::Ptr{Cchar}, lapl_id::hid_t)::hid_t "Error in h5o_open (not annotated)"

@bind h5o_open_by_token(loc_id::hid_t, token::H5O_token_t)::hid_t "Error in h5o_open_by_token (not annotated)"

@bind h5o_open_by_idx(loc_id::hid_t, group_name::Ptr{Cchar}, idx_type::H5_index_t, order::H5_iter_order_t, n::hsize_t, lapl_id::hid_t)::hid_t "Error in h5o_open_by_idx (not annotated)"

@bind h5o_exists_by_name(loc_id::hid_t, name::Ptr{Cchar}, lapl_id::hid_t)::htri_t "Error in h5o_exists_by_name (not annotated)"

@bind h5o_get_native_info(loc_id::hid_t, oinfo::Ptr{H5O_native_info_t}, fields::Cuint)::herr_t "Error in h5o_get_native_info (not annotated)"

@bind h5o_get_native_info_by_name(loc_id::hid_t, name::Ptr{Cchar}, oinfo::Ptr{H5O_native_info_t}, fields::Cuint, lapl_id::hid_t)::herr_t "Error in h5o_get_native_info_by_name (not annotated)"

@bind h5o_get_native_info_by_idx(loc_id::hid_t, group_name::Ptr{Cchar}, idx_type::H5_index_t, order::H5_iter_order_t, n::hsize_t, oinfo::Ptr{H5O_native_info_t}, fields::Cuint, lapl_id::hid_t)::herr_t "Error in h5o_get_native_info_by_idx (not annotated)"

@bind h5o_link(obj_id::hid_t, new_loc_id::hid_t, new_name::Ptr{Cchar}, lcpl_id::hid_t, lapl_id::hid_t)::herr_t "Error in h5o_link (not annotated)"

@bind h5o_incr_refcount(object_id::hid_t)::herr_t "Error in h5o_incr_refcount (not annotated)"

@bind h5o_decr_refcount(object_id::hid_t)::herr_t "Error in h5o_decr_refcount (not annotated)"

@bind h5o_copy(src_loc_id::hid_t, src_name::Ptr{Cchar}, dst_loc_id::hid_t, dst_name::Ptr{Cchar}, ocpypl_id::hid_t, lcpl_id::hid_t)::herr_t "Error in h5o_copy (not annotated)"

@bind h5o_set_comment(obj_id::hid_t, comment::Ptr{Cchar})::herr_t "Error in h5o_set_comment (not annotated)"

@bind h5o_set_comment_by_name(loc_id::hid_t, name::Ptr{Cchar}, comment::Ptr{Cchar}, lapl_id::hid_t)::herr_t "Error in h5o_set_comment_by_name (not annotated)"

@bind h5o_get_comment(obj_id::hid_t, comment::Ptr{Cchar}, bufsize::Csize_t)::Cssize_t "Error in h5o_get_comment (not annotated)"

@bind h5o_get_comment_by_name(loc_id::hid_t, name::Ptr{Cchar}, comment::Ptr{Cchar}, bufsize::Csize_t, lapl_id::hid_t)::Cssize_t "Error in h5o_get_comment_by_name (not annotated)"

@bind h5o_close(object_id::hid_t)::herr_t "Error in h5o_close (not annotated)"

@bind h5o_flush(obj_id::hid_t)::herr_t "Error in h5o_flush (not annotated)"

@bind h5o_refresh(oid::hid_t)::herr_t "Error in h5o_refresh (not annotated)"

@bind h5o_disable_mdc_flushes(object_id::hid_t)::herr_t "Error in h5o_disable_mdc_flushes (not annotated)"

@bind h5o_enable_mdc_flushes(object_id::hid_t)::herr_t "Error in h5o_enable_mdc_flushes (not annotated)"

@bind h5o_are_mdc_flushes_disabled(object_id::hid_t, are_disabled::Ptr{hbool_t})::herr_t "Error in h5o_are_mdc_flushes_disabled (not annotated)"

@bind h5o_token_cmp(loc_id::hid_t, token1::Ptr{H5O_token_t}, token2::Ptr{H5O_token_t}, cmp_value::Ptr{Cint})::herr_t "Error in h5o_token_cmp (not annotated)"

@bind h5o_token_to_str(loc_id::hid_t, token::Ptr{H5O_token_t}, token_str::Ptr{Ptr{Cchar}})::herr_t "Error in h5o_token_to_str (not annotated)"

@bind h5o_token_from_str(loc_id::hid_t, token_str::Ptr{Cchar}, token::Ptr{H5O_token_t})::herr_t "Error in h5o_token_from_str (not annotated)"

struct H5O_stat_t
    size::hsize_t
    free::hsize_t
    nmesgs::Cuint
    nchunks::Cuint
end

struct var"##Ctag#294"
    obj::H5_ih_info_t
    attr::H5_ih_info_t
end
function Base.getproperty(x::Ptr{var"##Ctag#294"}, f::Symbol)
    f === :obj && return Ptr{H5_ih_info_t}(x + 0)
    f === :attr && return Ptr{H5_ih_info_t}(x + 16)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#294", f::Symbol)
    r = Ref{var"##Ctag#294"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#294"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#294"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct H5O_info1_t
    data::NTuple{160, UInt8}
end

function Base.getproperty(x::Ptr{H5O_info1_t}, f::Symbol)
    f === :fileno && return Ptr{Culong}(x + 0)
    f === :addr && return Ptr{haddr_t}(x + 8)
    f === :type && return Ptr{H5O_type_t}(x + 16)
    f === :rc && return Ptr{Cuint}(x + 20)
    f === :atime && return Ptr{time_t}(x + 24)
    f === :mtime && return Ptr{time_t}(x + 32)
    f === :ctime && return Ptr{time_t}(x + 40)
    f === :btime && return Ptr{time_t}(x + 48)
    f === :num_attrs && return Ptr{hsize_t}(x + 56)
    f === :hdr && return Ptr{H5O_hdr_info_t}(x + 64)
    f === :meta_size && return Ptr{var"##Ctag#294"}(x + 128)
    return getfield(x, f)
end

function Base.getproperty(x::H5O_info1_t, f::Symbol)
    r = Ref{H5O_info1_t}(x)
    ptr = Base.unsafe_convert(Ptr{H5O_info1_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{H5O_info1_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

# typedef herr_t ( * H5O_iterate1_t ) ( hid_t obj , const char * name , const H5O_info1_t * info , void * op_data )
const H5O_iterate1_t = Ptr{Cvoid}

@bind h5o_open_by_addr(loc_id::hid_t, addr::haddr_t)::hid_t "Error in h5o_open_by_addr (not annotated)"

@bind h5o_get_info1(loc_id::hid_t, oinfo::Ptr{H5O_info1_t})::herr_t "Error in h5o_get_info1 (not annotated)"

@bind h5o_get_info_by_name1(loc_id::hid_t, name::Ptr{Cchar}, oinfo::Ptr{H5O_info1_t}, lapl_id::hid_t)::herr_t "Error in h5o_get_info_by_name1 (not annotated)"

@bind h5o_get_info_by_idx1(loc_id::hid_t, group_name::Ptr{Cchar}, idx_type::H5_index_t, order::H5_iter_order_t, n::hsize_t, oinfo::Ptr{H5O_info1_t}, lapl_id::hid_t)::herr_t "Error in h5o_get_info_by_idx1 (not annotated)"

@bind h5o_get_info2(loc_id::hid_t, oinfo::Ptr{H5O_info1_t}, fields::Cuint)::herr_t "Error in h5o_get_info2 (not annotated)"

@bind h5o_get_info_by_name2(loc_id::hid_t, name::Ptr{Cchar}, oinfo::Ptr{H5O_info1_t}, fields::Cuint, lapl_id::hid_t)::herr_t "Error in h5o_get_info_by_name2 (not annotated)"

@bind h5o_get_info_by_idx2(loc_id::hid_t, group_name::Ptr{Cchar}, idx_type::H5_index_t, order::H5_iter_order_t, n::hsize_t, oinfo::Ptr{H5O_info1_t}, fields::Cuint, lapl_id::hid_t)::herr_t "Error in h5o_get_info_by_idx2 (not annotated)"

@bind h5o_visit1(obj_id::hid_t, idx_type::H5_index_t, order::H5_iter_order_t, op::H5O_iterate1_t, op_data::Ptr{Cvoid})::herr_t "Error in h5o_visit1 (not annotated)"

@bind h5o_visit_by_name1(loc_id::hid_t, obj_name::Ptr{Cchar}, idx_type::H5_index_t, order::H5_iter_order_t, op::H5O_iterate1_t, op_data::Ptr{Cvoid}, lapl_id::hid_t)::herr_t "Error in h5o_visit_by_name1 (not annotated)"

@bind h5o_visit2(obj_id::hid_t, idx_type::H5_index_t, order::H5_iter_order_t, op::H5O_iterate1_t, op_data::Ptr{Cvoid}, fields::Cuint)::herr_t "Error in h5o_visit2 (not annotated)"

@bind h5o_visit_by_name2(loc_id::hid_t, obj_name::Ptr{Cchar}, idx_type::H5_index_t, order::H5_iter_order_t, op::H5O_iterate1_t, op_data::Ptr{Cvoid}, fields::Cuint, lapl_id::hid_t)::herr_t "Error in h5o_visit_by_name2 (not annotated)"

struct H5A_info_t
    corder_valid::hbool_t
    corder::H5O_msg_crt_idx_t
    cset::H5T_cset_t
    data_size::hsize_t
end

@bind h5a_close(attr_id::hid_t)::herr_t "Error in h5a_close (not annotated)"

@bind h5a_create_by_name(loc_id::hid_t, obj_name::Ptr{Cchar}, attr_name::Ptr{Cchar}, type_id::hid_t, space_id::hid_t, acpl_id::hid_t, aapl_id::hid_t, lapl_id::hid_t)::hid_t "Error in h5a_create_by_name (not annotated)"

@bind h5a_delete(loc_id::hid_t, attr_name::Ptr{Cchar})::herr_t "Error in h5a_delete (not annotated)"

@bind h5a_delete_by_idx(loc_id::hid_t, obj_name::Ptr{Cchar}, idx_type::H5_index_t, order::H5_iter_order_t, n::hsize_t, lapl_id::hid_t)::herr_t "Error in h5a_delete_by_idx (not annotated)"

@bind h5a_delete_by_name(loc_id::hid_t, obj_name::Ptr{Cchar}, attr_name::Ptr{Cchar}, lapl_id::hid_t)::herr_t "Error in h5a_delete_by_name (not annotated)"

@bind h5a_exists(obj_id::hid_t, attr_name::Ptr{Cchar})::htri_t "Error in h5a_exists (not annotated)"

@bind h5a_exists_by_name(obj_id::hid_t, obj_name::Ptr{Cchar}, attr_name::Ptr{Cchar}, lapl_id::hid_t)::htri_t "Error in h5a_exists_by_name (not annotated)"

@bind h5a_get_create_plist(attr_id::hid_t)::hid_t "Error in h5a_get_create_plist (not annotated)"

@bind h5a_get_info(attr_id::hid_t, ainfo::Ptr{H5A_info_t})::herr_t "Error in h5a_get_info (not annotated)"

@bind h5a_get_info_by_idx(loc_id::hid_t, obj_name::Ptr{Cchar}, idx_type::H5_index_t, order::H5_iter_order_t, n::hsize_t, ainfo::Ptr{H5A_info_t}, lapl_id::hid_t)::herr_t "Error in h5a_get_info_by_idx (not annotated)"

@bind h5a_get_info_by_name(loc_id::hid_t, obj_name::Ptr{Cchar}, attr_name::Ptr{Cchar}, ainfo::Ptr{H5A_info_t}, lapl_id::hid_t)::herr_t "Error in h5a_get_info_by_name (not annotated)"

@bind h5a_get_name(attr_id::hid_t, buf_size::Csize_t, buf::Ptr{Cchar})::Cssize_t "Error in h5a_get_name (not annotated)"

@bind h5a_get_name_by_idx(loc_id::hid_t, obj_name::Ptr{Cchar}, idx_type::H5_index_t, order::H5_iter_order_t, n::hsize_t, name::Ptr{Cchar}, size::Csize_t, lapl_id::hid_t)::Cssize_t "Error in h5a_get_name_by_idx (not annotated)"

@bind h5a_get_space(attr_id::hid_t)::hid_t "Error in h5a_get_space (not annotated)"

@bind h5a_get_storage_size(attr_id::hid_t)::hsize_t "Error in h5a_get_storage_size (not annotated)"

@bind h5a_get_type(attr_id::hid_t)::hid_t "Error in h5a_get_type (not annotated)"

@bind h5a_iterate_by_name(loc_id::hid_t, obj_name::Ptr{Cchar}, idx_type::H5_index_t, order::H5_iter_order_t, idx::Ptr{hsize_t}, op::H5A_operator2_t, op_data::Ptr{Cvoid}, lapl_id::hid_t)::herr_t "Error in h5a_iterate_by_name (not annotated)"

@bind h5a_open(obj_id::hid_t, attr_name::Ptr{Cchar}, aapl_id::hid_t)::hid_t "Error in h5a_open (not annotated)"

@bind h5a_open_by_idx(loc_id::hid_t, obj_name::Ptr{Cchar}, idx_type::H5_index_t, order::H5_iter_order_t, n::hsize_t, aapl_id::hid_t, lapl_id::hid_t)::hid_t "Error in h5a_open_by_idx (not annotated)"

@bind h5a_open_by_name(loc_id::hid_t, obj_name::Ptr{Cchar}, attr_name::Ptr{Cchar}, aapl_id::hid_t, lapl_id::hid_t)::hid_t "Error in h5a_open_by_name (not annotated)"

@bind h5a_read(attr_id::hid_t, type_id::hid_t, buf::Ptr{Cvoid})::herr_t "Error in h5a_read (not annotated)"

@bind h5a_rename(loc_id::hid_t, old_name::Ptr{Cchar}, new_name::Ptr{Cchar})::herr_t "Error in h5a_rename (not annotated)"

@bind h5a_write(attr_id::hid_t, type_id::hid_t, buf::Ptr{Cvoid})::herr_t "Error in h5a_write (not annotated)"

@bind h5a_rename_by_name(loc_id::hid_t, obj_name::Ptr{Cchar}, old_attr_name::Ptr{Cchar}, new_attr_name::Ptr{Cchar}, lapl_id::hid_t)::herr_t "Error in h5a_rename_by_name (not annotated)"

# typedef herr_t ( * H5A_operator1_t ) ( hid_t location_id /*in*/ , const char * attr_name /*in*/ , void * operator_data /*in,out*/ )
const H5A_operator1_t = Ptr{Cvoid}

@bind h5a_create1(loc_id::hid_t, name::Ptr{Cchar}, type_id::hid_t, space_id::hid_t, acpl_id::hid_t)::hid_t "Error in h5a_create1 (not annotated)"

@bind h5a_get_num_attrs(loc_id::hid_t)::Cint "Error in h5a_get_num_attrs (not annotated)"

@bind h5a_iterate1(loc_id::hid_t, idx::Ptr{Cuint}, op::H5A_operator1_t, op_data::Ptr{Cvoid})::herr_t "Error in h5a_iterate1 (not annotated)"

@bind h5a_open_idx(loc_id::hid_t, idx::Cuint)::hid_t "Error in h5a_open_idx (not annotated)"

@bind h5a_open_name(loc_id::hid_t, name::Ptr{Cchar})::hid_t "Error in h5a_open_name (not annotated)"

@cenum H5C_cache_incr_mode::UInt32 begin
    H5C_incr__off = 0
    H5C_incr__threshold = 1
end

@cenum H5C_cache_flash_incr_mode::UInt32 begin
    H5C_flash_incr__off = 0
    H5C_flash_incr__add_space = 1
end

@cenum H5C_cache_decr_mode::UInt32 begin
    H5C_decr__off = 0
    H5C_decr__threshold = 1
    H5C_decr__age_out = 2
    H5C_decr__age_out_with_threshold = 3
end

struct H5AC_cache_config_t
    version::Cint
    rpt_fcn_enabled::hbool_t
    open_trace_file::hbool_t
    close_trace_file::hbool_t
    trace_file_name::NTuple{1025, Cchar}
    evictions_enabled::hbool_t
    set_initial_size::hbool_t
    initial_size::Csize_t
    min_clean_fraction::Cdouble
    max_size::Csize_t
    min_size::Csize_t
    epoch_length::Clong
    incr_mode::H5C_cache_incr_mode
    lower_hr_threshold::Cdouble
    increment::Cdouble
    apply_max_increment::hbool_t
    max_increment::Csize_t
    flash_incr_mode::H5C_cache_flash_incr_mode
    flash_multiple::Cdouble
    flash_threshold::Cdouble
    decr_mode::H5C_cache_decr_mode
    upper_hr_threshold::Cdouble
    decrement::Cdouble
    apply_max_decrement::hbool_t
    max_decrement::Csize_t
    epochs_before_eviction::Cint
    apply_empty_reserve::hbool_t
    empty_reserve::Cdouble
    dirty_bytes_threshold::Csize_t
    metadata_write_strategy::Cint
end

struct H5AC_cache_image_config_t
    version::Cint
    generate_image::hbool_t
    save_resize_status::hbool_t
    entry_ageout::Cint
end

@cenum H5D_layout_t::Int32 begin
    H5D_LAYOUT_ERROR = -1
    H5D_COMPACT = 0
    H5D_CONTIGUOUS = 1
    H5D_CHUNKED = 2
    H5D_VIRTUAL = 3
    H5D_NLAYOUTS = 4
end

@cenum H5D_chunk_index_t::UInt32 begin
    H5D_CHUNK_IDX_BTREE = 0
    H5D_CHUNK_IDX_SINGLE = 1
    H5D_CHUNK_IDX_NONE = 2
    H5D_CHUNK_IDX_FARRAY = 3
    H5D_CHUNK_IDX_EARRAY = 4
    H5D_CHUNK_IDX_BT2 = 5
    H5D_CHUNK_IDX_NTYPES = 6
end

@cenum H5D_alloc_time_t::Int32 begin
    H5D_ALLOC_TIME_ERROR = -1
    H5D_ALLOC_TIME_DEFAULT = 0
    H5D_ALLOC_TIME_EARLY = 1
    H5D_ALLOC_TIME_LATE = 2
    H5D_ALLOC_TIME_INCR = 3
end

@cenum H5D_space_status_t::Int32 begin
    H5D_SPACE_STATUS_ERROR = -1
    H5D_SPACE_STATUS_NOT_ALLOCATED = 0
    H5D_SPACE_STATUS_PART_ALLOCATED = 1
    H5D_SPACE_STATUS_ALLOCATED = 2
end

@cenum H5D_fill_time_t::Int32 begin
    H5D_FILL_TIME_ERROR = -1
    H5D_FILL_TIME_ALLOC = 0
    H5D_FILL_TIME_NEVER = 1
    H5D_FILL_TIME_IFSET = 2
end

@cenum H5D_fill_value_t::Int32 begin
    H5D_FILL_VALUE_ERROR = -1
    H5D_FILL_VALUE_UNDEFINED = 0
    H5D_FILL_VALUE_DEFAULT = 1
    H5D_FILL_VALUE_USER_DEFINED = 2
end

@cenum H5D_vds_view_t::Int32 begin
    H5D_VDS_ERROR = -1
    H5D_VDS_FIRST_MISSING = 0
    H5D_VDS_LAST_AVAILABLE = 1
end

# typedef herr_t ( * H5D_append_cb_t ) ( hid_t dataset_id , hsize_t * cur_dims , void * op_data )
const H5D_append_cb_t = Ptr{Cvoid}

# typedef herr_t ( * H5D_operator_t ) ( void * elem , hid_t type_id , unsigned ndim , const hsize_t * point , void * operator_data )
const H5D_operator_t = Ptr{Cvoid}

# typedef herr_t ( * H5D_scatter_func_t ) ( const void * * src_buf /*out*/ , size_t * src_buf_bytes_used /*out*/ , void * op_data )
const H5D_scatter_func_t = Ptr{Cvoid}

# typedef herr_t ( * H5D_gather_func_t ) ( const void * dst_buf , size_t dst_buf_bytes_used , void * op_data )
const H5D_gather_func_t = Ptr{Cvoid}

@bind h5d_create_anon(loc_id::hid_t, type_id::hid_t, space_id::hid_t, dcpl_id::hid_t, dapl_id::hid_t)::hid_t "Error in h5d_create_anon (not annotated)"

@bind h5d_get_space(dset_id::hid_t)::hid_t "Error in h5d_get_space (not annotated)"

@bind h5d_get_space_status(dset_id::hid_t, allocation::Ptr{H5D_space_status_t})::herr_t "Error in h5d_get_space_status (not annotated)"

@bind h5d_get_type(dset_id::hid_t)::hid_t "Error in h5d_get_type (not annotated)"

@bind h5d_get_create_plist(dset_id::hid_t)::hid_t "Error in h5d_get_create_plist (not annotated)"

@bind h5d_get_access_plist(dset_id::hid_t)::hid_t "Error in h5d_get_access_plist (not annotated)"

@bind h5d_get_storage_size(dset_id::hid_t)::hsize_t "Error in h5d_get_storage_size (not annotated)"

@bind h5d_get_chunk_storage_size(dset_id::hid_t, offset::Ptr{hsize_t}, chunk_bytes::Ptr{hsize_t})::herr_t "Error in h5d_get_chunk_storage_size (not annotated)"

@bind h5d_get_num_chunks(dset_id::hid_t, fspace_id::hid_t, nchunks::Ptr{hsize_t})::herr_t "Error in h5d_get_num_chunks (not annotated)"

@bind h5d_get_chunk_info_by_coord(dset_id::hid_t, offset::Ptr{hsize_t}, filter_mask::Ptr{Cuint}, addr::Ptr{haddr_t}, size::Ptr{hsize_t})::herr_t "Error in h5d_get_chunk_info_by_coord (not annotated)"

@bind h5d_get_chunk_info(dset_id::hid_t, fspace_id::hid_t, chk_idx::hsize_t, offset::Ptr{hsize_t}, filter_mask::Ptr{Cuint}, addr::Ptr{haddr_t}, size::Ptr{hsize_t})::herr_t "Error in h5d_get_chunk_info (not annotated)"

@bind h5d_get_offset(dset_id::hid_t)::haddr_t "Error in h5d_get_offset (not annotated)"

@bind h5d_read(dset_id::hid_t, mem_type_id::hid_t, mem_space_id::hid_t, file_space_id::hid_t, dxpl_id::hid_t, buf::Ptr{Cvoid})::herr_t "Error in h5d_read (not annotated)"

@bind h5d_write(dset_id::hid_t, mem_type_id::hid_t, mem_space_id::hid_t, file_space_id::hid_t, dxpl_id::hid_t, buf::Ptr{Cvoid})::herr_t "Error in h5d_write (not annotated)"

@bind h5d_write_chunk(dset_id::hid_t, dxpl_id::hid_t, filters::UInt32, offset::Ptr{hsize_t}, data_size::Csize_t, buf::Ptr{Cvoid})::herr_t "Error in h5d_write_chunk (not annotated)"

@bind h5d_read_chunk(dset_id::hid_t, dxpl_id::hid_t, offset::Ptr{hsize_t}, filters::Ptr{UInt32}, buf::Ptr{Cvoid})::herr_t "Error in h5d_read_chunk (not annotated)"

@bind h5d_iterate(buf::Ptr{Cvoid}, type_id::hid_t, space_id::hid_t, op::H5D_operator_t, operator_data::Ptr{Cvoid})::herr_t "Error in h5d_iterate (not annotated)"

@bind h5d_vlen_get_buf_size(dset_id::hid_t, type_id::hid_t, space_id::hid_t, size::Ptr{hsize_t})::herr_t "Error in h5d_vlen_get_buf_size (not annotated)"

@bind h5d_fill(fill::Ptr{Cvoid}, fill_type_id::hid_t, buf::Ptr{Cvoid}, buf_type_id::hid_t, space_id::hid_t)::herr_t "Error in h5d_fill (not annotated)"

@bind h5d_set_extent(dset_id::hid_t, size::Ptr{hsize_t})::herr_t "Error in h5d_set_extent (not annotated)"

@bind h5d_flush(dset_id::hid_t)::herr_t "Error in h5d_flush (not annotated)"

@bind h5d_refresh(dset_id::hid_t)::herr_t "Error in h5d_refresh (not annotated)"

@bind h5d_scatter(op::H5D_scatter_func_t, op_data::Ptr{Cvoid}, type_id::hid_t, dst_space_id::hid_t, dst_buf::Ptr{Cvoid})::herr_t "Error in h5d_scatter (not annotated)"

@bind h5d_gather(src_space_id::hid_t, src_buf::Ptr{Cvoid}, type_id::hid_t, dst_buf_size::Csize_t, dst_buf::Ptr{Cvoid}, op::H5D_gather_func_t, op_data::Ptr{Cvoid})::herr_t "Error in h5d_gather (not annotated)"

@bind h5d_close(dset_id::hid_t)::herr_t "Error in h5d_close (not annotated)"

@bind h5d_debug(dset_id::hid_t)::herr_t "Error in h5d_debug (not annotated)"

@bind h5d_format_convert(dset_id::hid_t)::herr_t "Error in h5d_format_convert (not annotated)"

@bind h5d_get_chunk_index_type(did::hid_t, idx_type::Ptr{H5D_chunk_index_t})::herr_t "Error in h5d_get_chunk_index_type (not annotated)"

@bind h5d_create1(loc_id::hid_t, name::Ptr{Cchar}, type_id::hid_t, space_id::hid_t, dcpl_id::hid_t)::hid_t "Error in h5d_create1 (not annotated)"

@bind h5d_open1(loc_id::hid_t, name::Ptr{Cchar})::hid_t "Error in h5d_open1 (not annotated)"

@bind h5d_extend(dset_id::hid_t, size::Ptr{hsize_t})::herr_t "Error in h5d_extend (not annotated)"

@bind h5d_vlen_reclaim(type_id::hid_t, space_id::hid_t, dxpl_id::hid_t, buf::Ptr{Cvoid})::herr_t "Error in h5d_vlen_reclaim (not annotated)"

@cenum H5E_type_t::UInt32 begin
    H5E_MAJOR = 0
    H5E_MINOR = 1
end

@bind h5e_register_class(cls_name::Ptr{Cchar}, lib_name::Ptr{Cchar}, version::Ptr{Cchar})::hid_t "Error in h5e_register_class (not annotated)"

@bind h5e_unregister_class(class_id::hid_t)::herr_t "Error in h5e_unregister_class (not annotated)"

@bind h5e_close_msg(err_id::hid_t)::herr_t "Error in h5e_close_msg (not annotated)"

@bind h5e_create_msg(cls::hid_t, msg_type::H5E_type_t, msg::Ptr{Cchar})::hid_t "Error in h5e_create_msg (not annotated)"

@bind h5e_create_stack()::hid_t "Error in h5e_create_stack (not annotated)"

@bind h5e_get_current_stack()::hid_t "Error in h5e_get_current_stack (not annotated)"

@bind h5e_close_stack(stack_id::hid_t)::herr_t "Error in h5e_close_stack (not annotated)"

@bind h5e_get_class_name(class_id::hid_t, name::Ptr{Cchar}, size::Csize_t)::Cssize_t "Error in h5e_get_class_name (not annotated)"

@bind h5e_set_current_stack(err_stack_id::hid_t)::herr_t "Error in h5e_set_current_stack (not annotated)"

@bind h5e_pop(err_stack::hid_t, count::Csize_t)::herr_t "Error in h5e_pop (not annotated)"

@bind h5e_get_msg(msg_id::hid_t, type::Ptr{H5E_type_t}, msg::Ptr{Cchar}, size::Csize_t)::Cssize_t "Error in h5e_get_msg (not annotated)"

@bind h5e_get_num(error_stack_id::hid_t)::Cssize_t "Error in h5e_get_num (not annotated)"

const H5E_major_t = hid_t

const H5E_minor_t = hid_t

struct H5E_error1_t
    maj_num::H5E_major_t
    min_num::H5E_minor_t
    func_name::Ptr{Cchar}
    file_name::Ptr{Cchar}
    line::Cuint
    desc::Ptr{Cchar}
end

# typedef herr_t ( * H5E_walk1_t ) ( int n , H5E_error1_t * err_desc , void * client_data )
const H5E_walk1_t = Ptr{Cvoid}

@bind h5e_clear1()::herr_t "Error in h5e_clear1 (not annotated)"

@bind h5e_push1(file::Ptr{Cchar}, func::Ptr{Cchar}, line::Cuint, maj::H5E_major_t, min::H5E_minor_t, str::Ptr{Cchar})::herr_t "Error in h5e_push1 (not annotated)"

@bind h5e_print1(stream::Ptr{Libc.FILE})::herr_t "Error in h5e_print1 (not annotated)"

@bind h5e_walk1(direction::H5E_direction_t, func::H5E_walk1_t, client_data::Ptr{Cvoid})::herr_t "Error in h5e_walk1 (not annotated)"

@bind h5e_get_major(maj::H5E_major_t)::Ptr{Cchar} "Error in h5e_get_major (not annotated)"

@bind h5e_get_minor(min::H5E_minor_t)::Ptr{Cchar} "Error in h5e_get_minor (not annotated)"

@cenum H5F_scope_t::UInt32 begin
    H5F_SCOPE_LOCAL = 0
    H5F_SCOPE_GLOBAL = 1
end

@cenum H5F_close_degree_t::UInt32 begin
    H5F_CLOSE_DEFAULT = 0
    H5F_CLOSE_WEAK = 1
    H5F_CLOSE_SEMI = 2
    H5F_CLOSE_STRONG = 3
end

@cenum H5F_mem_t::Int32 begin
    H5FD_MEM_NOLIST = -1
    H5FD_MEM_DEFAULT = 0
    H5FD_MEM_SUPER = 1
    H5FD_MEM_BTREE = 2
    H5FD_MEM_DRAW = 3
    H5FD_MEM_GHEAP = 4
    H5FD_MEM_LHEAP = 5
    H5FD_MEM_OHDR = 6
    H5FD_MEM_NTYPES = 7
end

struct H5F_sect_info_t
    addr::haddr_t
    size::hsize_t
end

@cenum H5F_libver_t::Int32 begin
    H5F_LIBVER_ERROR = -1
    H5F_LIBVER_EARLIEST = 0
    H5F_LIBVER_V18 = 1
    H5F_LIBVER_V110 = 2
    H5F_LIBVER_V112 = 3
    H5F_LIBVER_NBOUNDS = 4
end

@cenum H5F_fspace_strategy_t::UInt32 begin
    H5F_FSPACE_STRATEGY_FSM_AGGR = 0
    H5F_FSPACE_STRATEGY_PAGE = 1
    H5F_FSPACE_STRATEGY_AGGR = 2
    H5F_FSPACE_STRATEGY_NONE = 3
    H5F_FSPACE_STRATEGY_NTYPES = 4
end

@cenum H5F_file_space_type_t::UInt32 begin
    H5F_FILE_SPACE_DEFAULT = 0
    H5F_FILE_SPACE_ALL_PERSIST = 1
    H5F_FILE_SPACE_ALL = 2
    H5F_FILE_SPACE_AGGR_VFD = 3
    H5F_FILE_SPACE_VFD = 4
    H5F_FILE_SPACE_NTYPES = 5
end

struct H5F_retry_info_t
    nbins::Cuint
    retries::NTuple{21, Ptr{UInt32}}
end

# typedef herr_t ( * H5F_flush_cb_t ) ( hid_t object_id , void * udata )
const H5F_flush_cb_t = Ptr{Cvoid}

@bind h5f_is_accessible(container_name::Ptr{Cchar}, fapl_id::hid_t)::htri_t "Error in h5f_is_accessible (not annotated)"

@bind h5f_create(filename::Ptr{Cchar}, flags::Cuint, fcpl_id::hid_t, fapl_id::hid_t)::hid_t "Error in h5f_create (not annotated)"

@bind h5f_open(filename::Ptr{Cchar}, flags::Cuint, fapl_id::hid_t)::hid_t "Error in h5f_open (not annotated)"

@bind h5f_reopen(file_id::hid_t)::hid_t "Error in h5f_reopen (not annotated)"

@bind h5f_flush(object_id::hid_t, scope::H5F_scope_t)::herr_t "Error in h5f_flush (not annotated)"

@bind h5f_close(file_id::hid_t)::herr_t "Error in h5f_close (not annotated)"

@bind h5f_delete(filename::Ptr{Cchar}, fapl_id::hid_t)::herr_t "Error in h5f_delete (not annotated)"

@bind h5f_get_create_plist(file_id::hid_t)::hid_t "Error in h5f_get_create_plist (not annotated)"

@bind h5f_get_access_plist(file_id::hid_t)::hid_t "Error in h5f_get_access_plist (not annotated)"

@bind h5f_get_intent(file_id::hid_t, intent::Ptr{Cuint})::herr_t "Error in h5f_get_intent (not annotated)"

@bind h5f_get_fileno(file_id::hid_t, fileno::Ptr{Culong})::herr_t "Error in h5f_get_fileno (not annotated)"

@bind h5f_get_obj_count(file_id::hid_t, types::Cuint)::Cssize_t "Error in h5f_get_obj_count (not annotated)"

@bind h5f_get_obj_ids(file_id::hid_t, types::Cuint, max_objs::Csize_t, obj_id_list::Ptr{hid_t})::Cssize_t "Error in h5f_get_obj_ids (not annotated)"

@bind h5f_get_vfd_handle(file_id::hid_t, fapl::hid_t, file_handle::Ptr{Ptr{Cvoid}})::herr_t "Error in h5f_get_vfd_handle (not annotated)"

@bind h5f_mount(loc::hid_t, name::Ptr{Cchar}, child::hid_t, plist::hid_t)::herr_t "Error in h5f_mount (not annotated)"

@bind h5f_unmount(loc::hid_t, name::Ptr{Cchar})::herr_t "Error in h5f_unmount (not annotated)"

@bind h5f_get_freespace(file_id::hid_t)::hssize_t "Error in h5f_get_freespace (not annotated)"

@bind h5f_get_filesize(file_id::hid_t, size::Ptr{hsize_t})::herr_t "Error in h5f_get_filesize (not annotated)"

@bind h5f_get_eoa(file_id::hid_t, eoa::Ptr{haddr_t})::herr_t "Error in h5f_get_eoa (not annotated)"

@bind h5f_increment_filesize(file_id::hid_t, increment::hsize_t)::herr_t "Error in h5f_increment_filesize (not annotated)"

@bind h5f_get_file_image(file_id::hid_t, buf_ptr::Ptr{Cvoid}, buf_len::Csize_t)::Cssize_t "Error in h5f_get_file_image (not annotated)"

@bind h5f_get_mdc_config(file_id::hid_t, config_ptr::Ptr{H5AC_cache_config_t})::herr_t "Error in h5f_get_mdc_config (not annotated)"

@bind h5f_set_mdc_config(file_id::hid_t, config_ptr::Ptr{H5AC_cache_config_t})::herr_t "Error in h5f_set_mdc_config (not annotated)"

@bind h5f_get_mdc_hit_rate(file_id::hid_t, hit_rate_ptr::Ptr{Cdouble})::herr_t "Error in h5f_get_mdc_hit_rate (not annotated)"

@bind h5f_get_mdc_size(file_id::hid_t, max_size_ptr::Ptr{Csize_t}, min_clean_size_ptr::Ptr{Csize_t}, cur_size_ptr::Ptr{Csize_t}, cur_num_entries_ptr::Ptr{Cint})::herr_t "Error in h5f_get_mdc_size (not annotated)"

@bind h5f_reset_mdc_hit_rate_stats(file_id::hid_t)::herr_t "Error in h5f_reset_mdc_hit_rate_stats (not annotated)"

@bind h5f_get_name(obj_id::hid_t, name::Ptr{Cchar}, size::Csize_t)::Cssize_t "Error in h5f_get_name (not annotated)"

@bind h5f_get_metadata_read_retry_info(file_id::hid_t, info::Ptr{H5F_retry_info_t})::herr_t "Error in h5f_get_metadata_read_retry_info (not annotated)"

@bind h5f_start_swmr_write(file_id::hid_t)::herr_t "Error in h5f_start_swmr_write (not annotated)"

@bind h5f_get_free_sections(file_id::hid_t, type::H5F_mem_t, nsects::Csize_t, sect_info::Ptr{H5F_sect_info_t})::Cssize_t "Error in h5f_get_free_sections (not annotated)"

@bind h5f_clear_elink_file_cache(file_id::hid_t)::herr_t "Error in h5f_clear_elink_file_cache (not annotated)"

@bind h5f_set_libver_bounds(file_id::hid_t, low::H5F_libver_t, high::H5F_libver_t)::herr_t "Error in h5f_set_libver_bounds (not annotated)"

@bind h5f_start_mdc_logging(file_id::hid_t)::herr_t "Error in h5f_start_mdc_logging (not annotated)"

@bind h5f_stop_mdc_logging(file_id::hid_t)::herr_t "Error in h5f_stop_mdc_logging (not annotated)"

@bind h5f_get_mdc_logging_status(file_id::hid_t, is_enabled::Ptr{hbool_t}, is_currently_logging::Ptr{hbool_t})::herr_t "Error in h5f_get_mdc_logging_status (not annotated)"

@bind h5f_format_convert(fid::hid_t)::herr_t "Error in h5f_format_convert (not annotated)"

@bind h5f_reset_page_buffering_stats(file_id::hid_t)::herr_t "Error in h5f_reset_page_buffering_stats (not annotated)"

@bind h5f_get_page_buffering_stats(file_id::hid_t, accesses::Ptr{Cuint}, hits::Ptr{Cuint}, misses::Ptr{Cuint}, evictions::Ptr{Cuint}, bypasses::Ptr{Cuint})::herr_t "Error in h5f_get_page_buffering_stats (not annotated)"

@bind h5f_get_mdc_image_info(file_id::hid_t, image_addr::Ptr{haddr_t}, image_size::Ptr{hsize_t})::herr_t "Error in h5f_get_mdc_image_info (not annotated)"

@bind h5f_get_dset_no_attrs_hint(file_id::hid_t, minimize::Ptr{hbool_t})::herr_t "Error in h5f_get_dset_no_attrs_hint (not annotated)"

@bind h5f_set_dset_no_attrs_hint(file_id::hid_t, minimize::hbool_t)::herr_t "Error in h5f_set_dset_no_attrs_hint (not annotated)"

struct var"##Ctag#293"
    hdr_size::hsize_t
    msgs_info::H5_ih_info_t
end
function Base.getproperty(x::Ptr{var"##Ctag#293"}, f::Symbol)
    f === :hdr_size && return Ptr{hsize_t}(x + 0)
    f === :msgs_info && return Ptr{H5_ih_info_t}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#293", f::Symbol)
    r = Ref{var"##Ctag#293"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#293"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#293"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct H5F_info1_t
    data::NTuple{32, UInt8}
end

function Base.getproperty(x::Ptr{H5F_info1_t}, f::Symbol)
    f === :super_ext_size && return Ptr{hsize_t}(x + 0)
    f === :sohm && return Ptr{var"##Ctag#293"}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::H5F_info1_t, f::Symbol)
    r = Ref{H5F_info1_t}(x)
    ptr = Base.unsafe_convert(Ptr{H5F_info1_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{H5F_info1_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

@bind h5f_get_info1(obj_id::hid_t, file_info::Ptr{H5F_info1_t})::herr_t "Error in h5f_get_info1 (not annotated)"

@bind h5f_set_latest_format(file_id::hid_t, latest_format::hbool_t)::herr_t "Error in h5f_set_latest_format (not annotated)"

@bind h5f_is_hdf5(file_name::Ptr{Cchar})::htri_t "Error in h5f_is_hdf5 (not annotated)"

const H5FD_mem_t = H5F_mem_t

struct H5FD_class_t
    name::Ptr{Cchar}
    maxaddr::haddr_t
    fc_degree::H5F_close_degree_t
    terminate::Ptr{Cvoid}
    sb_size::Ptr{Cvoid}
    sb_encode::Ptr{Cvoid}
    sb_decode::Ptr{Cvoid}
    fapl_size::Csize_t
    fapl_get::Ptr{Cvoid}
    fapl_copy::Ptr{Cvoid}
    fapl_free::Ptr{Cvoid}
    dxpl_size::Csize_t
    dxpl_copy::Ptr{Cvoid}
    dxpl_free::Ptr{Cvoid}
    open::Ptr{Cvoid}
    close::Ptr{Cvoid}
    cmp::Ptr{Cvoid}
    query::Ptr{Cvoid}
    get_type_map::Ptr{Cvoid}
    alloc::Ptr{Cvoid}
    free::Ptr{Cvoid}
    get_eoa::Ptr{Cvoid}
    set_eoa::Ptr{Cvoid}
    get_eof::Ptr{Cvoid}
    get_handle::Ptr{Cvoid}
    read::Ptr{Cvoid}
    write::Ptr{Cvoid}
    flush::Ptr{Cvoid}
    truncate::Ptr{Cvoid}
    lock::Ptr{Cvoid}
    unlock::Ptr{Cvoid}
    fl_map::NTuple{7, H5FD_mem_t}
end

struct H5FD_t
    driver_id::hid_t
    cls::Ptr{H5FD_class_t}
    fileno::Culong
    access_flags::Cuint
    feature_flags::Culong
    maxaddr::haddr_t
    base_addr::haddr_t
    threshold::hsize_t
    alignment::hsize_t
    paged_aggr::hbool_t
end

struct H5FD_free_t
    addr::haddr_t
    size::hsize_t
    next::Ptr{H5FD_free_t}
end

@cenum H5FD_file_image_op_t::UInt32 begin
    H5FD_FILE_IMAGE_OP_NO_OP = 0
    H5FD_FILE_IMAGE_OP_PROPERTY_LIST_SET = 1
    H5FD_FILE_IMAGE_OP_PROPERTY_LIST_COPY = 2
    H5FD_FILE_IMAGE_OP_PROPERTY_LIST_GET = 3
    H5FD_FILE_IMAGE_OP_PROPERTY_LIST_CLOSE = 4
    H5FD_FILE_IMAGE_OP_FILE_OPEN = 5
    H5FD_FILE_IMAGE_OP_FILE_RESIZE = 6
    H5FD_FILE_IMAGE_OP_FILE_CLOSE = 7
end

struct H5FD_file_image_callbacks_t
    image_malloc::Ptr{Cvoid}
    image_memcpy::Ptr{Cvoid}
    image_realloc::Ptr{Cvoid}
    image_free::Ptr{Cvoid}
    udata_copy::Ptr{Cvoid}
    udata_free::Ptr{Cvoid}
    udata::Ptr{Cvoid}
end

@bind h5fd_register(cls::Ptr{H5FD_class_t})::hid_t "Error in h5fd_register (not annotated)"

@bind h5fd_unregister(driver_id::hid_t)::herr_t "Error in h5fd_unregister (not annotated)"

@bind h5fd_open(name::Ptr{Cchar}, flags::Cuint, fapl_id::hid_t, maxaddr::haddr_t)::Ptr{H5FD_t} "Error in h5fd_open (not annotated)"

@bind h5fd_close(file::Ptr{H5FD_t})::herr_t "Error in h5fd_close (not annotated)"

@bind h5fd_cmp(f1::Ptr{H5FD_t}, f2::Ptr{H5FD_t})::Cint "Error in h5fd_cmp (not annotated)"

@bind h5fd_query(f::Ptr{H5FD_t}, flags::Ptr{Culong})::Cint "Error in h5fd_query (not annotated)"

@bind h5fd_alloc(file::Ptr{H5FD_t}, type::H5FD_mem_t, dxpl_id::hid_t, size::hsize_t)::haddr_t "Error in h5fd_alloc (not annotated)"

@bind h5fd_free(file::Ptr{H5FD_t}, type::H5FD_mem_t, dxpl_id::hid_t, addr::haddr_t, size::hsize_t)::herr_t "Error in h5fd_free (not annotated)"

@bind h5fd_get_eoa(file::Ptr{H5FD_t}, type::H5FD_mem_t)::haddr_t "Error in h5fd_get_eoa (not annotated)"

@bind h5fd_set_eoa(file::Ptr{H5FD_t}, type::H5FD_mem_t, eoa::haddr_t)::herr_t "Error in h5fd_set_eoa (not annotated)"

@bind h5fd_get_eof(file::Ptr{H5FD_t}, type::H5FD_mem_t)::haddr_t "Error in h5fd_get_eof (not annotated)"

@bind h5fd_get_vfd_handle(file::Ptr{H5FD_t}, fapl::hid_t, file_handle::Ptr{Ptr{Cvoid}})::herr_t "Error in h5fd_get_vfd_handle (not annotated)"

@bind h5fd_read(file::Ptr{H5FD_t}, type::H5FD_mem_t, dxpl_id::hid_t, addr::haddr_t, size::Csize_t, buf::Ptr{Cvoid})::herr_t "Error in h5fd_read (not annotated)"

@bind h5fd_write(file::Ptr{H5FD_t}, type::H5FD_mem_t, dxpl_id::hid_t, addr::haddr_t, size::Csize_t, buf::Ptr{Cvoid})::herr_t "Error in h5fd_write (not annotated)"

@bind h5fd_flush(file::Ptr{H5FD_t}, dxpl_id::hid_t, closing::hbool_t)::herr_t "Error in h5fd_flush (not annotated)"

@bind h5fd_truncate(file::Ptr{H5FD_t}, dxpl_id::hid_t, closing::hbool_t)::herr_t "Error in h5fd_truncate (not annotated)"

@bind h5fd_lock(file::Ptr{H5FD_t}, rw::hbool_t)::herr_t "Error in h5fd_lock (not annotated)"

@bind h5fd_unlock(file::Ptr{H5FD_t})::herr_t "Error in h5fd_unlock (not annotated)"

@bind h5fd_driver_query(driver_id::hid_t, flags::Ptr{Culong})::herr_t "Error in h5fd_driver_query (not annotated)"

@cenum H5G_storage_type_t::Int32 begin
    H5G_STORAGE_TYPE_UNKNOWN = -1
    H5G_STORAGE_TYPE_SYMBOL_TABLE = 0
    H5G_STORAGE_TYPE_COMPACT = 1
    H5G_STORAGE_TYPE_DENSE = 2
end

struct H5G_info_t
    storage_type::H5G_storage_type_t
    nlinks::hsize_t
    max_corder::Int64
    mounted::hbool_t
end

@bind h5g_create_anon(loc_id::hid_t, gcpl_id::hid_t, gapl_id::hid_t)::hid_t "Error in h5g_create_anon (not annotated)"

@bind h5g_get_create_plist(group_id::hid_t)::hid_t "Error in h5g_get_create_plist (not annotated)"

@bind h5g_get_info(loc_id::hid_t, ginfo::Ptr{H5G_info_t})::herr_t "Error in h5g_get_info (not annotated)"

@bind h5g_get_info_by_name(loc_id::hid_t, name::Ptr{Cchar}, ginfo::Ptr{H5G_info_t}, lapl_id::hid_t)::herr_t "Error in h5g_get_info_by_name (not annotated)"

@bind h5g_get_info_by_idx(loc_id::hid_t, group_name::Ptr{Cchar}, idx_type::H5_index_t, order::H5_iter_order_t, n::hsize_t, ginfo::Ptr{H5G_info_t}, lapl_id::hid_t)::herr_t "Error in h5g_get_info_by_idx (not annotated)"

@bind h5g_flush(group_id::hid_t)::herr_t "Error in h5g_flush (not annotated)"

@bind h5g_refresh(group_id::hid_t)::herr_t "Error in h5g_refresh (not annotated)"

@bind h5g_close(group_id::hid_t)::herr_t "Error in h5g_close (not annotated)"

@cenum H5G_obj_t::Int32 begin
    H5G_UNKNOWN = -1
    H5G_GROUP = 0
    H5G_DATASET = 1
    H5G_TYPE = 2
    H5G_LINK = 3
    H5G_UDLINK = 4
    H5G_RESERVED_5 = 5
    H5G_RESERVED_6 = 6
    H5G_RESERVED_7 = 7
end

# typedef herr_t ( * H5G_iterate_t ) ( hid_t group , const char * name , void * op_data )
const H5G_iterate_t = Ptr{Cvoid}

struct H5G_stat_t
    fileno::NTuple{2, Culong}
    objno::NTuple{2, Culong}
    nlink::Cuint
    type::H5G_obj_t
    mtime::time_t
    linklen::Csize_t
    ohdr::H5O_stat_t
end

@bind h5g_create1(loc_id::hid_t, name::Ptr{Cchar}, size_hint::Csize_t)::hid_t "Error in h5g_create1 (not annotated)"

@bind h5g_open1(loc_id::hid_t, name::Ptr{Cchar})::hid_t "Error in h5g_open1 (not annotated)"

@bind h5g_link(cur_loc_id::hid_t, type::H5L_type_t, cur_name::Ptr{Cchar}, new_name::Ptr{Cchar})::herr_t "Error in h5g_link (not annotated)"

@bind h5g_link2(cur_loc_id::hid_t, cur_name::Ptr{Cchar}, type::H5L_type_t, new_loc_id::hid_t, new_name::Ptr{Cchar})::herr_t "Error in h5g_link2 (not annotated)"

@bind h5g_move(src_loc_id::hid_t, src_name::Ptr{Cchar}, dst_name::Ptr{Cchar})::herr_t "Error in h5g_move (not annotated)"

@bind h5g_move2(src_loc_id::hid_t, src_name::Ptr{Cchar}, dst_loc_id::hid_t, dst_name::Ptr{Cchar})::herr_t "Error in h5g_move2 (not annotated)"

@bind h5g_unlink(loc_id::hid_t, name::Ptr{Cchar})::herr_t "Error in h5g_unlink (not annotated)"

@bind h5g_get_linkval(loc_id::hid_t, name::Ptr{Cchar}, size::Csize_t, buf::Ptr{Cchar})::herr_t "Error in h5g_get_linkval (not annotated)"

@bind h5g_set_comment(loc_id::hid_t, name::Ptr{Cchar}, comment::Ptr{Cchar})::herr_t "Error in h5g_set_comment (not annotated)"

@bind h5g_get_comment(loc_id::hid_t, name::Ptr{Cchar}, bufsize::Csize_t, buf::Ptr{Cchar})::Cint "Error in h5g_get_comment (not annotated)"

@bind h5g_iterate(loc_id::hid_t, name::Ptr{Cchar}, idx::Ptr{Cint}, op::H5G_iterate_t, op_data::Ptr{Cvoid})::herr_t "Error in h5g_iterate (not annotated)"

@bind h5g_get_num_objs(loc_id::hid_t, num_objs::Ptr{hsize_t})::herr_t "Error in h5g_get_num_objs (not annotated)"

@bind h5g_get_objinfo(loc_id::hid_t, name::Ptr{Cchar}, follow_link::hbool_t, statbuf::Ptr{H5G_stat_t})::herr_t "Error in h5g_get_objinfo (not annotated)"

@bind h5g_get_objname_by_idx(loc_id::hid_t, idx::hsize_t, name::Ptr{Cchar}, size::Csize_t)::Cssize_t "Error in h5g_get_objname_by_idx (not annotated)"

@bind h5g_get_objtype_by_idx(loc_id::hid_t, idx::hsize_t)::H5G_obj_t "Error in h5g_get_objtype_by_idx (not annotated)"

@cenum H5VL_map_get_t::UInt32 begin
    H5VL_MAP_GET_MAPL = 0
    H5VL_MAP_GET_MCPL = 1
    H5VL_MAP_GET_KEY_TYPE = 2
    H5VL_MAP_GET_VAL_TYPE = 3
    H5VL_MAP_GET_COUNT = 4
end

@cenum H5VL_map_specific_t::UInt32 begin
    H5VL_MAP_ITER = 0
    H5VL_MAP_DELETE = 1
end

# typedef herr_t ( * H5M_iterate_t ) ( hid_t map_id , const void * key , void * op_data )
const H5M_iterate_t = Ptr{Cvoid}

# typedef void * ( * H5MM_allocate_t ) ( size_t size , void * alloc_info )
const H5MM_allocate_t = Ptr{Cvoid}

# typedef void ( * H5MM_free_t ) ( void * mem , void * free_info )
const H5MM_free_t = Ptr{Cvoid}

@cenum H5Z_SO_scale_type_t::UInt32 begin
    H5Z_SO_FLOAT_DSCALE = 0
    H5Z_SO_FLOAT_ESCALE = 1
    H5Z_SO_INT = 2
end

@cenum H5Z_EDC_t::Int32 begin
    H5Z_ERROR_EDC = -1
    H5Z_DISABLE_EDC = 0
    H5Z_ENABLE_EDC = 1
    H5Z_NO_EDC = 2
end

@cenum H5Z_cb_return_t::Int32 begin
    H5Z_CB_ERROR = -1
    H5Z_CB_FAIL = 0
    H5Z_CB_CONT = 1
    H5Z_CB_NO = 2
end

# typedef H5Z_cb_return_t ( * H5Z_filter_func_t ) ( H5Z_filter_t filter , void * buf , size_t buf_size , void * op_data )
const H5Z_filter_func_t = Ptr{Cvoid}

struct H5Z_cb_t
    func::H5Z_filter_func_t
    op_data::Ptr{Cvoid}
end

@bind h5z_register(cls::Ptr{Cvoid})::herr_t "Error in h5z_register (not annotated)"

@bind h5z_unregister(id::H5Z_filter_t)::herr_t "Error in h5z_unregister (not annotated)"

@bind h5z_filter_avail(id::H5Z_filter_t)::htri_t "Error in h5z_filter_avail (not annotated)"

@bind h5z_get_filter_info(filter::H5Z_filter_t, filter_config_flags::Ptr{Cuint})::herr_t "Error in h5z_get_filter_info (not annotated)"

struct H5Z_class1_t
    id::H5Z_filter_t
    name::Ptr{Cchar}
    can_apply::H5Z_can_apply_func_t
    set_local::H5Z_set_local_func_t
    filter::H5Z_func_t
end

# typedef herr_t ( * H5P_cls_create_func_t ) ( hid_t prop_id , void * create_data )
const H5P_cls_create_func_t = Ptr{Cvoid}

# typedef herr_t ( * H5P_cls_copy_func_t ) ( hid_t new_prop_id , hid_t old_prop_id , void * copy_data )
const H5P_cls_copy_func_t = Ptr{Cvoid}

# typedef herr_t ( * H5P_cls_close_func_t ) ( hid_t prop_id , void * close_data )
const H5P_cls_close_func_t = Ptr{Cvoid}

# typedef herr_t ( * H5P_prp_encode_func_t ) ( const void * value , void * * buf , size_t * size )
const H5P_prp_encode_func_t = Ptr{Cvoid}

# typedef herr_t ( * H5P_prp_decode_func_t ) ( const void * * buf , void * value )
const H5P_prp_decode_func_t = Ptr{Cvoid}

# typedef herr_t ( * H5P_iterate_t ) ( hid_t id , const char * name , void * iter_data )
const H5P_iterate_t = Ptr{Cvoid}

@cenum H5D_mpio_actual_chunk_opt_mode_t::UInt32 begin
    H5D_MPIO_NO_CHUNK_OPTIMIZATION = 0
    H5D_MPIO_LINK_CHUNK = 1
    H5D_MPIO_MULTI_CHUNK = 2
end

@cenum H5D_mpio_actual_io_mode_t::UInt32 begin
    H5D_MPIO_NO_COLLECTIVE = 0
    H5D_MPIO_CHUNK_INDEPENDENT = 1
    H5D_MPIO_CHUNK_COLLECTIVE = 2
    H5D_MPIO_CHUNK_MIXED = 3
    H5D_MPIO_CONTIGUOUS_COLLECTIVE = 4
end

@cenum H5D_mpio_no_collective_cause_t::UInt32 begin
    H5D_MPIO_COLLECTIVE = 0
    H5D_MPIO_SET_INDEPENDENT = 1
    H5D_MPIO_DATATYPE_CONVERSION = 2
    H5D_MPIO_DATA_TRANSFORMS = 4
    H5D_MPIO_MPI_OPT_TYPES_ENV_VAR_DISABLED = 8
    H5D_MPIO_NOT_SIMPLE_OR_SCALAR_DATASPACES = 16
    H5D_MPIO_NOT_CONTIGUOUS_OR_CHUNKED_DATASET = 32
    H5D_MPIO_PARALLEL_FILTERED_WRITES_DISABLED = 64
    H5D_MPIO_ERROR_WHILE_CHECKING_COLLECTIVE_POSSIBLE = 128
    H5D_MPIO_NO_COLLECTIVE_MAX_CAUSE = 256
end

@bind h5p_close(plist_id::hid_t)::herr_t "Error in h5p_close (not annotated)"

@bind h5p_close_class(plist_id::hid_t)::herr_t "Error in h5p_close_class (not annotated)"

@bind h5p_copy(plist_id::hid_t)::hid_t "Error in h5p_copy (not annotated)"

@bind h5p_copy_prop(dst_id::hid_t, src_id::hid_t, name::Ptr{Cchar})::herr_t "Error in h5p_copy_prop (not annotated)"

@bind h5p_create(cls_id::hid_t)::hid_t "Error in h5p_create (not annotated)"

@bind h5p_create_class(parent::hid_t, name::Ptr{Cchar}, create::H5P_cls_create_func_t, create_data::Ptr{Cvoid}, copy::H5P_cls_copy_func_t, copy_data::Ptr{Cvoid}, close::H5P_cls_close_func_t, close_data::Ptr{Cvoid})::hid_t "Error in h5p_create_class (not annotated)"

@bind h5p_decode(buf::Ptr{Cvoid})::hid_t "Error in h5p_decode (not annotated)"

@bind h5p_equal(id1::hid_t, id2::hid_t)::htri_t "Error in h5p_equal (not annotated)"

@bind h5p_exist(plist_id::hid_t, name::Ptr{Cchar})::htri_t "Error in h5p_exist (not annotated)"

@bind h5p_get(plist_id::hid_t, name::Ptr{Cchar}, value::Ptr{Cvoid})::herr_t "Error in h5p_get (not annotated)"

@bind h5p_get_class(plist_id::hid_t)::hid_t "Error in h5p_get_class (not annotated)"

@bind h5p_get_class_name(pclass_id::hid_t)::Ptr{Cchar} "Error in h5p_get_class_name (not annotated)"

@bind h5p_get_class_parent(pclass_id::hid_t)::hid_t "Error in h5p_get_class_parent (not annotated)"

@bind h5p_get_nprops(id::hid_t, nprops::Ptr{Csize_t})::herr_t "Error in h5p_get_nprops (not annotated)"

@bind h5p_get_size(id::hid_t, name::Ptr{Cchar}, size::Ptr{Csize_t})::herr_t "Error in h5p_get_size (not annotated)"

@bind h5p_isa_class(plist_id::hid_t, pclass_id::hid_t)::htri_t "Error in h5p_isa_class (not annotated)"

@bind h5p_iterate(id::hid_t, idx::Ptr{Cint}, iter_func::H5P_iterate_t, iter_data::Ptr{Cvoid})::Cint "Error in h5p_iterate (not annotated)"

@bind h5p_remove(plist_id::hid_t, name::Ptr{Cchar})::herr_t "Error in h5p_remove (not annotated)"

@bind h5p_set(plist_id::hid_t, name::Ptr{Cchar}, value::Ptr{Cvoid})::herr_t "Error in h5p_set (not annotated)"

@bind h5p_unregister(pclass_id::hid_t, name::Ptr{Cchar})::herr_t "Error in h5p_unregister (not annotated)"

@bind h5p_all_filters_avail(plist_id::hid_t)::htri_t "Error in h5p_all_filters_avail (not annotated)"

@bind h5p_get_attr_creation_order(plist_id::hid_t, crt_order_flags::Ptr{Cuint})::herr_t "Error in h5p_get_attr_creation_order (not annotated)"

@bind h5p_get_attr_phase_change(plist_id::hid_t, max_compact::Ptr{Cuint}, min_dense::Ptr{Cuint})::herr_t "Error in h5p_get_attr_phase_change (not annotated)"

@bind h5p_get_nfilters(plist_id::hid_t)::Cint "Error in h5p_get_nfilters (not annotated)"

@bind h5p_get_obj_track_times(plist_id::hid_t, track_times::Ptr{hbool_t})::herr_t "Error in h5p_get_obj_track_times (not annotated)"

@bind h5p_modify_filter(plist_id::hid_t, filter::H5Z_filter_t, flags::Cuint, cd_nelmts::Csize_t, cd_values::Ptr{Cuint})::herr_t "Error in h5p_modify_filter (not annotated)"

@bind h5p_remove_filter(plist_id::hid_t, filter::H5Z_filter_t)::herr_t "Error in h5p_remove_filter (not annotated)"

@bind h5p_set_attr_creation_order(plist_id::hid_t, crt_order_flags::Cuint)::herr_t "Error in h5p_set_attr_creation_order (not annotated)"

@bind h5p_set_attr_phase_change(plist_id::hid_t, max_compact::Cuint, min_dense::Cuint)::herr_t "Error in h5p_set_attr_phase_change (not annotated)"

@bind h5p_set_deflate(plist_id::hid_t, level::Cuint)::herr_t "Error in h5p_set_deflate (not annotated)"

@bind h5p_set_filter(plist_id::hid_t, filter::H5Z_filter_t, flags::Cuint, cd_nelmts::Csize_t, c_values::Ptr{Cuint})::herr_t "Error in h5p_set_filter (not annotated)"

@bind h5p_set_fletcher32(plist_id::hid_t)::herr_t "Error in h5p_set_fletcher32 (not annotated)"

@bind h5p_set_obj_track_times(plist_id::hid_t, track_times::hbool_t)::herr_t "Error in h5p_set_obj_track_times (not annotated)"

@bind h5p_get_file_space_page_size(plist_id::hid_t, fsp_size::Ptr{hsize_t})::herr_t "Error in h5p_get_file_space_page_size (not annotated)"

@bind h5p_get_file_space_strategy(plist_id::hid_t, strategy::Ptr{H5F_fspace_strategy_t}, persist::Ptr{hbool_t}, threshold::Ptr{hsize_t})::herr_t "Error in h5p_get_file_space_strategy (not annotated)"

@bind h5p_get_istore_k(plist_id::hid_t, ik::Ptr{Cuint})::herr_t "Error in h5p_get_istore_k (not annotated)"

@bind h5p_get_shared_mesg_index(plist_id::hid_t, index_num::Cuint, mesg_type_flags::Ptr{Cuint}, min_mesg_size::Ptr{Cuint})::herr_t "Error in h5p_get_shared_mesg_index (not annotated)"

@bind h5p_get_shared_mesg_nindexes(plist_id::hid_t, nindexes::Ptr{Cuint})::herr_t "Error in h5p_get_shared_mesg_nindexes (not annotated)"

@bind h5p_get_shared_mesg_phase_change(plist_id::hid_t, max_list::Ptr{Cuint}, min_btree::Ptr{Cuint})::herr_t "Error in h5p_get_shared_mesg_phase_change (not annotated)"

@bind h5p_get_sizes(plist_id::hid_t, sizeof_addr::Ptr{Csize_t}, sizeof_size::Ptr{Csize_t})::herr_t "Error in h5p_get_sizes (not annotated)"

@bind h5p_get_sym_k(plist_id::hid_t, ik::Ptr{Cuint}, lk::Ptr{Cuint})::herr_t "Error in h5p_get_sym_k (not annotated)"

@bind h5p_get_userblock(plist_id::hid_t, size::Ptr{hsize_t})::herr_t "Error in h5p_get_userblock (not annotated)"

@bind h5p_set_file_space_page_size(plist_id::hid_t, fsp_size::hsize_t)::herr_t "Error in h5p_set_file_space_page_size (not annotated)"

@bind h5p_set_file_space_strategy(plist_id::hid_t, strategy::H5F_fspace_strategy_t, persist::hbool_t, threshold::hsize_t)::herr_t "Error in h5p_set_file_space_strategy (not annotated)"

@bind h5p_set_istore_k(plist_id::hid_t, ik::Cuint)::herr_t "Error in h5p_set_istore_k (not annotated)"

@bind h5p_set_shared_mesg_index(plist_id::hid_t, index_num::Cuint, mesg_type_flags::Cuint, min_mesg_size::Cuint)::herr_t "Error in h5p_set_shared_mesg_index (not annotated)"

@bind h5p_set_shared_mesg_nindexes(plist_id::hid_t, nindexes::Cuint)::herr_t "Error in h5p_set_shared_mesg_nindexes (not annotated)"

@bind h5p_set_shared_mesg_phase_change(plist_id::hid_t, max_list::Cuint, min_btree::Cuint)::herr_t "Error in h5p_set_shared_mesg_phase_change (not annotated)"

@bind h5p_set_sizes(plist_id::hid_t, sizeof_addr::Csize_t, sizeof_size::Csize_t)::herr_t "Error in h5p_set_sizes (not annotated)"

@bind h5p_set_sym_k(plist_id::hid_t, ik::Cuint, lk::Cuint)::herr_t "Error in h5p_set_sym_k (not annotated)"

@bind h5p_set_userblock(plist_id::hid_t, size::hsize_t)::herr_t "Error in h5p_set_userblock (not annotated)"

@bind h5p_get_alignment(fapl_id::hid_t, threshold::Ptr{hsize_t}, alignment::Ptr{hsize_t})::herr_t "Error in h5p_get_alignment (not annotated)"

@bind h5p_get_cache(plist_id::hid_t, mdc_nelmts::Ptr{Cint}, rdcc_nslots::Ptr{Csize_t}, rdcc_nbytes::Ptr{Csize_t}, rdcc_w0::Ptr{Cdouble})::herr_t "Error in h5p_get_cache (not annotated)"

@bind h5p_get_core_write_tracking(fapl_id::hid_t, is_enabled::Ptr{hbool_t}, page_size::Ptr{Csize_t})::herr_t "Error in h5p_get_core_write_tracking (not annotated)"

@bind h5p_get_driver(plist_id::hid_t)::hid_t "Error in h5p_get_driver (not annotated)"

@bind h5p_get_driver_info(plist_id::hid_t)::Ptr{Cvoid} "Error in h5p_get_driver_info (not annotated)"

@bind h5p_get_elink_file_cache_size(plist_id::hid_t, efc_size::Ptr{Cuint})::herr_t "Error in h5p_get_elink_file_cache_size (not annotated)"

@bind h5p_get_evict_on_close(fapl_id::hid_t, evict_on_close::Ptr{hbool_t})::herr_t "Error in h5p_get_evict_on_close (not annotated)"

@bind h5p_get_family_offset(fapl_id::hid_t, offset::Ptr{hsize_t})::herr_t "Error in h5p_get_family_offset (not annotated)"

@bind h5p_get_fclose_degree(fapl_id::hid_t, degree::Ptr{H5F_close_degree_t})::herr_t "Error in h5p_get_fclose_degree (not annotated)"

@bind h5p_get_file_image(fapl_id::hid_t, buf_ptr_ptr::Ptr{Ptr{Cvoid}}, buf_len_ptr::Ptr{Csize_t})::herr_t "Error in h5p_get_file_image (not annotated)"

@bind h5p_get_file_image_callbacks(fapl_id::hid_t, callbacks_ptr::Ptr{H5FD_file_image_callbacks_t})::herr_t "Error in h5p_get_file_image_callbacks (not annotated)"

@bind h5p_get_file_locking(fapl_id::hid_t, use_file_locking::Ptr{hbool_t}, ignore_when_disabled::Ptr{hbool_t})::herr_t "Error in h5p_get_file_locking (not annotated)"

@bind h5p_get_gc_references(fapl_id::hid_t, gc_ref::Ptr{Cuint})::herr_t "Error in h5p_get_gc_references (not annotated)"

@bind h5p_get_libver_bounds(plist_id::hid_t, low::Ptr{H5F_libver_t}, high::Ptr{H5F_libver_t})::herr_t "Error in h5p_get_libver_bounds (not annotated)"

@bind h5p_get_mdc_config(plist_id::hid_t, config_ptr::Ptr{H5AC_cache_config_t})::herr_t "Error in h5p_get_mdc_config (not annotated)"

@bind h5p_get_mdc_image_config(plist_id::hid_t, config_ptr::Ptr{H5AC_cache_image_config_t})::herr_t "Error in h5p_get_mdc_image_config (not annotated)"

@bind h5p_get_mdc_log_options(plist_id::hid_t, is_enabled::Ptr{hbool_t}, location::Ptr{Cchar}, location_size::Ptr{Csize_t}, start_on_access::Ptr{hbool_t})::herr_t "Error in h5p_get_mdc_log_options (not annotated)"

@bind h5p_get_meta_block_size(fapl_id::hid_t, size::Ptr{hsize_t})::herr_t "Error in h5p_get_meta_block_size (not annotated)"

@bind h5p_get_metadata_read_attempts(plist_id::hid_t, attempts::Ptr{Cuint})::herr_t "Error in h5p_get_metadata_read_attempts (not annotated)"

@bind h5p_get_multi_type(fapl_id::hid_t, type::Ptr{H5FD_mem_t})::herr_t "Error in h5p_get_multi_type (not annotated)"

@bind h5p_get_object_flush_cb(plist_id::hid_t, func::Ptr{H5F_flush_cb_t}, udata::Ptr{Ptr{Cvoid}})::herr_t "Error in h5p_get_object_flush_cb (not annotated)"

@bind h5p_get_page_buffer_size(plist_id::hid_t, buf_size::Ptr{Csize_t}, min_meta_perc::Ptr{Cuint}, min_raw_perc::Ptr{Cuint})::herr_t "Error in h5p_get_page_buffer_size (not annotated)"

@bind h5p_get_sieve_buf_size(fapl_id::hid_t, size::Ptr{Csize_t})::herr_t "Error in h5p_get_sieve_buf_size (not annotated)"

@bind h5p_get_small_data_block_size(fapl_id::hid_t, size::Ptr{hsize_t})::herr_t "Error in h5p_get_small_data_block_size (not annotated)"

@bind h5p_get_vol_id(plist_id::hid_t, vol_id::Ptr{hid_t})::herr_t "Error in h5p_get_vol_id (not annotated)"

@bind h5p_get_vol_info(plist_id::hid_t, vol_info::Ptr{Ptr{Cvoid}})::herr_t "Error in h5p_get_vol_info (not annotated)"

@bind h5p_set_alignment(fapl_id::hid_t, threshold::hsize_t, alignment::hsize_t)::herr_t "Error in h5p_set_alignment (not annotated)"

@bind h5p_set_cache(plist_id::hid_t, mdc_nelmts::Cint, rdcc_nslots::Csize_t, rdcc_nbytes::Csize_t, rdcc_w0::Cdouble)::herr_t "Error in h5p_set_cache (not annotated)"

@bind h5p_set_core_write_tracking(fapl_id::hid_t, is_enabled::hbool_t, page_size::Csize_t)::herr_t "Error in h5p_set_core_write_tracking (not annotated)"

@bind h5p_set_driver(plist_id::hid_t, driver_id::hid_t, driver_info::Ptr{Cvoid})::herr_t "Error in h5p_set_driver (not annotated)"

@bind h5p_set_elink_file_cache_size(plist_id::hid_t, efc_size::Cuint)::herr_t "Error in h5p_set_elink_file_cache_size (not annotated)"

@bind h5p_set_evict_on_close(fapl_id::hid_t, evict_on_close::hbool_t)::herr_t "Error in h5p_set_evict_on_close (not annotated)"

@bind h5p_set_family_offset(fapl_id::hid_t, offset::hsize_t)::herr_t "Error in h5p_set_family_offset (not annotated)"

@bind h5p_set_fclose_degree(fapl_id::hid_t, degree::H5F_close_degree_t)::herr_t "Error in h5p_set_fclose_degree (not annotated)"

@bind h5p_set_file_image(fapl_id::hid_t, buf_ptr::Ptr{Cvoid}, buf_len::Csize_t)::herr_t "Error in h5p_set_file_image (not annotated)"

@bind h5p_set_file_image_callbacks(fapl_id::hid_t, callbacks_ptr::Ptr{H5FD_file_image_callbacks_t})::herr_t "Error in h5p_set_file_image_callbacks (not annotated)"

@bind h5p_set_file_locking(fapl_id::hid_t, use_file_locking::hbool_t, ignore_when_disabled::hbool_t)::herr_t "Error in h5p_set_file_locking (not annotated)"

@bind h5p_set_gc_references(fapl_id::hid_t, gc_ref::Cuint)::herr_t "Error in h5p_set_gc_references (not annotated)"

@bind h5p_set_libver_bounds(plist_id::hid_t, low::H5F_libver_t, high::H5F_libver_t)::herr_t "Error in h5p_set_libver_bounds (not annotated)"

@bind h5p_set_mdc_config(plist_id::hid_t, config_ptr::Ptr{H5AC_cache_config_t})::herr_t "Error in h5p_set_mdc_config (not annotated)"

@bind h5p_set_mdc_log_options(plist_id::hid_t, is_enabled::hbool_t, location::Ptr{Cchar}, start_on_access::hbool_t)::herr_t "Error in h5p_set_mdc_log_options (not annotated)"

@bind h5p_set_meta_block_size(fapl_id::hid_t, size::hsize_t)::herr_t "Error in h5p_set_meta_block_size (not annotated)"

@bind h5p_set_metadata_read_attempts(plist_id::hid_t, attempts::Cuint)::herr_t "Error in h5p_set_metadata_read_attempts (not annotated)"

@bind h5p_set_multi_type(fapl_id::hid_t, type::H5FD_mem_t)::herr_t "Error in h5p_set_multi_type (not annotated)"

@bind h5p_set_object_flush_cb(plist_id::hid_t, func::H5F_flush_cb_t, udata::Ptr{Cvoid})::herr_t "Error in h5p_set_object_flush_cb (not annotated)"

@bind h5p_set_sieve_buf_size(fapl_id::hid_t, size::Csize_t)::herr_t "Error in h5p_set_sieve_buf_size (not annotated)"

@bind h5p_set_small_data_block_size(fapl_id::hid_t, size::hsize_t)::herr_t "Error in h5p_set_small_data_block_size (not annotated)"

@bind h5p_set_vol(plist_id::hid_t, new_vol_id::hid_t, new_vol_info::Ptr{Cvoid})::herr_t "Error in h5p_set_vol (not annotated)"

@bind h5p_set_mdc_image_config(plist_id::hid_t, config_ptr::Ptr{H5AC_cache_image_config_t})::herr_t "Error in h5p_set_mdc_image_config (not annotated)"

@bind h5p_set_page_buffer_size(plist_id::hid_t, buf_size::Csize_t, min_meta_per::Cuint, min_raw_per::Cuint)::herr_t "Error in h5p_set_page_buffer_size (not annotated)"

@bind h5p_fill_value_defined(plist::hid_t, status::Ptr{H5D_fill_value_t})::herr_t "Error in h5p_fill_value_defined (not annotated)"

@bind h5p_get_alloc_time(plist_id::hid_t, alloc_time::Ptr{H5D_alloc_time_t})::herr_t "Error in h5p_get_alloc_time (not annotated)"

@bind h5p_get_chunk(plist_id::hid_t, max_ndims::Cint, dim::Ptr{hsize_t})::Cint "Error in h5p_get_chunk (not annotated)"

@bind h5p_get_chunk_opts(plist_id::hid_t, opts::Ptr{Cuint})::herr_t "Error in h5p_get_chunk_opts (not annotated)"

@bind h5p_get_dset_no_attrs_hint(dcpl_id::hid_t, minimize::Ptr{hbool_t})::herr_t "Error in h5p_get_dset_no_attrs_hint (not annotated)"

@bind h5p_get_external(plist_id::hid_t, idx::Cuint, name_size::Csize_t, name::Ptr{Cchar}, offset::Ptr{off_t}, size::Ptr{hsize_t})::herr_t "Error in h5p_get_external (not annotated)"

@bind h5p_get_external_count(plist_id::hid_t)::Cint "Error in h5p_get_external_count (not annotated)"

@bind h5p_get_fill_time(plist_id::hid_t, fill_time::Ptr{H5D_fill_time_t})::herr_t "Error in h5p_get_fill_time (not annotated)"

@bind h5p_get_fill_value(plist_id::hid_t, type_id::hid_t, value::Ptr{Cvoid})::herr_t "Error in h5p_get_fill_value (not annotated)"

@bind h5p_get_layout(plist_id::hid_t)::H5D_layout_t "Error in h5p_get_layout (not annotated)"

@bind h5p_get_virtual_count(dcpl_id::hid_t, count::Ptr{Csize_t})::herr_t "Error in h5p_get_virtual_count (not annotated)"

@bind h5p_get_virtual_dsetname(dcpl_id::hid_t, index::Csize_t, name::Ptr{Cchar}, size::Csize_t)::Cssize_t "Error in h5p_get_virtual_dsetname (not annotated)"

@bind h5p_get_virtual_filename(dcpl_id::hid_t, index::Csize_t, name::Ptr{Cchar}, size::Csize_t)::Cssize_t "Error in h5p_get_virtual_filename (not annotated)"

@bind h5p_get_virtual_srcspace(dcpl_id::hid_t, index::Csize_t)::hid_t "Error in h5p_get_virtual_srcspace (not annotated)"

@bind h5p_get_virtual_vspace(dcpl_id::hid_t, index::Csize_t)::hid_t "Error in h5p_get_virtual_vspace (not annotated)"

@bind h5p_set_alloc_time(plist_id::hid_t, alloc_time::H5D_alloc_time_t)::herr_t "Error in h5p_set_alloc_time (not annotated)"

@bind h5p_set_chunk(plist_id::hid_t, ndims::Cint, dim::Ptr{hsize_t})::herr_t "Error in h5p_set_chunk (not annotated)"

@bind h5p_set_chunk_opts(plist_id::hid_t, opts::Cuint)::herr_t "Error in h5p_set_chunk_opts (not annotated)"

@bind h5p_set_dset_no_attrs_hint(dcpl_id::hid_t, minimize::hbool_t)::herr_t "Error in h5p_set_dset_no_attrs_hint (not annotated)"

@bind h5p_set_external(plist_id::hid_t, name::Ptr{Cchar}, offset::off_t, size::hsize_t)::herr_t "Error in h5p_set_external (not annotated)"

@bind h5p_set_fill_time(plist_id::hid_t, fill_time::H5D_fill_time_t)::herr_t "Error in h5p_set_fill_time (not annotated)"

@bind h5p_set_fill_value(plist_id::hid_t, type_id::hid_t, value::Ptr{Cvoid})::herr_t "Error in h5p_set_fill_value (not annotated)"

@bind h5p_set_shuffle(plist_id::hid_t)::herr_t "Error in h5p_set_shuffle (not annotated)"

@bind h5p_set_layout(plist_id::hid_t, layout::H5D_layout_t)::herr_t "Error in h5p_set_layout (not annotated)"

@bind h5p_set_nbit(plist_id::hid_t)::herr_t "Error in h5p_set_nbit (not annotated)"

@bind h5p_set_scaleoffset(plist_id::hid_t, scale_type::H5Z_SO_scale_type_t, scale_factor::Cint)::herr_t "Error in h5p_set_scaleoffset (not annotated)"

@bind h5p_set_szip(plist_id::hid_t, options_mask::Cuint, pixels_per_block::Cuint)::herr_t "Error in h5p_set_szip (not annotated)"

@bind h5p_set_virtual(dcpl_id::hid_t, vspace_id::hid_t, src_file_name::Ptr{Cchar}, src_dset_name::Ptr{Cchar}, src_space_id::hid_t)::herr_t "Error in h5p_set_virtual (not annotated)"

@bind h5p_get_append_flush(dapl_id::hid_t, dims::Cuint, boundary::Ptr{hsize_t}, func::Ptr{H5D_append_cb_t}, udata::Ptr{Ptr{Cvoid}})::herr_t "Error in h5p_get_append_flush (not annotated)"

@bind h5p_get_chunk_cache(dapl_id::hid_t, rdcc_nslots::Ptr{Csize_t}, rdcc_nbytes::Ptr{Csize_t}, rdcc_w0::Ptr{Cdouble})::herr_t "Error in h5p_get_chunk_cache (not annotated)"

@bind h5p_get_efile_prefix(dapl_id::hid_t, prefix::Ptr{Cchar}, size::Csize_t)::Cssize_t "Error in h5p_get_efile_prefix (not annotated)"

@bind h5p_get_virtual_prefix(dapl_id::hid_t, prefix::Ptr{Cchar}, size::Csize_t)::Cssize_t "Error in h5p_get_virtual_prefix (not annotated)"

@bind h5p_get_virtual_printf_gap(dapl_id::hid_t, gap_size::Ptr{hsize_t})::herr_t "Error in h5p_get_virtual_printf_gap (not annotated)"

@bind h5p_get_virtual_view(dapl_id::hid_t, view::Ptr{H5D_vds_view_t})::herr_t "Error in h5p_get_virtual_view (not annotated)"

@bind h5p_set_append_flush(dapl_id::hid_t, ndims::Cuint, boundary::Ptr{hsize_t}, func::H5D_append_cb_t, udata::Ptr{Cvoid})::herr_t "Error in h5p_set_append_flush (not annotated)"

@bind h5p_set_chunk_cache(dapl_id::hid_t, rdcc_nslots::Csize_t, rdcc_nbytes::Csize_t, rdcc_w0::Cdouble)::herr_t "Error in h5p_set_chunk_cache (not annotated)"

@bind h5p_set_efile_prefix(dapl_id::hid_t, prefix::Ptr{Cchar})::herr_t "Error in h5p_set_efile_prefix (not annotated)"

@bind h5p_set_virtual_prefix(dapl_id::hid_t, prefix::Ptr{Cchar})::herr_t "Error in h5p_set_virtual_prefix (not annotated)"

@bind h5p_set_virtual_printf_gap(dapl_id::hid_t, gap_size::hsize_t)::herr_t "Error in h5p_set_virtual_printf_gap (not annotated)"

@bind h5p_set_virtual_view(dapl_id::hid_t, view::H5D_vds_view_t)::herr_t "Error in h5p_set_virtual_view (not annotated)"

@bind h5p_get_btree_ratios(plist_id::hid_t, left::Ptr{Cdouble}, middle::Ptr{Cdouble}, right::Ptr{Cdouble})::herr_t "Error in h5p_get_btree_ratios (not annotated)"

@bind h5p_get_buffer(plist_id::hid_t, tconv::Ptr{Ptr{Cvoid}}, bkg::Ptr{Ptr{Cvoid}})::Csize_t "Error in h5p_get_buffer (not annotated)"

@bind h5p_get_data_transform(plist_id::hid_t, expression::Ptr{Cchar}, size::Csize_t)::Cssize_t "Error in h5p_get_data_transform (not annotated)"

@bind h5p_get_edc_check(plist_id::hid_t)::H5Z_EDC_t "Error in h5p_get_edc_check (not annotated)"

@bind h5p_get_hyper_vector_size(fapl_id::hid_t, size::Ptr{Csize_t})::herr_t "Error in h5p_get_hyper_vector_size (not annotated)"

@bind h5p_get_preserve(plist_id::hid_t)::Cint "Error in h5p_get_preserve (not annotated)"

@bind h5p_get_type_conv_cb(dxpl_id::hid_t, op::Ptr{H5T_conv_except_func_t}, operate_data::Ptr{Ptr{Cvoid}})::herr_t "Error in h5p_get_type_conv_cb (not annotated)"

@bind h5p_get_vlen_mem_manager(plist_id::hid_t, alloc_func::Ptr{H5MM_allocate_t}, alloc_info::Ptr{Ptr{Cvoid}}, free_func::Ptr{H5MM_free_t}, free_info::Ptr{Ptr{Cvoid}})::herr_t "Error in h5p_get_vlen_mem_manager (not annotated)"

@bind h5p_set_btree_ratios(plist_id::hid_t, left::Cdouble, middle::Cdouble, right::Cdouble)::herr_t "Error in h5p_set_btree_ratios (not annotated)"

@bind h5p_set_buffer(plist_id::hid_t, size::Csize_t, tconv::Ptr{Cvoid}, bkg::Ptr{Cvoid})::herr_t "Error in h5p_set_buffer (not annotated)"

@bind h5p_set_data_transform(plist_id::hid_t, expression::Ptr{Cchar})::herr_t "Error in h5p_set_data_transform (not annotated)"

@bind h5p_set_edc_check(plist_id::hid_t, check::H5Z_EDC_t)::herr_t "Error in h5p_set_edc_check (not annotated)"

@bind h5p_set_filter_callback(plist_id::hid_t, func::H5Z_filter_func_t, op_data::Ptr{Cvoid})::herr_t "Error in h5p_set_filter_callback (not annotated)"

@bind h5p_set_hyper_vector_size(plist_id::hid_t, size::Csize_t)::herr_t "Error in h5p_set_hyper_vector_size (not annotated)"

@bind h5p_set_preserve(plist_id::hid_t, status::hbool_t)::herr_t "Error in h5p_set_preserve (not annotated)"

@bind h5p_set_type_conv_cb(dxpl_id::hid_t, op::H5T_conv_except_func_t, operate_data::Ptr{Cvoid})::herr_t "Error in h5p_set_type_conv_cb (not annotated)"

@bind h5p_set_vlen_mem_manager(plist_id::hid_t, alloc_func::H5MM_allocate_t, alloc_info::Ptr{Cvoid}, free_func::H5MM_free_t, free_info::Ptr{Cvoid})::herr_t "Error in h5p_set_vlen_mem_manager (not annotated)"

@bind h5p_get_create_intermediate_group(plist_id::hid_t, crt_intmd::Ptr{Cuint})::herr_t "Error in h5p_get_create_intermediate_group (not annotated)"

@bind h5p_set_create_intermediate_group(plist_id::hid_t, crt_intmd::Cuint)::herr_t "Error in h5p_set_create_intermediate_group (not annotated)"

@bind h5p_get_est_link_info(plist_id::hid_t, est_num_entries::Ptr{Cuint}, est_name_len::Ptr{Cuint})::herr_t "Error in h5p_get_est_link_info (not annotated)"

@bind h5p_get_link_creation_order(plist_id::hid_t, crt_order_flags::Ptr{Cuint})::herr_t "Error in h5p_get_link_creation_order (not annotated)"

@bind h5p_get_link_phase_change(plist_id::hid_t, max_compact::Ptr{Cuint}, min_dense::Ptr{Cuint})::herr_t "Error in h5p_get_link_phase_change (not annotated)"

@bind h5p_get_local_heap_size_hint(plist_id::hid_t, size_hint::Ptr{Csize_t})::herr_t "Error in h5p_get_local_heap_size_hint (not annotated)"

@bind h5p_set_est_link_info(plist_id::hid_t, est_num_entries::Cuint, est_name_len::Cuint)::herr_t "Error in h5p_set_est_link_info (not annotated)"

@bind h5p_set_link_creation_order(plist_id::hid_t, crt_order_flags::Cuint)::herr_t "Error in h5p_set_link_creation_order (not annotated)"

@bind h5p_set_link_phase_change(plist_id::hid_t, max_compact::Cuint, min_dense::Cuint)::herr_t "Error in h5p_set_link_phase_change (not annotated)"

@bind h5p_set_local_heap_size_hint(plist_id::hid_t, size_hint::Csize_t)::herr_t "Error in h5p_set_local_heap_size_hint (not annotated)"

@bind h5p_get_char_encoding(plist_id::hid_t, encoding::Ptr{H5T_cset_t})::herr_t "Error in h5p_get_char_encoding (not annotated)"

@bind h5p_set_char_encoding(plist_id::hid_t, encoding::H5T_cset_t)::herr_t "Error in h5p_set_char_encoding (not annotated)"

@bind h5p_get_elink_acc_flags(lapl_id::hid_t, flags::Ptr{Cuint})::herr_t "Error in h5p_get_elink_acc_flags (not annotated)"

@bind h5p_get_elink_cb(lapl_id::hid_t, func::Ptr{H5L_elink_traverse_t}, op_data::Ptr{Ptr{Cvoid}})::herr_t "Error in h5p_get_elink_cb (not annotated)"

@bind h5p_get_elink_fapl(lapl_id::hid_t)::hid_t "Error in h5p_get_elink_fapl (not annotated)"

@bind h5p_get_elink_prefix(plist_id::hid_t, prefix::Ptr{Cchar}, size::Csize_t)::Cssize_t "Error in h5p_get_elink_prefix (not annotated)"

@bind h5p_get_nlinks(plist_id::hid_t, nlinks::Ptr{Csize_t})::herr_t "Error in h5p_get_nlinks (not annotated)"

@bind h5p_set_elink_acc_flags(lapl_id::hid_t, flags::Cuint)::herr_t "Error in h5p_set_elink_acc_flags (not annotated)"

@bind h5p_set_elink_cb(lapl_id::hid_t, func::H5L_elink_traverse_t, op_data::Ptr{Cvoid})::herr_t "Error in h5p_set_elink_cb (not annotated)"

@bind h5p_set_elink_fapl(lapl_id::hid_t, fapl_id::hid_t)::herr_t "Error in h5p_set_elink_fapl (not annotated)"

@bind h5p_set_elink_prefix(plist_id::hid_t, prefix::Ptr{Cchar})::herr_t "Error in h5p_set_elink_prefix (not annotated)"

@bind h5p_set_nlinks(plist_id::hid_t, nlinks::Csize_t)::herr_t "Error in h5p_set_nlinks (not annotated)"

@bind h5p_add_merge_committed_dtype_path(plist_id::hid_t, path::Ptr{Cchar})::herr_t "Error in h5p_add_merge_committed_dtype_path (not annotated)"

@bind h5p_free_merge_committed_dtype_paths(plist_id::hid_t)::herr_t "Error in h5p_free_merge_committed_dtype_paths (not annotated)"

@bind h5p_get_copy_object(plist_id::hid_t, copy_options::Ptr{Cuint})::herr_t "Error in h5p_get_copy_object (not annotated)"

@bind h5p_get_mcdt_search_cb(plist_id::hid_t, func::Ptr{H5O_mcdt_search_cb_t}, op_data::Ptr{Ptr{Cvoid}})::herr_t "Error in h5p_get_mcdt_search_cb (not annotated)"

@bind h5p_set_copy_object(plist_id::hid_t, copy_options::Cuint)::herr_t "Error in h5p_set_copy_object (not annotated)"

@bind h5p_set_mcdt_search_cb(plist_id::hid_t, func::H5O_mcdt_search_cb_t, op_data::Ptr{Cvoid})::herr_t "Error in h5p_set_mcdt_search_cb (not annotated)"

@bind h5p_register1(cls_id::hid_t, name::Ptr{Cchar}, size::Csize_t, def_value::Ptr{Cvoid}, prp_create::H5P_prp_create_func_t, prp_set::H5P_prp_set_func_t, prp_get::H5P_prp_get_func_t, prp_del::H5P_prp_delete_func_t, prp_copy::H5P_prp_copy_func_t, prp_close::H5P_prp_close_func_t)::herr_t "Error in h5p_register1 (not annotated)"

@bind h5p_insert1(plist_id::hid_t, name::Ptr{Cchar}, size::Csize_t, value::Ptr{Cvoid}, prp_set::H5P_prp_set_func_t, prp_get::H5P_prp_get_func_t, prp_delete::H5P_prp_delete_func_t, prp_copy::H5P_prp_copy_func_t, prp_close::H5P_prp_close_func_t)::herr_t "Error in h5p_insert1 (not annotated)"

@bind h5p_encode1(plist_id::hid_t, buf::Ptr{Cvoid}, nalloc::Ptr{Csize_t})::herr_t "Error in h5p_encode1 (not annotated)"

@bind h5p_get_filter1(plist_id::hid_t, filter::Cuint, flags::Ptr{Cuint}, cd_nelmts::Ptr{Csize_t}, cd_values::Ptr{Cuint}, namelen::Csize_t, name::Ptr{Cchar})::H5Z_filter_t "Error in h5p_get_filter1 (not annotated)"

@bind h5p_get_filter_by_id1(plist_id::hid_t, id::H5Z_filter_t, flags::Ptr{Cuint}, cd_nelmts::Ptr{Csize_t}, cd_values::Ptr{Cuint}, namelen::Csize_t, name::Ptr{Cchar})::herr_t "Error in h5p_get_filter_by_id1 (not annotated)"

@bind h5p_get_version(plist_id::hid_t, boot::Ptr{Cuint}, freelist::Ptr{Cuint}, stab::Ptr{Cuint}, shhdr::Ptr{Cuint})::herr_t "Error in h5p_get_version (not annotated)"

@bind h5p_set_file_space(plist_id::hid_t, strategy::H5F_file_space_type_t, threshold::hsize_t)::herr_t "Error in h5p_set_file_space (not annotated)"

@bind h5p_get_file_space(plist_id::hid_t, strategy::Ptr{H5F_file_space_type_t}, threshold::Ptr{hsize_t})::herr_t "Error in h5p_get_file_space (not annotated)"

@cenum H5PL_type_t::Int32 begin
    H5PL_TYPE_ERROR = -1
    H5PL_TYPE_FILTER = 0
    H5PL_TYPE_VOL = 1
    H5PL_TYPE_NONE = 2
end

@bind h5pl_set_loading_state(plugin_control_mask::Cuint)::herr_t "Error in h5pl_set_loading_state (not annotated)"

@bind h5pl_get_loading_state(plugin_control_mask::Ptr{Cuint})::herr_t "Error in h5pl_get_loading_state (not annotated)"

@bind h5pl_append(search_path::Ptr{Cchar})::herr_t "Error in h5pl_append (not annotated)"

@bind h5pl_prepend(search_path::Ptr{Cchar})::herr_t "Error in h5pl_prepend (not annotated)"

@bind h5pl_replace(search_path::Ptr{Cchar}, index::Cuint)::herr_t "Error in h5pl_replace (not annotated)"

@bind h5pl_insert(search_path::Ptr{Cchar}, index::Cuint)::herr_t "Error in h5pl_insert (not annotated)"

@bind h5pl_remove(index::Cuint)::herr_t "Error in h5pl_remove (not annotated)"

@bind h5pl_get(index::Cuint, path_buf::Ptr{Cchar}, buf_size::Csize_t)::Cssize_t "Error in h5pl_get (not annotated)"

@bind h5pl_size(num_paths::Ptr{Cuint})::herr_t "Error in h5pl_size (not annotated)"

const hobj_ref_t = haddr_t

struct hdset_reg_ref_t
    __data::NTuple{12, UInt8}
end

struct var"##Ctag#295"
    data::NTuple{64, UInt8}
end

function Base.getproperty(x::Ptr{var"##Ctag#295"}, f::Symbol)
    f === :__data && return Ptr{NTuple{64, UInt8}}(x + 0)
    f === :align && return Ptr{Int64}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#295", f::Symbol)
    r = Ref{var"##Ctag#295"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#295"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#295"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct H5R_ref_t
    u::var"##Ctag#295"
end

@bind h5r_create_object(loc_id::hid_t, name::Ptr{Cchar}, oapl_id::hid_t, ref_ptr::Ptr{H5R_ref_t})::herr_t "Error in h5r_create_object (not annotated)"

@bind h5r_create_region(loc_id::hid_t, name::Ptr{Cchar}, space_id::hid_t, oapl_id::hid_t, ref_ptr::Ptr{H5R_ref_t})::herr_t "Error in h5r_create_region (not annotated)"

@bind h5r_create_attr(loc_id::hid_t, name::Ptr{Cchar}, attr_name::Ptr{Cchar}, oapl_id::hid_t, ref_ptr::Ptr{H5R_ref_t})::herr_t "Error in h5r_create_attr (not annotated)"

@bind h5r_destroy(ref_ptr::Ptr{H5R_ref_t})::herr_t "Error in h5r_destroy (not annotated)"

@bind h5r_get_type(ref_ptr::Ptr{H5R_ref_t})::H5R_type_t "Error in h5r_get_type (not annotated)"

@bind h5r_equal(ref1_ptr::Ptr{H5R_ref_t}, ref2_ptr::Ptr{H5R_ref_t})::htri_t "Error in h5r_equal (not annotated)"

@bind h5r_copy(src_ref_ptr::Ptr{H5R_ref_t}, dst_ref_ptr::Ptr{H5R_ref_t})::herr_t "Error in h5r_copy (not annotated)"

@bind h5r_open_object(ref_ptr::Ptr{H5R_ref_t}, rapl_id::hid_t, oapl_id::hid_t)::hid_t "Error in h5r_open_object (not annotated)"

@bind h5r_open_region(ref_ptr::Ptr{H5R_ref_t}, rapl_id::hid_t, oapl_id::hid_t)::hid_t "Error in h5r_open_region (not annotated)"

@bind h5r_open_attr(ref_ptr::Ptr{H5R_ref_t}, rapl_id::hid_t, aapl_id::hid_t)::hid_t "Error in h5r_open_attr (not annotated)"

@bind h5r_get_obj_type3(ref_ptr::Ptr{H5R_ref_t}, rapl_id::hid_t, obj_type::Ptr{H5O_type_t})::herr_t "Error in h5r_get_obj_type3 (not annotated)"

@bind h5r_get_file_name(ref_ptr::Ptr{H5R_ref_t}, name::Ptr{Cchar}, size::Csize_t)::Cssize_t "Error in h5r_get_file_name (not annotated)"

@bind h5r_get_obj_name(ref_ptr::Ptr{H5R_ref_t}, rapl_id::hid_t, name::Ptr{Cchar}, size::Csize_t)::Cssize_t "Error in h5r_get_obj_name (not annotated)"

@bind h5r_get_attr_name(ref_ptr::Ptr{H5R_ref_t}, name::Ptr{Cchar}, size::Csize_t)::Cssize_t "Error in h5r_get_attr_name (not annotated)"

@bind h5r_get_obj_type1(id::hid_t, ref_type::H5R_type_t, ref::Ptr{Cvoid})::H5G_obj_t "Error in h5r_get_obj_type1 (not annotated)"

@bind h5r_dereference1(obj_id::hid_t, ref_type::H5R_type_t, ref::Ptr{Cvoid})::hid_t "Error in h5r_dereference1 (not annotated)"

@bind h5r_create(ref::Ptr{Cvoid}, loc_id::hid_t, name::Ptr{Cchar}, ref_type::H5R_type_t, space_id::hid_t)::herr_t "Error in h5r_create (not annotated)"

@bind h5r_get_region(dataset::hid_t, ref_type::H5R_type_t, ref::Ptr{Cvoid})::hid_t "Error in h5r_get_region (not annotated)"

@bind h5r_get_name(loc_id::hid_t, ref_type::H5R_type_t, ref::Ptr{Cvoid}, name::Ptr{Cchar}, size::Csize_t)::Cssize_t "Error in h5r_get_name (not annotated)"

@cenum H5S_class_t::Int32 begin
    H5S_NO_CLASS = -1
    H5S_SCALAR = 0
    H5S_SIMPLE = 1
    H5S_NULL = 2
end

@cenum H5S_seloper_t::Int32 begin
    H5S_SELECT_NOOP = -1
    H5S_SELECT_SET = 0
    H5S_SELECT_OR = 1
    H5S_SELECT_AND = 2
    H5S_SELECT_XOR = 3
    H5S_SELECT_NOTB = 4
    H5S_SELECT_NOTA = 5
    H5S_SELECT_APPEND = 6
    H5S_SELECT_PREPEND = 7
    H5S_SELECT_INVALID = 8
end

@cenum H5S_sel_type::Int32 begin
    H5S_SEL_ERROR = -1
    H5S_SEL_NONE = 0
    H5S_SEL_POINTS = 1
    H5S_SEL_HYPERSLABS = 2
    H5S_SEL_ALL = 3
    H5S_SEL_N = 4
end

@bind h5s_close(space_id::hid_t)::herr_t "Error in h5s_close (not annotated)"

@bind h5s_combine_hyperslab(space_id::hid_t, op::H5S_seloper_t, start::Ptr{hsize_t}, stride::Ptr{hsize_t}, count::Ptr{hsize_t}, block::Ptr{hsize_t})::hid_t "Error in h5s_combine_hyperslab (not annotated)"

@bind h5s_combine_select(space1_id::hid_t, op::H5S_seloper_t, space2_id::hid_t)::hid_t "Error in h5s_combine_select (not annotated)"

@bind h5s_copy(space_id::hid_t)::hid_t "Error in h5s_copy (not annotated)"

@bind h5s_create(type::H5S_class_t)::hid_t "Error in h5s_create (not annotated)"

@bind h5s_create_simple(rank::Cint, dims::Ptr{hsize_t}, maxdims::Ptr{hsize_t})::hid_t "Error in h5s_create_simple (not annotated)"

@bind h5s_decode(buf::Ptr{Cvoid})::hid_t "Error in h5s_decode (not annotated)"

@bind h5s_extent_copy(dst_id::hid_t, src_id::hid_t)::herr_t "Error in h5s_extent_copy (not annotated)"

@bind h5s_extent_equal(space1_id::hid_t, space2_id::hid_t)::htri_t "Error in h5s_extent_equal (not annotated)"

@bind h5s_get_regular_hyperslab(spaceid::hid_t, start::Ptr{hsize_t}, stride::Ptr{hsize_t}, count::Ptr{hsize_t}, block::Ptr{hsize_t})::htri_t "Error in h5s_get_regular_hyperslab (not annotated)"

@bind h5s_get_select_bounds(spaceid::hid_t, start::Ptr{hsize_t}, _end::Ptr{hsize_t})::herr_t "Error in h5s_get_select_bounds (not annotated)"

@bind h5s_get_select_elem_npoints(spaceid::hid_t)::hssize_t "Error in h5s_get_select_elem_npoints (not annotated)"

@bind h5s_get_select_elem_pointlist(spaceid::hid_t, startpoint::hsize_t, numpoints::hsize_t, buf::Ptr{hsize_t})::herr_t "Error in h5s_get_select_elem_pointlist (not annotated)"

@bind h5s_get_select_hyper_blocklist(spaceid::hid_t, startblock::hsize_t, numblocks::hsize_t, buf::Ptr{hsize_t})::herr_t "Error in h5s_get_select_hyper_blocklist (not annotated)"

@bind h5s_get_select_hyper_nblocks(spaceid::hid_t)::hssize_t "Error in h5s_get_select_hyper_nblocks (not annotated)"

@bind h5s_get_select_npoints(spaceid::hid_t)::hssize_t "Error in h5s_get_select_npoints (not annotated)"

@bind h5s_get_select_type(spaceid::hid_t)::H5S_sel_type "Error in h5s_get_select_type (not annotated)"

@bind h5s_get_simple_extent_dims(space_id::hid_t, dims::Ptr{hsize_t}, maxdims::Ptr{hsize_t})::Cint "Error in h5s_get_simple_extent_dims (not annotated)"

@bind h5s_get_simple_extent_ndims(space_id::hid_t)::Cint "Error in h5s_get_simple_extent_ndims (not annotated)"

@bind h5s_get_simple_extent_npoints(space_id::hid_t)::hssize_t "Error in h5s_get_simple_extent_npoints (not annotated)"

@bind h5s_get_simple_extent_type(space_id::hid_t)::H5S_class_t "Error in h5s_get_simple_extent_type (not annotated)"

@bind h5s_is_regular_hyperslab(spaceid::hid_t)::htri_t "Error in h5s_is_regular_hyperslab (not annotated)"

@bind h5s_is_simple(space_id::hid_t)::htri_t "Error in h5s_is_simple (not annotated)"

@bind h5s_modify_select(space1_id::hid_t, op::H5S_seloper_t, space2_id::hid_t)::herr_t "Error in h5s_modify_select (not annotated)"

@bind h5s_offset_simple(space_id::hid_t, offset::Ptr{hssize_t})::herr_t "Error in h5s_offset_simple (not annotated)"

@bind h5s_sel_iter_close(sel_iter_id::hid_t)::herr_t "Error in h5s_sel_iter_close (not annotated)"

@bind h5s_sel_iter_create(spaceid::hid_t, elmt_size::Csize_t, flags::Cuint)::hid_t "Error in h5s_sel_iter_create (not annotated)"

@bind h5s_sel_iter_get_seq_list(sel_iter_id::hid_t, maxseq::Csize_t, maxbytes::Csize_t, nseq::Ptr{Csize_t}, nbytes::Ptr{Csize_t}, off::Ptr{hsize_t}, len::Ptr{Csize_t})::herr_t "Error in h5s_sel_iter_get_seq_list (not annotated)"

@bind h5s_sel_iter_reset(sel_iter_id::hid_t, space_id::hid_t)::herr_t "Error in h5s_sel_iter_reset (not annotated)"

@bind h5s_select_adjust(spaceid::hid_t, offset::Ptr{hssize_t})::herr_t "Error in h5s_select_adjust (not annotated)"

@bind h5s_select_all(spaceid::hid_t)::herr_t "Error in h5s_select_all (not annotated)"

@bind h5s_select_copy(dst_id::hid_t, src_id::hid_t)::herr_t "Error in h5s_select_copy (not annotated)"

@bind h5s_select_elements(space_id::hid_t, op::H5S_seloper_t, num_elem::Csize_t, coord::Ptr{hsize_t})::herr_t "Error in h5s_select_elements (not annotated)"

@bind h5s_select_hyperslab(space_id::hid_t, op::H5S_seloper_t, start::Ptr{hsize_t}, stride::Ptr{hsize_t}, count::Ptr{hsize_t}, block::Ptr{hsize_t})::herr_t "Error in h5s_select_hyperslab (not annotated)"

@bind h5s_select_intersect_block(space_id::hid_t, start::Ptr{hsize_t}, _end::Ptr{hsize_t})::htri_t "Error in h5s_select_intersect_block (not annotated)"

@bind h5s_select_none(spaceid::hid_t)::herr_t "Error in h5s_select_none (not annotated)"

@bind h5s_select_project_intersection(src_space_id::hid_t, dst_space_id::hid_t, src_intersect_space_id::hid_t)::hid_t "Error in h5s_select_project_intersection (not annotated)"

@bind h5s_select_shape_same(space1_id::hid_t, space2_id::hid_t)::htri_t "Error in h5s_select_shape_same (not annotated)"

@bind h5s_select_valid(spaceid::hid_t)::htri_t "Error in h5s_select_valid (not annotated)"

@bind h5s_set_extent_none(space_id::hid_t)::herr_t "Error in h5s_set_extent_none (not annotated)"

@bind h5s_set_extent_simple(space_id::hid_t, rank::Cint, dims::Ptr{hsize_t}, max::Ptr{hsize_t})::herr_t "Error in h5s_set_extent_simple (not annotated)"

@bind h5s_encode1(obj_id::hid_t, buf::Ptr{Cvoid}, nalloc::Ptr{Csize_t})::herr_t "Error in h5s_encode1 (not annotated)"

const H5VL_class_value_t = Cint

@cenum H5VL_subclass_t::UInt32 begin
    H5VL_SUBCLS_NONE = 0
    H5VL_SUBCLS_INFO = 1
    H5VL_SUBCLS_WRAP = 2
    H5VL_SUBCLS_ATTR = 3
    H5VL_SUBCLS_DATASET = 4
    H5VL_SUBCLS_DATATYPE = 5
    H5VL_SUBCLS_FILE = 6
    H5VL_SUBCLS_GROUP = 7
    H5VL_SUBCLS_LINK = 8
    H5VL_SUBCLS_OBJECT = 9
    H5VL_SUBCLS_REQUEST = 10
    H5VL_SUBCLS_BLOB = 11
    H5VL_SUBCLS_TOKEN = 12
end

@bind h5vl_register_connector_by_name(connector_name::Ptr{Cchar}, vipl_id::hid_t)::hid_t "Error in h5vl_register_connector_by_name (not annotated)"

@bind h5vl_register_connector_by_value(connector_value::H5VL_class_value_t, vipl_id::hid_t)::hid_t "Error in h5vl_register_connector_by_value (not annotated)"

@bind h5vl_is_connector_registered_by_name(name::Ptr{Cchar})::htri_t "Error in h5vl_is_connector_registered_by_name (not annotated)"

@bind h5vl_is_connector_registered_by_value(connector_value::H5VL_class_value_t)::htri_t "Error in h5vl_is_connector_registered_by_value (not annotated)"

@bind h5vl_get_connector_id(obj_id::hid_t)::hid_t "Error in h5vl_get_connector_id (not annotated)"

@bind h5vl_get_connector_id_by_name(name::Ptr{Cchar})::hid_t "Error in h5vl_get_connector_id_by_name (not annotated)"

@bind h5vl_get_connector_id_by_value(connector_value::H5VL_class_value_t)::hid_t "Error in h5vl_get_connector_id_by_value (not annotated)"

@bind h5vl_get_connector_name(id::hid_t, name::Ptr{Cchar}, size::Csize_t)::Cssize_t "Error in h5vl_get_connector_name (not annotated)"

@bind h5vl_close(connector_id::hid_t)::herr_t "Error in h5vl_close (not annotated)"

@bind h5vl_unregister_connector(connector_id::hid_t)::herr_t "Error in h5vl_unregister_connector (not annotated)"

@bind h5vl_query_optional(obj_id::hid_t, subcls::H5VL_subclass_t, opt_type::Cint, supported::Ptr{hbool_t})::herr_t "Error in h5vl_query_optional (not annotated)"

@cenum H5ES_status_t::UInt32 begin
    H5ES_STATUS_IN_PROGRESS = 0
    H5ES_STATUS_SUCCEED = 1
    H5ES_STATUS_FAIL = 2
    H5ES_STATUS_CANCELED = 3
end

@cenum H5VL_attr_get_t::UInt32 begin
    H5VL_ATTR_GET_ACPL = 0
    H5VL_ATTR_GET_INFO = 1
    H5VL_ATTR_GET_NAME = 2
    H5VL_ATTR_GET_SPACE = 3
    H5VL_ATTR_GET_STORAGE_SIZE = 4
    H5VL_ATTR_GET_TYPE = 5
end

@cenum H5VL_attr_specific_t::UInt32 begin
    H5VL_ATTR_DELETE = 0
    H5VL_ATTR_EXISTS = 1
    H5VL_ATTR_ITER = 2
    H5VL_ATTR_RENAME = 3
end

const H5VL_attr_optional_t = Cint

@cenum H5VL_dataset_get_t::UInt32 begin
    H5VL_DATASET_GET_DAPL = 0
    H5VL_DATASET_GET_DCPL = 1
    H5VL_DATASET_GET_SPACE = 2
    H5VL_DATASET_GET_SPACE_STATUS = 3
    H5VL_DATASET_GET_STORAGE_SIZE = 4
    H5VL_DATASET_GET_TYPE = 5
end

@cenum H5VL_dataset_specific_t::UInt32 begin
    H5VL_DATASET_SET_EXTENT = 0
    H5VL_DATASET_FLUSH = 1
    H5VL_DATASET_REFRESH = 2
end

const H5VL_dataset_optional_t = Cint

@cenum H5VL_datatype_get_t::UInt32 begin
    H5VL_DATATYPE_GET_BINARY = 0
    H5VL_DATATYPE_GET_TCPL = 1
end

@cenum H5VL_datatype_specific_t::UInt32 begin
    H5VL_DATATYPE_FLUSH = 0
    H5VL_DATATYPE_REFRESH = 1
end

const H5VL_datatype_optional_t = Cint

@cenum H5VL_file_get_t::UInt32 begin
    H5VL_FILE_GET_CONT_INFO = 0
    H5VL_FILE_GET_FAPL = 1
    H5VL_FILE_GET_FCPL = 2
    H5VL_FILE_GET_FILENO = 3
    H5VL_FILE_GET_INTENT = 4
    H5VL_FILE_GET_NAME = 5
    H5VL_FILE_GET_OBJ_COUNT = 6
    H5VL_FILE_GET_OBJ_IDS = 7
end

@cenum H5VL_file_specific_t::UInt32 begin
    H5VL_FILE_FLUSH = 0
    H5VL_FILE_REOPEN = 1
    H5VL_FILE_MOUNT = 2
    H5VL_FILE_UNMOUNT = 3
    H5VL_FILE_IS_ACCESSIBLE = 4
    H5VL_FILE_DELETE = 5
    H5VL_FILE_IS_EQUAL = 6
end

const H5VL_file_optional_t = Cint

@cenum H5VL_group_get_t::UInt32 begin
    H5VL_GROUP_GET_GCPL = 0
    H5VL_GROUP_GET_INFO = 1
end

@cenum H5VL_group_specific_t::UInt32 begin
    H5VL_GROUP_FLUSH = 0
    H5VL_GROUP_REFRESH = 1
end

const H5VL_group_optional_t = Cint

@cenum H5VL_link_create_type_t::UInt32 begin
    H5VL_LINK_CREATE_HARD = 0
    H5VL_LINK_CREATE_SOFT = 1
    H5VL_LINK_CREATE_UD = 2
end

@cenum H5VL_link_get_t::UInt32 begin
    H5VL_LINK_GET_INFO = 0
    H5VL_LINK_GET_NAME = 1
    H5VL_LINK_GET_VAL = 2
end

@cenum H5VL_link_specific_t::UInt32 begin
    H5VL_LINK_DELETE = 0
    H5VL_LINK_EXISTS = 1
    H5VL_LINK_ITER = 2
end

const H5VL_link_optional_t = Cint

@cenum H5VL_object_get_t::UInt32 begin
    H5VL_OBJECT_GET_FILE = 0
    H5VL_OBJECT_GET_NAME = 1
    H5VL_OBJECT_GET_TYPE = 2
    H5VL_OBJECT_GET_INFO = 3
end

@cenum H5VL_object_specific_t::UInt32 begin
    H5VL_OBJECT_CHANGE_REF_COUNT = 0
    H5VL_OBJECT_EXISTS = 1
    H5VL_OBJECT_LOOKUP = 2
    H5VL_OBJECT_VISIT = 3
    H5VL_OBJECT_FLUSH = 4
    H5VL_OBJECT_REFRESH = 5
end

const H5VL_object_optional_t = Cint

@cenum H5VL_request_specific_t::UInt32 begin
    H5VL_REQUEST_WAITANY = 0
    H5VL_REQUEST_WAITSOME = 1
    H5VL_REQUEST_WAITALL = 2
end

const H5VL_request_optional_t = Cint

@cenum H5VL_blob_specific_t::UInt32 begin
    H5VL_BLOB_DELETE = 0
    H5VL_BLOB_GETSIZE = 1
    H5VL_BLOB_ISNULL = 2
    H5VL_BLOB_SETNULL = 3
end

const H5VL_blob_optional_t = Cint

@cenum H5VL_loc_type_t::UInt32 begin
    H5VL_OBJECT_BY_SELF = 0
    H5VL_OBJECT_BY_NAME = 1
    H5VL_OBJECT_BY_IDX = 2
    H5VL_OBJECT_BY_TOKEN = 3
end

struct H5VL_loc_by_name
    name::Ptr{Cchar}
    lapl_id::hid_t
end

const H5VL_loc_by_name_t = H5VL_loc_by_name

struct H5VL_loc_by_idx
    name::Ptr{Cchar}
    idx_type::H5_index_t
    order::H5_iter_order_t
    n::hsize_t
    lapl_id::hid_t
end

const H5VL_loc_by_idx_t = H5VL_loc_by_idx

struct H5VL_loc_by_token
    token::Ptr{H5O_token_t}
end

const H5VL_loc_by_token_t = H5VL_loc_by_token

struct var"##Ctag#301"
    data::NTuple{32, UInt8}
end

function Base.getproperty(x::Ptr{var"##Ctag#301"}, f::Symbol)
    f === :loc_by_token && return Ptr{H5VL_loc_by_token_t}(x + 0)
    f === :loc_by_name && return Ptr{H5VL_loc_by_name_t}(x + 0)
    f === :loc_by_idx && return Ptr{H5VL_loc_by_idx_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#301", f::Symbol)
    r = Ref{var"##Ctag#301"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#301"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#301"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct H5VL_loc_params_t
    data::NTuple{40, UInt8}
end

function Base.getproperty(x::Ptr{H5VL_loc_params_t}, f::Symbol)
    f === :obj_type && return Ptr{H5I_type_t}(x + 0)
    f === :type && return Ptr{H5VL_loc_type_t}(x + 4)
    f === :loc_data && return Ptr{var"##Ctag#301"}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::H5VL_loc_params_t, f::Symbol)
    r = Ref{H5VL_loc_params_t}(x)
    ptr = Base.unsafe_convert(Ptr{H5VL_loc_params_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{H5VL_loc_params_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct H5VL_file_cont_info_t
    version::Cuint
    feature_flags::UInt64
    token_size::Csize_t
    blob_id_size::Csize_t
end

struct H5VL_info_class_t
    size::Csize_t
    copy::Ptr{Cvoid}
    cmp::Ptr{Cvoid}
    free::Ptr{Cvoid}
    to_str::Ptr{Cvoid}
    from_str::Ptr{Cvoid}
end

struct H5VL_wrap_class_t
    get_object::Ptr{Cvoid}
    get_wrap_ctx::Ptr{Cvoid}
    wrap_object::Ptr{Cvoid}
    unwrap_object::Ptr{Cvoid}
    free_wrap_ctx::Ptr{Cvoid}
end

struct H5VL_attr_class_t
    create::Ptr{Cvoid}
    open::Ptr{Cvoid}
    read::Ptr{Cvoid}
    write::Ptr{Cvoid}
    get::Ptr{Cvoid}
    specific::Ptr{Cvoid}
    optional::Ptr{Cvoid}
    close::Ptr{Cvoid}
end

struct H5VL_dataset_class_t
    create::Ptr{Cvoid}
    open::Ptr{Cvoid}
    read::Ptr{Cvoid}
    write::Ptr{Cvoid}
    get::Ptr{Cvoid}
    specific::Ptr{Cvoid}
    optional::Ptr{Cvoid}
    close::Ptr{Cvoid}
end

struct H5VL_datatype_class_t
    commit::Ptr{Cvoid}
    open::Ptr{Cvoid}
    get::Ptr{Cvoid}
    specific::Ptr{Cvoid}
    optional::Ptr{Cvoid}
    close::Ptr{Cvoid}
end

struct H5VL_file_class_t
    create::Ptr{Cvoid}
    open::Ptr{Cvoid}
    get::Ptr{Cvoid}
    specific::Ptr{Cvoid}
    optional::Ptr{Cvoid}
    close::Ptr{Cvoid}
end

struct H5VL_group_class_t
    create::Ptr{Cvoid}
    open::Ptr{Cvoid}
    get::Ptr{Cvoid}
    specific::Ptr{Cvoid}
    optional::Ptr{Cvoid}
    close::Ptr{Cvoid}
end

struct H5VL_link_class_t
    create::Ptr{Cvoid}
    copy::Ptr{Cvoid}
    move::Ptr{Cvoid}
    get::Ptr{Cvoid}
    specific::Ptr{Cvoid}
    optional::Ptr{Cvoid}
end

struct H5VL_object_class_t
    open::Ptr{Cvoid}
    copy::Ptr{Cvoid}
    get::Ptr{Cvoid}
    specific::Ptr{Cvoid}
    optional::Ptr{Cvoid}
end

# typedef herr_t ( * H5VL_request_notify_t ) ( void * ctx , H5ES_status_t status )
const H5VL_request_notify_t = Ptr{Cvoid}

@cenum H5VL_get_conn_lvl_t::UInt32 begin
    H5VL_GET_CONN_LVL_CURR = 0
    H5VL_GET_CONN_LVL_TERM = 1
end

struct H5VL_introspect_class_t
    get_conn_cls::Ptr{Cvoid}
    opt_query::Ptr{Cvoid}
end

struct H5VL_request_class_t
    wait::Ptr{Cvoid}
    notify::Ptr{Cvoid}
    cancel::Ptr{Cvoid}
    specific::Ptr{Cvoid}
    optional::Ptr{Cvoid}
    free::Ptr{Cvoid}
end

struct H5VL_blob_class_t
    put::Ptr{Cvoid}
    get::Ptr{Cvoid}
    specific::Ptr{Cvoid}
    optional::Ptr{Cvoid}
end

struct H5VL_token_class_t
    cmp::Ptr{Cvoid}
    to_str::Ptr{Cvoid}
    from_str::Ptr{Cvoid}
end

struct H5VL_class_t
    version::Cuint
    value::H5VL_class_value_t
    name::Ptr{Cchar}
    cap_flags::Cuint
    initialize::Ptr{Cvoid}
    terminate::Ptr{Cvoid}
    info_cls::H5VL_info_class_t
    wrap_cls::H5VL_wrap_class_t
    attr_cls::H5VL_attr_class_t
    dataset_cls::H5VL_dataset_class_t
    datatype_cls::H5VL_datatype_class_t
    file_cls::H5VL_file_class_t
    group_cls::H5VL_group_class_t
    link_cls::H5VL_link_class_t
    object_cls::H5VL_object_class_t
    introspect_cls::H5VL_introspect_class_t
    request_cls::H5VL_request_class_t
    blob_cls::H5VL_blob_class_t
    token_cls::H5VL_token_class_t
    optional::Ptr{Cvoid}
end

@bind h5vl_register_connector(cls::Ptr{H5VL_class_t}, vipl_id::hid_t)::hid_t "Error in h5vl_register_connector (not annotated)"

@bind h5vl_object(obj_id::hid_t)::Ptr{Cvoid} "Error in h5vl_object (not annotated)"

@bind h5vl_get_file_type(file_obj::Ptr{Cvoid}, connector_id::hid_t, dtype_id::hid_t)::hid_t "Error in h5vl_get_file_type (not annotated)"

@bind h5vl_peek_connector_id_by_name(name::Ptr{Cchar})::hid_t "Error in h5vl_peek_connector_id_by_name (not annotated)"

@bind h5vl_peek_connector_id_by_value(value::H5VL_class_value_t)::hid_t "Error in h5vl_peek_connector_id_by_value (not annotated)"

@bind h5vl_cmp_connector_cls(cmp::Ptr{Cint}, connector_id1::hid_t, connector_id2::hid_t)::herr_t "Error in h5vl_cmp_connector_cls (not annotated)"

@bind h5vl_wrap_register(obj::Ptr{Cvoid}, type::H5I_type_t)::hid_t "Error in h5vl_wrap_register (not annotated)"

@bind h5vl_retrieve_lib_state(state::Ptr{Ptr{Cvoid}})::herr_t "Error in h5vl_retrieve_lib_state (not annotated)"

@bind h5vl_restore_lib_state(state::Ptr{Cvoid})::herr_t "Error in h5vl_restore_lib_state (not annotated)"

@bind h5vl_reset_lib_state()::herr_t "Error in h5vl_reset_lib_state (not annotated)"

@bind h5vl_free_lib_state(state::Ptr{Cvoid})::herr_t "Error in h5vl_free_lib_state (not annotated)"

@bind h5vl_get_object(obj::Ptr{Cvoid}, connector_id::hid_t)::Ptr{Cvoid} "Error in h5vl_get_object (not annotated)"

@bind h5vl_get_wrap_ctx(obj::Ptr{Cvoid}, connector_id::hid_t, wrap_ctx::Ptr{Ptr{Cvoid}})::herr_t "Error in h5vl_get_wrap_ctx (not annotated)"

@bind h5vl_wrap_object(obj::Ptr{Cvoid}, obj_type::H5I_type_t, connector_id::hid_t, wrap_ctx::Ptr{Cvoid})::Ptr{Cvoid} "Error in h5vl_wrap_object (not annotated)"

@bind h5vl_unwrap_object(obj::Ptr{Cvoid}, connector_id::hid_t)::Ptr{Cvoid} "Error in h5vl_unwrap_object (not annotated)"

@bind h5vl_free_wrap_ctx(wrap_ctx::Ptr{Cvoid}, connector_id::hid_t)::herr_t "Error in h5vl_free_wrap_ctx (not annotated)"

@bind h5vl_initialize(connector_id::hid_t, vipl_id::hid_t)::herr_t "Error in h5vl_initialize (not annotated)"

@bind h5vl_terminate(connector_id::hid_t)::herr_t "Error in h5vl_terminate (not annotated)"

@bind h5vl_get_cap_flags(connector_id::hid_t, cap_flags::Ptr{Cuint})::herr_t "Error in h5vl_get_cap_flags (not annotated)"

@bind h5vl_get_value(connector_id::hid_t, conn_value::Ptr{H5VL_class_value_t})::herr_t "Error in h5vl_get_value (not annotated)"

@bind h5vl_copy_connector_info(connector_id::hid_t, dst_vol_info::Ptr{Ptr{Cvoid}}, src_vol_info::Ptr{Cvoid})::herr_t "Error in h5vl_copy_connector_info (not annotated)"

@bind h5vl_cmp_connector_info(cmp::Ptr{Cint}, connector_id::hid_t, info1::Ptr{Cvoid}, info2::Ptr{Cvoid})::herr_t "Error in h5vl_cmp_connector_info (not annotated)"

@bind h5vl_free_connector_info(connector_id::hid_t, vol_info::Ptr{Cvoid})::herr_t "Error in h5vl_free_connector_info (not annotated)"

@bind h5vl_connector_info_to_str(info::Ptr{Cvoid}, connector_id::hid_t, str::Ptr{Ptr{Cchar}})::herr_t "Error in h5vl_connector_info_to_str (not annotated)"

@bind h5vl_connector_str_to_info(str::Ptr{Cchar}, connector_id::hid_t, info::Ptr{Ptr{Cvoid}})::herr_t "Error in h5vl_connector_str_to_info (not annotated)"

@bind h5vl_attr_create(obj::Ptr{Cvoid}, loc_params::Ptr{H5VL_loc_params_t}, connector_id::hid_t, attr_name::Ptr{Cchar}, type_id::hid_t, space_id::hid_t, acpl_id::hid_t, aapl_id::hid_t, dxpl_id::hid_t, req::Ptr{Ptr{Cvoid}})::Ptr{Cvoid} "Error in h5vl_attr_create (not annotated)"

@bind h5vl_attr_open(obj::Ptr{Cvoid}, loc_params::Ptr{H5VL_loc_params_t}, connector_id::hid_t, name::Ptr{Cchar}, aapl_id::hid_t, dxpl_id::hid_t, req::Ptr{Ptr{Cvoid}})::Ptr{Cvoid} "Error in h5vl_attr_open (not annotated)"

@bind h5vl_attr_read(attr::Ptr{Cvoid}, connector_id::hid_t, dtype_id::hid_t, buf::Ptr{Cvoid}, dxpl_id::hid_t, req::Ptr{Ptr{Cvoid}})::herr_t "Error in h5vl_attr_read (not annotated)"

@bind h5vl_attr_write(attr::Ptr{Cvoid}, connector_id::hid_t, dtype_id::hid_t, buf::Ptr{Cvoid}, dxpl_id::hid_t, req::Ptr{Ptr{Cvoid}})::herr_t "Error in h5vl_attr_write (not annotated)"

@bind h5vl_attr_close(attr::Ptr{Cvoid}, connector_id::hid_t, dxpl_id::hid_t, req::Ptr{Ptr{Cvoid}})::herr_t "Error in h5vl_attr_close (not annotated)"

@bind h5vl_dataset_create(obj::Ptr{Cvoid}, loc_params::Ptr{H5VL_loc_params_t}, connector_id::hid_t, name::Ptr{Cchar}, lcpl_id::hid_t, type_id::hid_t, space_id::hid_t, dcpl_id::hid_t, dapl_id::hid_t, dxpl_id::hid_t, req::Ptr{Ptr{Cvoid}})::Ptr{Cvoid} "Error in h5vl_dataset_create (not annotated)"

@bind h5vl_dataset_open(obj::Ptr{Cvoid}, loc_params::Ptr{H5VL_loc_params_t}, connector_id::hid_t, name::Ptr{Cchar}, dapl_id::hid_t, dxpl_id::hid_t, req::Ptr{Ptr{Cvoid}})::Ptr{Cvoid} "Error in h5vl_dataset_open (not annotated)"

@bind h5vl_dataset_read(dset::Ptr{Cvoid}, connector_id::hid_t, mem_type_id::hid_t, mem_space_id::hid_t, file_space_id::hid_t, plist_id::hid_t, buf::Ptr{Cvoid}, req::Ptr{Ptr{Cvoid}})::herr_t "Error in h5vl_dataset_read (not annotated)"

@bind h5vl_dataset_write(dset::Ptr{Cvoid}, connector_id::hid_t, mem_type_id::hid_t, mem_space_id::hid_t, file_space_id::hid_t, plist_id::hid_t, buf::Ptr{Cvoid}, req::Ptr{Ptr{Cvoid}})::herr_t "Error in h5vl_dataset_write (not annotated)"

@bind h5vl_dataset_close(dset::Ptr{Cvoid}, connector_id::hid_t, dxpl_id::hid_t, req::Ptr{Ptr{Cvoid}})::herr_t "Error in h5vl_dataset_close (not annotated)"

@bind h5vl_datatype_commit(obj::Ptr{Cvoid}, loc_params::Ptr{H5VL_loc_params_t}, connector_id::hid_t, name::Ptr{Cchar}, type_id::hid_t, lcpl_id::hid_t, tcpl_id::hid_t, tapl_id::hid_t, dxpl_id::hid_t, req::Ptr{Ptr{Cvoid}})::Ptr{Cvoid} "Error in h5vl_datatype_commit (not annotated)"

@bind h5vl_datatype_open(obj::Ptr{Cvoid}, loc_params::Ptr{H5VL_loc_params_t}, connector_id::hid_t, name::Ptr{Cchar}, tapl_id::hid_t, dxpl_id::hid_t, req::Ptr{Ptr{Cvoid}})::Ptr{Cvoid} "Error in h5vl_datatype_open (not annotated)"

@bind h5vl_datatype_close(dt::Ptr{Cvoid}, connector_id::hid_t, dxpl_id::hid_t, req::Ptr{Ptr{Cvoid}})::herr_t "Error in h5vl_datatype_close (not annotated)"

@bind h5vl_file_create(name::Ptr{Cchar}, flags::Cuint, fcpl_id::hid_t, fapl_id::hid_t, dxpl_id::hid_t, req::Ptr{Ptr{Cvoid}})::Ptr{Cvoid} "Error in h5vl_file_create (not annotated)"

@bind h5vl_file_open(name::Ptr{Cchar}, flags::Cuint, fapl_id::hid_t, dxpl_id::hid_t, req::Ptr{Ptr{Cvoid}})::Ptr{Cvoid} "Error in h5vl_file_open (not annotated)"

@bind h5vl_file_close(file::Ptr{Cvoid}, connector_id::hid_t, dxpl_id::hid_t, req::Ptr{Ptr{Cvoid}})::herr_t "Error in h5vl_file_close (not annotated)"

@bind h5vl_group_create(obj::Ptr{Cvoid}, loc_params::Ptr{H5VL_loc_params_t}, connector_id::hid_t, name::Ptr{Cchar}, lcpl_id::hid_t, gcpl_id::hid_t, gapl_id::hid_t, dxpl_id::hid_t, req::Ptr{Ptr{Cvoid}})::Ptr{Cvoid} "Error in h5vl_group_create (not annotated)"

@bind h5vl_group_open(obj::Ptr{Cvoid}, loc_params::Ptr{H5VL_loc_params_t}, connector_id::hid_t, name::Ptr{Cchar}, gapl_id::hid_t, dxpl_id::hid_t, req::Ptr{Ptr{Cvoid}})::Ptr{Cvoid} "Error in h5vl_group_open (not annotated)"

@bind h5vl_group_close(grp::Ptr{Cvoid}, connector_id::hid_t, dxpl_id::hid_t, req::Ptr{Ptr{Cvoid}})::herr_t "Error in h5vl_group_close (not annotated)"

@bind h5vl_link_copy(src_obj::Ptr{Cvoid}, loc_params1::Ptr{H5VL_loc_params_t}, dst_obj::Ptr{Cvoid}, loc_params2::Ptr{H5VL_loc_params_t}, connector_id::hid_t, lcpl_id::hid_t, lapl_id::hid_t, dxpl_id::hid_t, req::Ptr{Ptr{Cvoid}})::herr_t "Error in h5vl_link_copy (not annotated)"

@bind h5vl_link_move(src_obj::Ptr{Cvoid}, loc_params1::Ptr{H5VL_loc_params_t}, dst_obj::Ptr{Cvoid}, loc_params2::Ptr{H5VL_loc_params_t}, connector_id::hid_t, lcpl_id::hid_t, lapl_id::hid_t, dxpl_id::hid_t, req::Ptr{Ptr{Cvoid}})::herr_t "Error in h5vl_link_move (not annotated)"

@bind h5vl_object_open(obj::Ptr{Cvoid}, loc_params::Ptr{H5VL_loc_params_t}, connector_id::hid_t, opened_type::Ptr{H5I_type_t}, dxpl_id::hid_t, req::Ptr{Ptr{Cvoid}})::Ptr{Cvoid} "Error in h5vl_object_open (not annotated)"

@bind h5vl_object_copy(src_obj::Ptr{Cvoid}, loc_params1::Ptr{H5VL_loc_params_t}, src_name::Ptr{Cchar}, dst_obj::Ptr{Cvoid}, loc_params2::Ptr{H5VL_loc_params_t}, dst_name::Ptr{Cchar}, connector_id::hid_t, ocpypl_id::hid_t, lcpl_id::hid_t, dxpl_id::hid_t, req::Ptr{Ptr{Cvoid}})::herr_t "Error in h5vl_object_copy (not annotated)"

@bind h5vl_introspect_get_conn_cls(obj::Ptr{Cvoid}, connector_id::hid_t, lvl::H5VL_get_conn_lvl_t, conn_cls::Ptr{Ptr{H5VL_class_t}})::herr_t "Error in h5vl_introspect_get_conn_cls (not annotated)"

@bind h5vl_introspect_opt_query(obj::Ptr{Cvoid}, connector_id::hid_t, subcls::H5VL_subclass_t, opt_type::Cint, supported::Ptr{hbool_t})::herr_t "Error in h5vl_introspect_opt_query (not annotated)"

@bind h5vl_request_wait(req::Ptr{Cvoid}, connector_id::hid_t, timeout::UInt64, status::Ptr{H5ES_status_t})::herr_t "Error in h5vl_request_wait (not annotated)"

@bind h5vl_request_notify(req::Ptr{Cvoid}, connector_id::hid_t, cb::H5VL_request_notify_t, ctx::Ptr{Cvoid})::herr_t "Error in h5vl_request_notify (not annotated)"

@bind h5vl_request_cancel(req::Ptr{Cvoid}, connector_id::hid_t)::herr_t "Error in h5vl_request_cancel (not annotated)"

@bind h5vl_request_free(req::Ptr{Cvoid}, connector_id::hid_t)::herr_t "Error in h5vl_request_free (not annotated)"

@bind h5vl_blob_put(obj::Ptr{Cvoid}, connector_id::hid_t, buf::Ptr{Cvoid}, size::Csize_t, blob_id::Ptr{Cvoid}, ctx::Ptr{Cvoid})::herr_t "Error in h5vl_blob_put (not annotated)"

@bind h5vl_blob_get(obj::Ptr{Cvoid}, connector_id::hid_t, blob_id::Ptr{Cvoid}, buf::Ptr{Cvoid}, size::Csize_t, ctx::Ptr{Cvoid})::herr_t "Error in h5vl_blob_get (not annotated)"

@bind h5vl_token_cmp(obj::Ptr{Cvoid}, connector_id::hid_t, token1::Ptr{H5O_token_t}, token2::Ptr{H5O_token_t}, cmp_value::Ptr{Cint})::herr_t "Error in h5vl_token_cmp (not annotated)"

@bind h5vl_token_to_str(obj::Ptr{Cvoid}, obj_type::H5I_type_t, connector_id::hid_t, token::Ptr{H5O_token_t}, token_str::Ptr{Ptr{Cchar}})::herr_t "Error in h5vl_token_to_str (not annotated)"

@bind h5vl_token_from_str(obj::Ptr{Cvoid}, obj_type::H5I_type_t, connector_id::hid_t, token_str::Ptr{Cchar}, token::Ptr{H5O_token_t})::herr_t "Error in h5vl_token_from_str (not annotated)"

@bind h5vl_native_addr_to_token(loc_id::hid_t, addr::haddr_t, token::Ptr{H5O_token_t})::herr_t "Error in h5vl_native_addr_to_token (not annotated)"

@bind h5vl_native_token_to_addr(loc_id::hid_t, token::H5O_token_t, addr::Ptr{haddr_t})::herr_t "Error in h5vl_native_token_to_addr (not annotated)"

@bind h5p_set_fapl_core(fapl_id::hid_t, increment::Csize_t, backing_store::hbool_t)::herr_t "Error in h5p_set_fapl_core (not annotated)"

@bind h5p_get_fapl_core(fapl_id::hid_t, increment::Ptr{Csize_t}, backing_store::Ptr{hbool_t})::herr_t "Error in h5p_get_fapl_core (not annotated)"

@bind h5p_set_fapl_family(fapl_id::hid_t, memb_size::hsize_t, memb_fapl_id::hid_t)::herr_t "Error in h5p_set_fapl_family (not annotated)"

@bind h5p_get_fapl_family(fapl_id::hid_t, memb_size::Ptr{hsize_t}, memb_fapl_id::Ptr{hid_t})::herr_t "Error in h5p_get_fapl_family (not annotated)"

struct H5FD_hdfs_fapl_t
    version::Int32
    namenode_name::NTuple{129, Cchar}
    namenode_port::Int32
    user_name::NTuple{129, Cchar}
    kerberos_ticket_cache::NTuple{129, Cchar}
    stream_buffer_size::Int32
end

@bind h5fd__hdfs_init()::hid_t "Error in h5fd__hdfs_init (not annotated)"

@bind h5p_get_fapl_hdfs(fapl_id::hid_t, fa_out::Ptr{H5FD_hdfs_fapl_t})::herr_t "Error in h5p_get_fapl_hdfs (not annotated)"

@bind h5p_set_fapl_hdfs(fapl_id::hid_t, fa::Ptr{H5FD_hdfs_fapl_t})::herr_t "Error in h5p_set_fapl_hdfs (not annotated)"

@bind h5p_set_fapl_log(fapl_id::hid_t, logfile::Ptr{Cchar}, flags::Culonglong, buf_size::Csize_t)::herr_t "Error in h5p_set_fapl_log (not annotated)"

@cenum H5FD_mpio_xfer_t::UInt32 begin
    H5FD_MPIO_INDEPENDENT = 0
    H5FD_MPIO_COLLECTIVE = 1
end

@cenum H5FD_mpio_chunk_opt_t::UInt32 begin
    H5FD_MPIO_CHUNK_DEFAULT = 0
    H5FD_MPIO_CHUNK_ONE_IO = 1
    H5FD_MPIO_CHUNK_MULTI_IO = 2
end

@cenum H5FD_mpio_collective_opt_t::UInt32 begin
    H5FD_MPIO_COLLECTIVE_IO = 0
    H5FD_MPIO_INDIVIDUAL_IO = 1
end

@bind h5p_set_fapl_multi(fapl_id::hid_t, memb_map::Ptr{H5FD_mem_t}, memb_fapl::Ptr{hid_t}, memb_name::Ptr{Ptr{Cchar}}, memb_addr::Ptr{haddr_t}, relax::hbool_t)::herr_t "Error in h5p_set_fapl_multi (not annotated)"

@bind h5p_get_fapl_multi(fapl_id::hid_t, memb_map::Ptr{H5FD_mem_t}, memb_fapl::Ptr{hid_t}, memb_name::Ptr{Ptr{Cchar}}, memb_addr::Ptr{haddr_t}, relax::Ptr{hbool_t})::herr_t "Error in h5p_get_fapl_multi (not annotated)"

@bind h5p_set_fapl_split(fapl::hid_t, meta_ext::Ptr{Cchar}, meta_plist_id::hid_t, raw_ext::Ptr{Cchar}, raw_plist_id::hid_t)::herr_t "Error in h5p_set_fapl_split (not annotated)"

@bind h5p_set_fapl_sec2(fapl_id::hid_t)::herr_t "Error in h5p_set_fapl_sec2 (not annotated)"

struct H5FD_splitter_vfd_config_t
    magic::Int32
    version::Cuint
    rw_fapl_id::hid_t
    wo_fapl_id::hid_t
    wo_path::NTuple{4097, Cchar}
    log_file_path::NTuple{4097, Cchar}
    ignore_wo_errs::hbool_t
end

@bind h5p_set_fapl_splitter(fapl_id::hid_t, config_ptr::Ptr{H5FD_splitter_vfd_config_t})::herr_t "Error in h5p_set_fapl_splitter (not annotated)"

@bind h5p_get_fapl_splitter(fapl_id::hid_t, config_ptr::Ptr{H5FD_splitter_vfd_config_t})::herr_t "Error in h5p_get_fapl_splitter (not annotated)"

@bind h5p_set_fapl_stdio(fapl_id::hid_t)::herr_t "Error in h5p_set_fapl_stdio (not annotated)"

@bind h5p_set_fapl_windows(fapl_id::hid_t)::herr_t "Error in h5p_set_fapl_windows (not annotated)"

struct H5VL_pass_through_info_t
    under_vol_id::hid_t
    under_vol_info::Ptr{Cvoid}
end

const H5_HAVE_WINDOWS = 1

const H5_HAVE_MINGW = 1

const H5_HAVE_WIN32_API = 1

const H5_DEFAULT_PLUGINDIR = "%ALLUSERSPROFILE%\\hdf5\\lib\\plugin"

const H5_DEV_T_IS_SCALAR = 1

const H5_FORTRAN_C_LONG_DOUBLE_IS_UNIQUE = 1

const H5_FORTRAN_HAVE_C_LONG_DOUBLE = 1

const H5_FORTRAN_HAVE_C_SIZEOF = 1

const H5_FORTRAN_HAVE_SIZEOF = 1

const H5_FORTRAN_HAVE_STORAGE_SIZE = 1

const H5_FORTRAN_SIZEOF_LONG_DOUBLE = 16

const H5_Fortran_COMPILER_ID = GNU

# Skipping MacroDefinition: H5_H5CONFIG_F_IKIND INTEGER , DIMENSION ( 1 : num_ikinds ) : : ikind = ( / 1 , 2 , 4 , 8 , 16 / )

# Skipping MacroDefinition: H5_H5CONFIG_F_NUM_IKIND INTEGER , PARAMETER : : num_ikinds = 5

# Skipping MacroDefinition: H5_H5CONFIG_F_NUM_RKIND INTEGER , PARAMETER : : num_rkinds = 4

# Skipping MacroDefinition: H5_H5CONFIG_F_RKIND INTEGER , DIMENSION ( 1 : num_rkinds ) : : rkind = ( / 4 , 8 , 10 , 16 / )

# Skipping MacroDefinition: H5_H5CONFIG_F_RKIND_SIZEOF INTEGER , DIMENSION ( 1 : num_rkinds ) : : rkind_sizeof = ( / 4 , 8 , 16 , 16 / )

const H5_HAVE_ALARM = 1

const H5_HAVE_ASPRINTF = 1

const H5_HAVE_ATTRIBUTE = 1

const H5_HAVE_C99_DESIGNATED_INITIALIZER = 1

const H5_HAVE_C99_FUNC = 1

const H5_HAVE_CLOCK_GETTIME = 1

const H5_HAVE_DIFFTIME = 1

const H5_HAVE_EMBEDDED_LIBINFO = 1

const H5_HAVE_FILTER_DEFLATE = 1

const H5_HAVE_FILTER_SZIP = 1

const H5_HAVE_FLOAT128 = 1

const H5_HAVE_FREXPF = 1

const H5_HAVE_FREXPL = 1

const H5_HAVE_FSEEKO = 1

const H5_HAVE_FUNCTION = 1

const H5_HAVE_Fortran_INTEGER_SIZEOF_16 = 1

const H5_HAVE_GETCONSOLESCREENBUFFERINFO = 1

const H5_HAVE_GETTIMEOFDAY = 1

const H5_HAVE_INLINE = 1

const H5_HAVE_LIBM = 1

const H5_HAVE_LIBSZ = 1

const H5_HAVE_LIBWS2_32 = 1

const H5_HAVE_LIBZ = 1

const H5_HAVE_LLROUND = 1

const H5_HAVE_LLROUNDF = 1

const H5_HAVE_LONGJMP = 1

const H5_HAVE_LROUND = 1

const H5_HAVE_LROUNDF = 1

const H5_HAVE_LSEEK64 = 1

const H5_HAVE_ROUND = 1

const H5_HAVE_ROUNDF = 1

const H5_HAVE_SETJMP = 1

const H5_HAVE_SIGNAL = 1

const H5_HAVE_SNPRINTF = 1

const H5_HAVE_STDINT_H_CXX = 1

const H5_HAVE_STRDUP = 1

const H5_HAVE_STRTOLL = 1

const H5_HAVE_STRTOULL = 1

const H5_HAVE_SYSTEM = 1

const H5_HAVE_TIMEZONE = 1

const H5_HAVE_TMPFILE = 1

const H5_HAVE_VASPRINTF = 1

const H5_HAVE_VSNPRINTF = 1

const H5_HAVE_WINDOW_PATH = 1

const H5_HAVE___INLINE = 1

const H5_HAVE___INLINE__ = 1

const H5_IGNORE_DISABLED_FILE_LOCKS = 1

const H5_INCLUDE_HL = 1

const H5_LDOUBLE_TO_LLONG_ACCURATE = 1

const H5_LLONG_TO_LDOUBLE_CORRECT = 1

const H5_NO_ALIGNMENT_RESTRICTIONS = 1

const H5_PACKAGE = "hdf5"

const H5_PACKAGE_BUGREPORT = "help@hdfgroup.org"

const H5_PACKAGE_NAME = "HDF5"

const H5_PACKAGE_STRING = "HDF5 1.12.1"

const H5_PACKAGE_TARNAME = "hdf5"

const H5_PACKAGE_URL = "http://www.hdfgroup.org"

const H5_PACKAGE_VERSION = "1.12.1"

const H5_PAC_C_MAX_REAL_PRECISION = 33

const H5_PAC_FC_MAX_REAL_PRECISION = 33

const H5_PRINTF_LL_WIDTH = "I64"

const H5_SIZEOF_BOOL = 1

const H5_SIZEOF_CHAR = 1

const H5_SIZEOF_DOUBLE = 8

const H5_SIZEOF_FLOAT = 4

const H5_SIZEOF_INT = 4

const H5_SIZEOF_INT16_T = 2

const H5_SIZEOF_INT32_T = 4

const H5_SIZEOF_INT64_T = 8

const H5_SIZEOF_INT8_T = 1

const H5_SIZEOF_INT_FAST16_T = 2

const H5_SIZEOF_INT_FAST32_T = 4

const H5_SIZEOF_INT_FAST64_T = 8

const H5_SIZEOF_INT_FAST8_T = 1

const H5_SIZEOF_INT_LEAST16_T = 2

const H5_SIZEOF_INT_LEAST32_T = 4

const H5_SIZEOF_INT_LEAST64_T = 8

const H5_SIZEOF_INT_LEAST8_T = 1

const H5_SIZEOF_SIZE_T = 8

const H5_SIZEOF_SSIZE_T = 8

const H5_SIZEOF_LONG = 4

const H5_SIZEOF_LONG_DOUBLE = 16

const H5_SIZEOF_LONG_LONG = 8

const H5_SIZEOF_OFF64_T = 8

const H5_SIZEOF_OFF_T = 8

const H5_SIZEOF_PTRDIFF_T = 8

const H5_SIZEOF_SHORT = 2

const H5_SIZEOF_TIME_T = 8

const H5_SIZEOF_UINT16_T = 2

const H5_SIZEOF_UINT32_T = 4

const H5_SIZEOF_UINT64_T = 8

const H5_SIZEOF_UINT8_T = 1

const H5_SIZEOF_UINT_FAST16_T = 2

const H5_SIZEOF_UINT_FAST32_T = 4

const H5_SIZEOF_UINT_FAST64_T = 8

const H5_SIZEOF_UINT_FAST8_T = 1

const H5_SIZEOF_UINT_LEAST16_T = 2

const H5_SIZEOF_UINT_LEAST32_T = 4

const H5_SIZEOF_UINT_LEAST64_T = 8

const H5_SIZEOF_UINT_LEAST8_T = 1

const H5_SIZEOF_UNSIGNED = 4

const H5_SIZEOF__QUAD = 0

const H5_SIZEOF___FLOAT128 = 16

const H5_SIZEOF___INT64 = 8

const H5_STDC_HEADERS = 1

const H5_SYSTEM_SCOPE_THREADS = 1

const H5_TIME_WITH_SYS_TIME = 1

const H5_USE_112_API_DEFAULT = 1

const H5_USE_FILE_LOCKING = 1

const H5_VERSION = "1.12.1"

const H5_WANT_DATA_ACCURACY = 1

const H5_WANT_DCONV_EXCEPTION = 1

const H5Acreate_vers = 2

const H5Acreate = H5Acreate2

const H5Aiterate_vers = 2

const H5Aiterate = H5Aiterate2

const H5A_operator_t = H5A_operator2_t

const H5Dcreate_vers = 2

const H5Dcreate = H5Dcreate2

const H5Dopen_vers = 2

const H5Dopen = H5Dopen2

const H5Eclear_vers = 2

const H5Eclear = H5Eclear2

const H5Eget_auto_vers = 2

const H5Eget_auto = H5Eget_auto2

const H5Eprint_vers = 2

const H5Eprint = H5Eprint2

const H5Epush_vers = 2

const H5Epush = H5Epush2

const H5Eset_auto_vers = 2

const H5Eset_auto = H5Eset_auto2

const H5Ewalk_vers = 2

const H5Ewalk = H5Ewalk2

const H5E_error_t = H5E_error2_t

const H5E_walk_t = H5E_walk2_t

const H5Fget_info_vers = 2

const H5Fget_info = H5Fget_info2

const H5F_info_t = H5F_info2_t

const H5Gcreate_vers = 2

const H5Gcreate = H5Gcreate2

const H5Gopen_vers = 2

const H5Gopen = H5Gopen2

const H5Lget_info_vers = 2

const H5Lget_info = H5Lget_info2

const H5L_info_t = H5L_info2_t

const H5Lget_info_by_idx_vers = 2

const H5Lget_info_by_idx = H5Lget_info_by_idx2

const H5Literate_vers = 2

const H5Literate = H5Literate2

const H5L_iterate_t = H5L_iterate2_t

const H5Literate_by_name_vers = 2

const H5Literate_by_name = H5Literate_by_name2

const H5Lvisit_vers = 2

const H5Lvisit = H5Lvisit2

const H5Lvisit_by_name_vers = 2

const H5Lvisit_by_name = H5Lvisit_by_name2

const H5Oget_info_vers = 3

const H5Oget_info = H5Oget_info3

const H5Oget_info_by_idx_vers = 3

const H5Oget_info_by_idx = H5Oget_info_by_idx3

const H5Oget_info_by_name_vers = 3

const H5Oget_info_by_name = H5Oget_info_by_name3

const H5Ovisit_vers = 3

const H5Ovisit = H5Ovisit3

const H5Ovisit_by_name_vers = 3

const H5Ovisit_by_name = H5Ovisit_by_name3

const H5Pencode_vers = 2

const H5Pencode = H5Pencode2

const H5Pget_filter_vers = 2

const H5Pget_filter = H5Pget_filter2

const H5Pget_filter_by_id_vers = 2

const H5Pget_filter_by_id = H5Pget_filter_by_id2

const H5Pinsert_vers = 2

const H5Pinsert = H5Pinsert2

const H5Pregister_vers = 2

const H5Pregister = H5Pregister2

const H5Rdereference_vers = 2

const H5Rdereference = H5Rdereference2

const H5Rget_obj_type_vers = 2

const H5Rget_obj_type = H5Rget_obj_type2

const H5Sencode_vers = 2

const H5Sencode = H5Sencode2

const H5Tarray_create_vers = 2

const H5Tarray_create = H5Tarray_create2

const H5Tcommit_vers = 2

const H5Tcommit = H5Tcommit2

const H5Tget_array_dims_vers = 2

const H5Tget_array_dims = H5Tget_array_dims2

const H5Topen_vers = 2

const H5Topen = H5Topen2

const H5E_auto_t_vers = 2

const H5E_auto_t = H5E_auto2_t

const H5O_info_t_vers = 2

const H5O_info_t = H5O_info2_t

const H5O_iterate_t_vers = 2

const H5O_iterate_t = H5O_iterate2_t

const H5Z_class_t_vers = 2

const H5Z_class_t = H5Z_class2_t

# Skipping MacroDefinition: H5_DLLVAR extern

# Skipping MacroDefinition: H5TEST_DLLVAR extern

# Skipping MacroDefinition: H5TOOLS_DLLVAR extern

# Skipping MacroDefinition: H5_DLLCPPVAR extern

# Skipping MacroDefinition: H5_HLDLLVAR extern

# Skipping MacroDefinition: H5_HLCPPDLLVAR extern

# Skipping MacroDefinition: H5_FCDLLVAR extern

# Skipping MacroDefinition: H5_FCTESTDLLVAR extern

# Skipping MacroDefinition: HDF5_HL_F90CSTUBDLLVAR extern

const H5_VERS_MAJOR = 1

const H5_VERS_MINOR = 12

const H5_VERS_RELEASE = 1

const H5_VERS_SUBRELEASE = ""

const H5_VERS_INFO = "HDF5 library version: 1.12.1"

const PRIdHSIZE = H5_PRINTF_LL_WIDTH("d")

const PRIiHSIZE = H5_PRINTF_LL_WIDTH("i")

const PRIoHSIZE = H5_PRINTF_LL_WIDTH("o")

const PRIuHSIZE = H5_PRINTF_LL_WIDTH("u")

const PRIxHSIZE = H5_PRINTF_LL_WIDTH("x")

const PRIXHSIZE = H5_PRINTF_LL_WIDTH("X")

const H5_SIZEOF_HSIZE_T = H5_SIZEOF_LONG_LONG

const H5_SIZEOF_HSSIZE_T = H5_SIZEOF_LONG_LONG

const HSIZE_UNDEF = ULLONG_MAX

const HADDR_UNDEF = ULLONG_MAX

const H5_SIZEOF_HADDR_T = H5_SIZEOF_LONG_LONG

const PRIdHADDR = H5_PRINTF_LL_WIDTH("d")

const PRIoHADDR = H5_PRINTF_LL_WIDTH("o")

const PRIuHADDR = H5_PRINTF_LL_WIDTH("u")

const PRIxHADDR = H5_PRINTF_LL_WIDTH("x")

const PRIXHADDR = H5_PRINTF_LL_WIDTH("X")

const H5_PRINTF_HADDR_FMT = ("%")(PRIuHADDR)

const HADDR_MAX = HADDR_UNDEF - 1

const H5_ITER_ERROR = -1

const H5_ITER_CONT = 0

const H5_ITER_STOP = 1

const H5O_MAX_TOKEN_SIZE = 16

const PRIdHID = PRId64

const PRIxHID = PRIx64

const PRIXHID = PRIX64

const PRIoHID = PRIo64

const H5_SIZEOF_HID_T = H5_SIZEOF_INT64_T

const H5I_INVALID_HID = -1

const H5T_NCSET = H5T_CSET_RESERVED_2

const H5T_NSTR = H5T_STR_RESERVED_3

const H5T_VARIABLE = size_t(-1)

const H5T_OPAQUE_TAG_MAX = 256

# Skipping MacroDefinition: H5OPEN H5open ( ) ,

const H5T_IEEE_F32BE = H5OPEN(H5T_IEEE_F32BE_g)

const H5T_IEEE_F32LE = H5OPEN(H5T_IEEE_F32LE_g)

const H5T_IEEE_F64BE = H5OPEN(H5T_IEEE_F64BE_g)

const H5T_IEEE_F64LE = H5OPEN(H5T_IEEE_F64LE_g)

const H5T_STD_I8BE = H5OPEN(H5T_STD_I8BE_g)

const H5T_STD_I8LE = H5OPEN(H5T_STD_I8LE_g)

const H5T_STD_I16BE = H5OPEN(H5T_STD_I16BE_g)

const H5T_STD_I16LE = H5OPEN(H5T_STD_I16LE_g)

const H5T_STD_I32BE = H5OPEN(H5T_STD_I32BE_g)

const H5T_STD_I32LE = H5OPEN(H5T_STD_I32LE_g)

const H5T_STD_I64BE = H5OPEN(H5T_STD_I64BE_g)

const H5T_STD_I64LE = H5OPEN(H5T_STD_I64LE_g)

const H5T_STD_U8BE = H5OPEN(H5T_STD_U8BE_g)

const H5T_STD_U8LE = H5OPEN(H5T_STD_U8LE_g)

const H5T_STD_U16BE = H5OPEN(H5T_STD_U16BE_g)

const H5T_STD_U16LE = H5OPEN(H5T_STD_U16LE_g)

const H5T_STD_U32BE = H5OPEN(H5T_STD_U32BE_g)

const H5T_STD_U32LE = H5OPEN(H5T_STD_U32LE_g)

const H5T_STD_U64BE = H5OPEN(H5T_STD_U64BE_g)

const H5T_STD_U64LE = H5OPEN(H5T_STD_U64LE_g)

const H5T_STD_B8BE = H5OPEN(H5T_STD_B8BE_g)

const H5T_STD_B8LE = H5OPEN(H5T_STD_B8LE_g)

const H5T_STD_B16BE = H5OPEN(H5T_STD_B16BE_g)

const H5T_STD_B16LE = H5OPEN(H5T_STD_B16LE_g)

const H5T_STD_B32BE = H5OPEN(H5T_STD_B32BE_g)

const H5T_STD_B32LE = H5OPEN(H5T_STD_B32LE_g)

const H5T_STD_B64BE = H5OPEN(H5T_STD_B64BE_g)

const H5T_STD_B64LE = H5OPEN(H5T_STD_B64LE_g)

const H5T_STD_REF_OBJ = H5OPEN(H5T_STD_REF_OBJ_g)

const H5T_STD_REF_DSETREG = H5OPEN(H5T_STD_REF_DSETREG_g)

const H5T_STD_REF = H5OPEN(H5T_STD_REF_g)

const H5T_UNIX_D32BE = H5OPEN(H5T_UNIX_D32BE_g)

const H5T_UNIX_D32LE = H5OPEN(H5T_UNIX_D32LE_g)

const H5T_UNIX_D64BE = H5OPEN(H5T_UNIX_D64BE_g)

const H5T_UNIX_D64LE = H5OPEN(H5T_UNIX_D64LE_g)

const H5T_C_S1 = H5OPEN(H5T_C_S1_g)

const H5T_FORTRAN_S1 = H5OPEN(H5T_FORTRAN_S1_g)

const H5T_INTEL_I8 = H5T_STD_I8LE

const H5T_INTEL_I16 = H5T_STD_I16LE

const H5T_INTEL_I32 = H5T_STD_I32LE

const H5T_INTEL_I64 = H5T_STD_I64LE

const H5T_INTEL_U8 = H5T_STD_U8LE

const H5T_INTEL_U16 = H5T_STD_U16LE

const H5T_INTEL_U32 = H5T_STD_U32LE

const H5T_INTEL_U64 = H5T_STD_U64LE

const H5T_INTEL_B8 = H5T_STD_B8LE

const H5T_INTEL_B16 = H5T_STD_B16LE

const H5T_INTEL_B32 = H5T_STD_B32LE

const H5T_INTEL_B64 = H5T_STD_B64LE

const H5T_INTEL_F32 = H5T_IEEE_F32LE

const H5T_INTEL_F64 = H5T_IEEE_F64LE

const H5T_ALPHA_I8 = H5T_STD_I8LE

const H5T_ALPHA_I16 = H5T_STD_I16LE

const H5T_ALPHA_I32 = H5T_STD_I32LE

const H5T_ALPHA_I64 = H5T_STD_I64LE

const H5T_ALPHA_U8 = H5T_STD_U8LE

const H5T_ALPHA_U16 = H5T_STD_U16LE

const H5T_ALPHA_U32 = H5T_STD_U32LE

const H5T_ALPHA_U64 = H5T_STD_U64LE

const H5T_ALPHA_B8 = H5T_STD_B8LE

const H5T_ALPHA_B16 = H5T_STD_B16LE

const H5T_ALPHA_B32 = H5T_STD_B32LE

const H5T_ALPHA_B64 = H5T_STD_B64LE

const H5T_ALPHA_F32 = H5T_IEEE_F32LE

const H5T_ALPHA_F64 = H5T_IEEE_F64LE

const H5T_MIPS_I8 = H5T_STD_I8BE

const H5T_MIPS_I16 = H5T_STD_I16BE

const H5T_MIPS_I32 = H5T_STD_I32BE

const H5T_MIPS_I64 = H5T_STD_I64BE

const H5T_MIPS_U8 = H5T_STD_U8BE

const H5T_MIPS_U16 = H5T_STD_U16BE

const H5T_MIPS_U32 = H5T_STD_U32BE

const H5T_MIPS_U64 = H5T_STD_U64BE

const H5T_MIPS_B8 = H5T_STD_B8BE

const H5T_MIPS_B16 = H5T_STD_B16BE

const H5T_MIPS_B32 = H5T_STD_B32BE

const H5T_MIPS_B64 = H5T_STD_B64BE

const H5T_MIPS_F32 = H5T_IEEE_F32BE

const H5T_MIPS_F64 = H5T_IEEE_F64BE

const H5T_VAX_F32 = H5OPEN(H5T_VAX_F32_g)

const H5T_VAX_F64 = H5OPEN(H5T_VAX_F64_g)

const H5T_NATIVE_SCHAR = H5OPEN(H5T_NATIVE_SCHAR_g)

const H5T_NATIVE_UCHAR = H5OPEN(H5T_NATIVE_UCHAR_g)

const H5T_NATIVE_CHAR = if CHAR_MIN
            H5T_NATIVE_SCHAR
        else
            H5T_NATIVE_UCHAR
        end

const H5T_NATIVE_SHORT = H5OPEN(H5T_NATIVE_SHORT_g)

const H5T_NATIVE_USHORT = H5OPEN(H5T_NATIVE_USHORT_g)

const H5T_NATIVE_INT = H5OPEN(H5T_NATIVE_INT_g)

const H5T_NATIVE_UINT = H5OPEN(H5T_NATIVE_UINT_g)

const H5T_NATIVE_LONG = H5OPEN(H5T_NATIVE_LONG_g)

const H5T_NATIVE_ULONG = H5OPEN(H5T_NATIVE_ULONG_g)

const H5T_NATIVE_LLONG = H5OPEN(H5T_NATIVE_LLONG_g)

const H5T_NATIVE_ULLONG = H5OPEN(H5T_NATIVE_ULLONG_g)

const H5T_NATIVE_FLOAT = H5OPEN(H5T_NATIVE_FLOAT_g)

const H5T_NATIVE_DOUBLE = H5OPEN(H5T_NATIVE_DOUBLE_g)

const H5T_NATIVE_LDOUBLE = H5OPEN(H5T_NATIVE_LDOUBLE_g)

const H5T_NATIVE_B8 = H5OPEN(H5T_NATIVE_B8_g)

const H5T_NATIVE_B16 = H5OPEN(H5T_NATIVE_B16_g)

const H5T_NATIVE_B32 = H5OPEN(H5T_NATIVE_B32_g)

const H5T_NATIVE_B64 = H5OPEN(H5T_NATIVE_B64_g)

const H5T_NATIVE_OPAQUE = H5OPEN(H5T_NATIVE_OPAQUE_g)

const H5T_NATIVE_HADDR = H5OPEN(H5T_NATIVE_HADDR_g)

const H5T_NATIVE_HSIZE = H5OPEN(H5T_NATIVE_HSIZE_g)

const H5T_NATIVE_HSSIZE = H5OPEN(H5T_NATIVE_HSSIZE_g)

const H5T_NATIVE_HERR = H5OPEN(H5T_NATIVE_HERR_g)

const H5T_NATIVE_HBOOL = H5OPEN(H5T_NATIVE_HBOOL_g)

const H5T_NATIVE_INT8 = H5OPEN(H5T_NATIVE_INT8_g)

const H5T_NATIVE_UINT8 = H5OPEN(H5T_NATIVE_UINT8_g)

const H5T_NATIVE_INT_LEAST8 = H5OPEN(H5T_NATIVE_INT_LEAST8_g)

const H5T_NATIVE_UINT_LEAST8 = H5OPEN(H5T_NATIVE_UINT_LEAST8_g)

const H5T_NATIVE_INT_FAST8 = H5OPEN(H5T_NATIVE_INT_FAST8_g)

const H5T_NATIVE_UINT_FAST8 = H5OPEN(H5T_NATIVE_UINT_FAST8_g)

const H5T_NATIVE_INT16 = H5OPEN(H5T_NATIVE_INT16_g)

const H5T_NATIVE_UINT16 = H5OPEN(H5T_NATIVE_UINT16_g)

const H5T_NATIVE_INT_LEAST16 = H5OPEN(H5T_NATIVE_INT_LEAST16_g)

const H5T_NATIVE_UINT_LEAST16 = H5OPEN(H5T_NATIVE_UINT_LEAST16_g)

const H5T_NATIVE_INT_FAST16 = H5OPEN(H5T_NATIVE_INT_FAST16_g)

const H5T_NATIVE_UINT_FAST16 = H5OPEN(H5T_NATIVE_UINT_FAST16_g)

const H5T_NATIVE_INT32 = H5OPEN(H5T_NATIVE_INT32_g)

const H5T_NATIVE_UINT32 = H5OPEN(H5T_NATIVE_UINT32_g)

const H5T_NATIVE_INT_LEAST32 = H5OPEN(H5T_NATIVE_INT_LEAST32_g)

const H5T_NATIVE_UINT_LEAST32 = H5OPEN(H5T_NATIVE_UINT_LEAST32_g)

const H5T_NATIVE_INT_FAST32 = H5OPEN(H5T_NATIVE_INT_FAST32_g)

const H5T_NATIVE_UINT_FAST32 = H5OPEN(H5T_NATIVE_UINT_FAST32_g)

const H5T_NATIVE_INT64 = H5OPEN(H5T_NATIVE_INT64_g)

const H5T_NATIVE_UINT64 = H5OPEN(H5T_NATIVE_UINT64_g)

const H5T_NATIVE_INT_LEAST64 = H5OPEN(H5T_NATIVE_INT_LEAST64_g)

const H5T_NATIVE_UINT_LEAST64 = H5OPEN(H5T_NATIVE_UINT_LEAST64_g)

const H5T_NATIVE_INT_FAST64 = H5OPEN(H5T_NATIVE_INT_FAST64_g)

const H5T_NATIVE_UINT_FAST64 = H5OPEN(H5T_NATIVE_UINT_FAST64_g)

const H5L_MAX_LINK_NAME_LEN = uint32_t(-1)

const H5L_SAME_LOC = hid_t(0)

const H5L_LINK_CLASS_T_VERS = 1

const H5L_TYPE_BUILTIN_MAX = H5L_TYPE_SOFT

const H5L_TYPE_UD_MIN = H5L_TYPE_EXTERNAL

const H5L_TYPE_UD_MAX = H5L_TYPE_MAX

const H5L_LINK_CLASS_T_VERS_0 = 0

const H5O_COPY_SHALLOW_HIERARCHY_FLAG = Cuint(0x0001)

const H5O_COPY_EXPAND_SOFT_LINK_FLAG = Cuint(0x0002)

const H5O_COPY_EXPAND_EXT_LINK_FLAG = Cuint(0x0004)

const H5O_COPY_EXPAND_REFERENCE_FLAG = Cuint(0x0008)

const H5O_COPY_WITHOUT_ATTR_FLAG = Cuint(0x0010)

const H5O_COPY_PRESERVE_NULL_FLAG = Cuint(0x0020)

const H5O_COPY_MERGE_COMMITTED_DTYPE_FLAG = Cuint(0x0040)

const H5O_COPY_ALL = Cuint(0x007f)

const H5O_SHMESG_NONE_FLAG = 0x0000

const H5O_SHMESG_SDSPACE_FLAG = unsigned(1) << 0x0001

const H5O_SHMESG_DTYPE_FLAG = unsigned(1) << 0x0003

const H5O_SHMESG_FILL_FLAG = unsigned(1) << 0x0005

const H5O_SHMESG_PLINE_FLAG = unsigned(1) << 0x000b

const H5O_SHMESG_ATTR_FLAG = unsigned(1) << 0x000c

const H5O_SHMESG_ALL_FLAG = (((H5O_SHMESG_SDSPACE_FLAG | H5O_SHMESG_DTYPE_FLAG) | H5O_SHMESG_FILL_FLAG) | H5O_SHMESG_PLINE_FLAG) | H5O_SHMESG_ATTR_FLAG

const H5O_HDR_CHUNK0_SIZE = 0x03

const H5O_HDR_ATTR_CRT_ORDER_TRACKED = 0x04

const H5O_HDR_ATTR_CRT_ORDER_INDEXED = 0x08

const H5O_HDR_ATTR_STORE_PHASE_CHANGE = 0x10

const H5O_HDR_STORE_TIMES = 0x20

const H5O_HDR_ALL_FLAGS = (((H5O_HDR_CHUNK0_SIZE | H5O_HDR_ATTR_CRT_ORDER_TRACKED) | H5O_HDR_ATTR_CRT_ORDER_INDEXED) | H5O_HDR_ATTR_STORE_PHASE_CHANGE) | H5O_HDR_STORE_TIMES

const H5O_SHMESG_MAX_NINDEXES = 8

const H5O_SHMESG_MAX_LIST_SIZE = 5000

const H5O_INFO_BASIC = Cuint(0x0001)

const H5O_INFO_TIME = Cuint(0x0002)

const H5O_INFO_NUM_ATTRS = Cuint(0x0004)

const H5O_INFO_ALL = (H5O_INFO_BASIC | H5O_INFO_TIME) | H5O_INFO_NUM_ATTRS

const H5O_NATIVE_INFO_HDR = Cuint(0x0008)

const H5O_NATIVE_INFO_META_SIZE = Cuint(0x0010)

const H5O_NATIVE_INFO_ALL = H5O_NATIVE_INFO_HDR | H5O_NATIVE_INFO_META_SIZE

const H5O_TOKEN_UNDEF = H5OPEN(H5O_TOKEN_UNDEF_g)

const H5O_INFO_HDR = Cuint(0x0008)

const H5O_INFO_META_SIZE = Cuint(0x0010)

const H5AC__CURR_CACHE_CONFIG_VERSION = 1

const H5AC__MAX_TRACE_FILE_NAME_LEN = 1024

const H5AC_METADATA_WRITE_STRATEGY__PROCESS_0_ONLY = 0

const H5AC_METADATA_WRITE_STRATEGY__DISTRIBUTED = 1

const H5AC__CURR_CACHE_IMAGE_CONFIG_VERSION = 1

const H5AC__CACHE_IMAGE__ENTRY_AGEOUT__NONE = -1

const H5AC__CACHE_IMAGE__ENTRY_AGEOUT__MAX = 100

const H5D_CHUNK_CACHE_NSLOTS_DEFAULT = size_t - 1

const H5D_CHUNK_CACHE_NBYTES_DEFAULT = size_t - 1

const H5D_CHUNK_CACHE_W0_DEFAULT = -(Float32(1.0))

const H5D_CHUNK_DONT_FILTER_PARTIAL_CHUNKS = Cuint(0x0002)

const H5D_CHUNK_BTREE = H5D_CHUNK_IDX_BTREE

const H5D_XFER_DIRECT_CHUNK_WRITE_FLAG_NAME = "direct_chunk_flag"

const H5D_XFER_DIRECT_CHUNK_WRITE_FILTERS_NAME = "direct_chunk_filters"

const H5D_XFER_DIRECT_CHUNK_WRITE_OFFSET_NAME = "direct_chunk_offset"

const H5D_XFER_DIRECT_CHUNK_WRITE_DATASIZE_NAME = "direct_chunk_datasize"

const H5D_XFER_DIRECT_CHUNK_READ_FLAG_NAME = "direct_chunk_read_flag"

const H5D_XFER_DIRECT_CHUNK_READ_OFFSET_NAME = "direct_chunk_read_offset"

const H5D_XFER_DIRECT_CHUNK_READ_FILTERS_NAME = "direct_chunk_read_filters"

const H5E_DEFAULT = hid_t(0)

const H5E_ERR_CLS = H5OPEN(H5E_ERR_CLS_g)

const H5E_FUNC = H5OPEN(H5E_FUNC_g)

const H5E_FILE = H5OPEN(H5E_FILE_g)

const H5E_VOL = H5OPEN(H5E_VOL_g)

const H5E_SOHM = H5OPEN(H5E_SOHM_g)

const H5E_SYM = H5OPEN(H5E_SYM_g)

const H5E_PLUGIN = H5OPEN(H5E_PLUGIN_g)

const H5E_VFL = H5OPEN(H5E_VFL_g)

const H5E_INTERNAL = H5OPEN(H5E_INTERNAL_g)

const H5E_BTREE = H5OPEN(H5E_BTREE_g)

const H5E_REFERENCE = H5OPEN(H5E_REFERENCE_g)

const H5E_DATASPACE = H5OPEN(H5E_DATASPACE_g)

const H5E_RESOURCE = H5OPEN(H5E_RESOURCE_g)

const H5E_RS = H5OPEN(H5E_RS_g)

const H5E_FARRAY = H5OPEN(H5E_FARRAY_g)

const H5E_HEAP = H5OPEN(H5E_HEAP_g)

const H5E_MAP = H5OPEN(H5E_MAP_g)

const H5E_ATTR = H5OPEN(H5E_ATTR_g)

const H5E_IO = H5OPEN(H5E_IO_g)

const H5E_EFL = H5OPEN(H5E_EFL_g)

const H5E_TST = H5OPEN(H5E_TST_g)

const H5E_LIB = H5OPEN(H5E_LIB_g)

const H5E_PAGEBUF = H5OPEN(H5E_PAGEBUF_g)

const H5E_FSPACE = H5OPEN(H5E_FSPACE_g)

const H5E_DATASET = H5OPEN(H5E_DATASET_g)

const H5E_STORAGE = H5OPEN(H5E_STORAGE_g)

const H5E_LINK = H5OPEN(H5E_LINK_g)

const H5E_PLIST = H5OPEN(H5E_PLIST_g)

const H5E_DATATYPE = H5OPEN(H5E_DATATYPE_g)

const H5E_OHDR = H5OPEN(H5E_OHDR_g)

const H5E_ATOM = H5OPEN(H5E_ATOM_g)

const H5E_NONE_MAJOR = H5OPEN(H5E_NONE_MAJOR_g)

const H5E_SLIST = H5OPEN(H5E_SLIST_g)

const H5E_ARGS = H5OPEN(H5E_ARGS_g)

const H5E_CONTEXT = H5OPEN(H5E_CONTEXT_g)

const H5E_EARRAY = H5OPEN(H5E_EARRAY_g)

const H5E_PLINE = H5OPEN(H5E_PLINE_g)

const H5E_ERROR = H5OPEN(H5E_ERROR_g)

const H5E_CACHE = H5OPEN(H5E_CACHE_g)

const H5E_SEEKERROR = H5OPEN(H5E_SEEKERROR_g)

const H5E_READERROR = H5OPEN(H5E_READERROR_g)

const H5E_WRITEERROR = H5OPEN(H5E_WRITEERROR_g)

const H5E_CLOSEERROR = H5OPEN(H5E_CLOSEERROR_g)

const H5E_OVERFLOW = H5OPEN(H5E_OVERFLOW_g)

const H5E_FCNTL = H5OPEN(H5E_FCNTL_g)

const H5E_NOSPACE = H5OPEN(H5E_NOSPACE_g)

const H5E_CANTALLOC = H5OPEN(H5E_CANTALLOC_g)

const H5E_CANTCOPY = H5OPEN(H5E_CANTCOPY_g)

const H5E_CANTFREE = H5OPEN(H5E_CANTFREE_g)

const H5E_ALREADYEXISTS = H5OPEN(H5E_ALREADYEXISTS_g)

const H5E_CANTLOCK = H5OPEN(H5E_CANTLOCK_g)

const H5E_CANTUNLOCK = H5OPEN(H5E_CANTUNLOCK_g)

const H5E_CANTGC = H5OPEN(H5E_CANTGC_g)

const H5E_CANTGETSIZE = H5OPEN(H5E_CANTGETSIZE_g)

const H5E_OBJOPEN = H5OPEN(H5E_OBJOPEN_g)

const H5E_CANTRESTORE = H5OPEN(H5E_CANTRESTORE_g)

const H5E_CANTCOMPUTE = H5OPEN(H5E_CANTCOMPUTE_g)

const H5E_CANTEXTEND = H5OPEN(H5E_CANTEXTEND_g)

const H5E_CANTATTACH = H5OPEN(H5E_CANTATTACH_g)

const H5E_CANTUPDATE = H5OPEN(H5E_CANTUPDATE_g)

const H5E_CANTOPERATE = H5OPEN(H5E_CANTOPERATE_g)

const H5E_CANTINIT = H5OPEN(H5E_CANTINIT_g)

const H5E_ALREADYINIT = H5OPEN(H5E_ALREADYINIT_g)

const H5E_CANTRELEASE = H5OPEN(H5E_CANTRELEASE_g)

const H5E_CANTGET = H5OPEN(H5E_CANTGET_g)

const H5E_CANTSET = H5OPEN(H5E_CANTSET_g)

const H5E_DUPCLASS = H5OPEN(H5E_DUPCLASS_g)

const H5E_SETDISALLOWED = H5OPEN(H5E_SETDISALLOWED_g)

const H5E_CANTMERGE = H5OPEN(H5E_CANTMERGE_g)

const H5E_CANTREVIVE = H5OPEN(H5E_CANTREVIVE_g)

const H5E_CANTSHRINK = H5OPEN(H5E_CANTSHRINK_g)

const H5E_LINKCOUNT = H5OPEN(H5E_LINKCOUNT_g)

const H5E_VERSION = H5OPEN(H5E_VERSION_g)

const H5E_ALIGNMENT = H5OPEN(H5E_ALIGNMENT_g)

const H5E_BADMESG = H5OPEN(H5E_BADMESG_g)

const H5E_CANTDELETE = H5OPEN(H5E_CANTDELETE_g)

const H5E_BADITER = H5OPEN(H5E_BADITER_g)

const H5E_CANTPACK = H5OPEN(H5E_CANTPACK_g)

const H5E_CANTRESET = H5OPEN(H5E_CANTRESET_g)

const H5E_CANTRENAME = H5OPEN(H5E_CANTRENAME_g)

const H5E_SYSERRSTR = H5OPEN(H5E_SYSERRSTR_g)

const H5E_NOFILTER = H5OPEN(H5E_NOFILTER_g)

const H5E_CALLBACK = H5OPEN(H5E_CALLBACK_g)

const H5E_CANAPPLY = H5OPEN(H5E_CANAPPLY_g)

const H5E_SETLOCAL = H5OPEN(H5E_SETLOCAL_g)

const H5E_NOENCODER = H5OPEN(H5E_NOENCODER_g)

const H5E_CANTFILTER = H5OPEN(H5E_CANTFILTER_g)

const H5E_CANTOPENOBJ = H5OPEN(H5E_CANTOPENOBJ_g)

const H5E_CANTCLOSEOBJ = H5OPEN(H5E_CANTCLOSEOBJ_g)

const H5E_COMPLEN = H5OPEN(H5E_COMPLEN_g)

const H5E_PATH = H5OPEN(H5E_PATH_g)

const H5E_NONE_MINOR = H5OPEN(H5E_NONE_MINOR_g)

const H5E_OPENERROR = H5OPEN(H5E_OPENERROR_g)

const H5E_FILEEXISTS = H5OPEN(H5E_FILEEXISTS_g)

const H5E_FILEOPEN = H5OPEN(H5E_FILEOPEN_g)

const H5E_CANTCREATE = H5OPEN(H5E_CANTCREATE_g)

const H5E_CANTOPENFILE = H5OPEN(H5E_CANTOPENFILE_g)

const H5E_CANTCLOSEFILE = H5OPEN(H5E_CANTCLOSEFILE_g)

const H5E_NOTHDF5 = H5OPEN(H5E_NOTHDF5_g)

const H5E_BADFILE = H5OPEN(H5E_BADFILE_g)

const H5E_TRUNCATED = H5OPEN(H5E_TRUNCATED_g)

const H5E_MOUNT = H5OPEN(H5E_MOUNT_g)

const H5E_CANTDELETEFILE = H5OPEN(H5E_CANTDELETEFILE_g)

const H5E_CANTLOCKFILE = H5OPEN(H5E_CANTLOCKFILE_g)

const H5E_CANTUNLOCKFILE = H5OPEN(H5E_CANTUNLOCKFILE_g)

const H5E_BADATOM = H5OPEN(H5E_BADATOM_g)

const H5E_BADGROUP = H5OPEN(H5E_BADGROUP_g)

const H5E_CANTREGISTER = H5OPEN(H5E_CANTREGISTER_g)

const H5E_CANTINC = H5OPEN(H5E_CANTINC_g)

const H5E_CANTDEC = H5OPEN(H5E_CANTDEC_g)

const H5E_NOIDS = H5OPEN(H5E_NOIDS_g)

const H5E_CANTFLUSH = H5OPEN(H5E_CANTFLUSH_g)

const H5E_CANTUNSERIALIZE = H5OPEN(H5E_CANTUNSERIALIZE_g)

const H5E_CANTSERIALIZE = H5OPEN(H5E_CANTSERIALIZE_g)

const H5E_CANTTAG = H5OPEN(H5E_CANTTAG_g)

const H5E_CANTLOAD = H5OPEN(H5E_CANTLOAD_g)

const H5E_PROTECT = H5OPEN(H5E_PROTECT_g)

const H5E_NOTCACHED = H5OPEN(H5E_NOTCACHED_g)

const H5E_SYSTEM = H5OPEN(H5E_SYSTEM_g)

const H5E_CANTINS = H5OPEN(H5E_CANTINS_g)

const H5E_CANTPROTECT = H5OPEN(H5E_CANTPROTECT_g)

const H5E_CANTUNPROTECT = H5OPEN(H5E_CANTUNPROTECT_g)

const H5E_CANTPIN = H5OPEN(H5E_CANTPIN_g)

const H5E_CANTUNPIN = H5OPEN(H5E_CANTUNPIN_g)

const H5E_CANTMARKDIRTY = H5OPEN(H5E_CANTMARKDIRTY_g)

const H5E_CANTMARKCLEAN = H5OPEN(H5E_CANTMARKCLEAN_g)

const H5E_CANTMARKUNSERIALIZED = H5OPEN(H5E_CANTMARKUNSERIALIZED_g)

const H5E_CANTMARKSERIALIZED = H5OPEN(H5E_CANTMARKSERIALIZED_g)

const H5E_CANTDIRTY = H5OPEN(H5E_CANTDIRTY_g)

const H5E_CANTCLEAN = H5OPEN(H5E_CANTCLEAN_g)

const H5E_CANTEXPUNGE = H5OPEN(H5E_CANTEXPUNGE_g)

const H5E_CANTRESIZE = H5OPEN(H5E_CANTRESIZE_g)

const H5E_CANTDEPEND = H5OPEN(H5E_CANTDEPEND_g)

const H5E_CANTUNDEPEND = H5OPEN(H5E_CANTUNDEPEND_g)

const H5E_CANTNOTIFY = H5OPEN(H5E_CANTNOTIFY_g)

const H5E_LOGGING = H5OPEN(H5E_LOGGING_g)

const H5E_CANTCORK = H5OPEN(H5E_CANTCORK_g)

const H5E_CANTUNCORK = H5OPEN(H5E_CANTUNCORK_g)

const H5E_TRAVERSE = H5OPEN(H5E_TRAVERSE_g)

const H5E_NLINKS = H5OPEN(H5E_NLINKS_g)

const H5E_NOTREGISTERED = H5OPEN(H5E_NOTREGISTERED_g)

const H5E_CANTMOVE = H5OPEN(H5E_CANTMOVE_g)

const H5E_CANTSORT = H5OPEN(H5E_CANTSORT_g)

const H5E_MPI = H5OPEN(H5E_MPI_g)

const H5E_MPIERRSTR = H5OPEN(H5E_MPIERRSTR_g)

const H5E_CANTRECV = H5OPEN(H5E_CANTRECV_g)

const H5E_CANTGATHER = H5OPEN(H5E_CANTGATHER_g)

const H5E_NO_INDEPENDENT = H5OPEN(H5E_NO_INDEPENDENT_g)

const H5E_CANTCLIP = H5OPEN(H5E_CANTCLIP_g)

const H5E_CANTCOUNT = H5OPEN(H5E_CANTCOUNT_g)

const H5E_CANTSELECT = H5OPEN(H5E_CANTSELECT_g)

const H5E_CANTNEXT = H5OPEN(H5E_CANTNEXT_g)

const H5E_BADSELECT = H5OPEN(H5E_BADSELECT_g)

const H5E_CANTCOMPARE = H5OPEN(H5E_CANTCOMPARE_g)

const H5E_INCONSISTENTSTATE = H5OPEN(H5E_INCONSISTENTSTATE_g)

const H5E_CANTAPPEND = H5OPEN(H5E_CANTAPPEND_g)

const H5E_UNINITIALIZED = H5OPEN(H5E_UNINITIALIZED_g)

const H5E_UNSUPPORTED = H5OPEN(H5E_UNSUPPORTED_g)

const H5E_BADTYPE = H5OPEN(H5E_BADTYPE_g)

const H5E_BADRANGE = H5OPEN(H5E_BADRANGE_g)

const H5E_BADVALUE = H5OPEN(H5E_BADVALUE_g)

const H5E_NOTFOUND = H5OPEN(H5E_NOTFOUND_g)

const H5E_EXISTS = H5OPEN(H5E_EXISTS_g)

const H5E_CANTENCODE = H5OPEN(H5E_CANTENCODE_g)

const H5E_CANTDECODE = H5OPEN(H5E_CANTDECODE_g)

const H5E_CANTSPLIT = H5OPEN(H5E_CANTSPLIT_g)

const H5E_CANTREDISTRIBUTE = H5OPEN(H5E_CANTREDISTRIBUTE_g)

const H5E_CANTSWAP = H5OPEN(H5E_CANTSWAP_g)

const H5E_CANTINSERT = H5OPEN(H5E_CANTINSERT_g)

const H5E_CANTLIST = H5OPEN(H5E_CANTLIST_g)

const H5E_CANTMODIFY = H5OPEN(H5E_CANTMODIFY_g)

const H5E_CANTREMOVE = H5OPEN(H5E_CANTREMOVE_g)

const H5E_CANTCONVERT = H5OPEN(H5E_CANTCONVERT_g)

const H5E_BADSIZE = H5OPEN(H5E_BADSIZE_g)

# Skipping MacroDefinition: H5E_BEGIN_TRY { unsigned H5E_saved_is_v2 ; union { H5E_auto1_t efunc1 ; H5E_auto2_t efunc2 ; } H5E_saved ; void * H5E_saved_edata ; ( void ) H5Eauto_is_v2 ( H5E_DEFAULT , & H5E_saved_is_v2 ) ; if ( H5E_saved_is_v2 ) { ( void ) H5Eget_auto2 ( H5E_DEFAULT , & H5E_saved . efunc2 , & H5E_saved_edata ) ; ( void ) H5Eset_auto2 ( H5E_DEFAULT , NULL , NULL ) ; } else { ( void ) H5Eget_auto1 ( & H5E_saved . efunc1 , & H5E_saved_edata ) ; ( void ) H5Eset_auto1 ( NULL , NULL ) ; }

# Skipping MacroDefinition: H5E_END_TRY if ( H5E_saved_is_v2 ) ( void ) H5Eset_auto2 ( H5E_DEFAULT , H5E_saved . efunc2 , H5E_saved_edata ) ; else ( void ) H5Eset_auto1 ( H5E_saved . efunc1 , H5E_saved_edata ) ; }

# Skipping MacroDefinition: H5CHECK H5check ( ) ,

const H5F_ACC_RDONLY = (H5CHECK(H5OPEN))(Cuint(0x0000))

const H5F_ACC_RDWR = (H5CHECK(H5OPEN))(Cuint(0x0001))

const H5F_ACC_TRUNC = (H5CHECK(H5OPEN))(Cuint(0x0002))

const H5F_ACC_EXCL = (H5CHECK(H5OPEN))(Cuint(0x0004))

const H5F_ACC_CREAT = (H5CHECK(H5OPEN))(Cuint(0x0010))

const H5F_ACC_SWMR_WRITE = H5CHECK(Cuint(0x0020))

const H5F_ACC_SWMR_READ = H5CHECK(Cuint(0x0040))

const H5F_ACC_DEFAULT = (H5CHECK(H5OPEN))(Cuint(0xffff))

const H5F_OBJ_FILE = Cuint(0x0001)

const H5F_OBJ_DATASET = Cuint(0x0002)

const H5F_OBJ_GROUP = Cuint(0x0004)

const H5F_OBJ_DATATYPE = Cuint(0x0008)

const H5F_OBJ_ATTR = Cuint(0x0010)

const H5F_OBJ_ALL = (((H5F_OBJ_FILE | H5F_OBJ_DATASET) | H5F_OBJ_GROUP) | H5F_OBJ_DATATYPE) | H5F_OBJ_ATTR

const H5F_OBJ_LOCAL = Cuint(0x0020)

const H5F_FAMILY_DEFAULT = hsize_t(0)

const H5F_UNLIMITED = hsize_t(Clong(-1))

const H5F_LIBVER_LATEST = H5F_LIBVER_V112

const H5F_NUM_METADATA_READ_RETRY_TYPES = 21

const H5F_ACC_DEBUG = (H5CHECK(H5OPEN))(Cuint(0x0000))

const H5_HAVE_VFL = 1

const H5FD_VFD_DEFAULT = 0

const H5FD_MEM_FHEAP_HDR = H5FD_MEM_OHDR

const H5FD_MEM_FHEAP_IBLOCK = H5FD_MEM_OHDR

const H5FD_MEM_FHEAP_DBLOCK = H5FD_MEM_LHEAP

const H5FD_MEM_FHEAP_HUGE_OBJ = H5FD_MEM_DRAW

const H5FD_MEM_FSPACE_HDR = H5FD_MEM_OHDR

const H5FD_MEM_FSPACE_SINFO = H5FD_MEM_LHEAP

const H5FD_MEM_SOHM_TABLE = H5FD_MEM_OHDR

const H5FD_MEM_SOHM_INDEX = H5FD_MEM_BTREE

const H5FD_MEM_EARRAY_HDR = H5FD_MEM_OHDR

const H5FD_MEM_EARRAY_IBLOCK = H5FD_MEM_OHDR

const H5FD_MEM_EARRAY_SBLOCK = H5FD_MEM_BTREE

const H5FD_MEM_EARRAY_DBLOCK = H5FD_MEM_LHEAP

const H5FD_MEM_EARRAY_DBLK_PAGE = H5FD_MEM_LHEAP

const H5FD_MEM_FARRAY_HDR = H5FD_MEM_OHDR

const H5FD_MEM_FARRAY_DBLOCK = H5FD_MEM_LHEAP

const H5FD_MEM_FARRAY_DBLK_PAGE = H5FD_MEM_LHEAP

# Skipping MacroDefinition: H5FD_FLMAP_SINGLE { H5FD_MEM_SUPER , /*default*/ H5FD_MEM_SUPER , /*super*/ H5FD_MEM_SUPER , /*btree*/ H5FD_MEM_SUPER , /*draw*/ H5FD_MEM_SUPER , /*gheap*/ H5FD_MEM_SUPER , /*lheap*/ H5FD_MEM_SUPER /*ohdr*/ }

# Skipping MacroDefinition: H5FD_FLMAP_DICHOTOMY { H5FD_MEM_SUPER , /*default*/ H5FD_MEM_SUPER , /*super*/ H5FD_MEM_SUPER , /*btree*/ H5FD_MEM_DRAW , /*draw*/ H5FD_MEM_DRAW , /*gheap*/ H5FD_MEM_SUPER , /*lheap*/ H5FD_MEM_SUPER /*ohdr*/ }

# Skipping MacroDefinition: H5FD_FLMAP_DEFAULT { H5FD_MEM_DEFAULT , /*default*/ H5FD_MEM_DEFAULT , /*super*/ H5FD_MEM_DEFAULT , /*btree*/ H5FD_MEM_DEFAULT , /*draw*/ H5FD_MEM_DEFAULT , /*gheap*/ H5FD_MEM_DEFAULT , /*lheap*/ H5FD_MEM_DEFAULT /*ohdr*/ }

const H5FD_FEAT_AGGREGATE_METADATA = 0x00000001

const H5FD_FEAT_ACCUMULATE_METADATA_WRITE = 0x00000002

const H5FD_FEAT_ACCUMULATE_METADATA_READ = 0x00000004

const H5FD_FEAT_ACCUMULATE_METADATA = H5FD_FEAT_ACCUMULATE_METADATA_WRITE | H5FD_FEAT_ACCUMULATE_METADATA_READ

const H5FD_FEAT_DATA_SIEVE = 0x00000008

const H5FD_FEAT_AGGREGATE_SMALLDATA = 0x00000010

const H5FD_FEAT_IGNORE_DRVRINFO = 0x00000020

const H5FD_FEAT_DIRTY_DRVRINFO_LOAD = 0x00000040

const H5FD_FEAT_POSIX_COMPAT_HANDLE = 0x00000080

const H5FD_FEAT_HAS_MPI = 0x00000100

const H5FD_FEAT_ALLOCATE_EARLY = 0x00000200

const H5FD_FEAT_ALLOW_FILE_IMAGE = 0x00000400

const H5FD_FEAT_CAN_USE_FILE_IMAGE_CALLBACKS = 0x00000800

const H5FD_FEAT_SUPPORTS_SWMR_IO = 0x00001000

const H5FD_FEAT_USE_ALLOC_SIZE = 0x00002000

const H5FD_FEAT_PAGED_AGGR = 0x00004000

const H5FD_FEAT_DEFAULT_VFD_COMPATIBLE = 0x00008000

const H5G_SAME_LOC = H5L_SAME_LOC

const H5G_LINK_ERROR = H5L_TYPE_ERROR

const H5G_LINK_HARD = H5L_TYPE_HARD

const H5G_LINK_SOFT = H5L_TYPE_SOFT

const H5G_link_t = H5L_type_t

const H5G_NTYPES = 256

const H5G_NLIBTYPES = 8

const H5G_NUSERTYPES = H5G_NTYPES - H5G_NLIBTYPES

const H5VL_MAP_CREATE = 1

const H5VL_MAP_OPEN = 2

const H5VL_MAP_GET_VAL = 3

const H5VL_MAP_EXISTS = 4

const H5VL_MAP_PUT = 5

const H5VL_MAP_GET = 6

const H5VL_MAP_SPECIFIC = 7

const H5VL_MAP_OPTIONAL = 8

const H5VL_MAP_CLOSE = 9

const H5Z_FILTER_ERROR = -1

const H5Z_FILTER_NONE = 0

const H5Z_FILTER_DEFLATE = 1

const H5Z_FILTER_SHUFFLE = 2

const H5Z_FILTER_FLETCHER32 = 3

const H5Z_FILTER_SZIP = 4

const H5Z_FILTER_NBIT = 5

const H5Z_FILTER_SCALEOFFSET = 6

const H5Z_FILTER_RESERVED = 256

const H5Z_FILTER_MAX = 65535

const H5Z_FILTER_ALL = 0

const H5Z_MAX_NFILTERS = 32

const H5Z_FLAG_DEFMASK = 0x00ff

const H5Z_FLAG_MANDATORY = 0x0000

const H5Z_FLAG_OPTIONAL = 0x0001

const H5Z_FLAG_INVMASK = 0xff00

const H5Z_FLAG_REVERSE = 0x0100

const H5Z_FLAG_SKIP_EDC = 0x0200

const H5_SZIP_ALLOW_K13_OPTION_MASK = 1

const H5_SZIP_CHIP_OPTION_MASK = 2

const H5_SZIP_EC_OPTION_MASK = 4

const H5_SZIP_NN_OPTION_MASK = 32

const H5_SZIP_MAX_PIXELS_PER_BLOCK = 32

const H5Z_SHUFFLE_USER_NPARMS = 0

const H5Z_SHUFFLE_TOTAL_NPARMS = 1

const H5Z_SZIP_USER_NPARMS = 2

const H5Z_SZIP_TOTAL_NPARMS = 4

const H5Z_SZIP_PARM_MASK = 0

const H5Z_SZIP_PARM_PPB = 1

const H5Z_SZIP_PARM_BPP = 2

const H5Z_SZIP_PARM_PPS = 3

const H5Z_NBIT_USER_NPARMS = 0

const H5Z_SCALEOFFSET_USER_NPARMS = 2

const H5Z_SO_INT_MINBITS_DEFAULT = 0

const H5Z_CLASS_T_VERS = 1

const H5Z_FILTER_CONFIG_ENCODE_ENABLED = 0x0001

const H5Z_FILTER_CONFIG_DECODE_ENABLED = 0x0002

const H5P_ROOT = H5OPEN(H5P_CLS_ROOT_ID_g)

const H5P_OBJECT_CREATE = H5OPEN(H5P_CLS_OBJECT_CREATE_ID_g)

const H5P_FILE_CREATE = H5OPEN(H5P_CLS_FILE_CREATE_ID_g)

const H5P_FILE_ACCESS = H5OPEN(H5P_CLS_FILE_ACCESS_ID_g)

const H5P_DATASET_CREATE = H5OPEN(H5P_CLS_DATASET_CREATE_ID_g)

const H5P_DATASET_ACCESS = H5OPEN(H5P_CLS_DATASET_ACCESS_ID_g)

const H5P_DATASET_XFER = H5OPEN(H5P_CLS_DATASET_XFER_ID_g)

const H5P_FILE_MOUNT = H5OPEN(H5P_CLS_FILE_MOUNT_ID_g)

const H5P_GROUP_CREATE = H5OPEN(H5P_CLS_GROUP_CREATE_ID_g)

const H5P_GROUP_ACCESS = H5OPEN(H5P_CLS_GROUP_ACCESS_ID_g)

const H5P_DATATYPE_CREATE = H5OPEN(H5P_CLS_DATATYPE_CREATE_ID_g)

const H5P_DATATYPE_ACCESS = H5OPEN(H5P_CLS_DATATYPE_ACCESS_ID_g)

const H5P_MAP_CREATE = H5OPEN(H5P_CLS_MAP_CREATE_ID_g)

const H5P_MAP_ACCESS = H5OPEN(H5P_CLS_MAP_ACCESS_ID_g)

const H5P_STRING_CREATE = H5OPEN(H5P_CLS_STRING_CREATE_ID_g)

const H5P_ATTRIBUTE_CREATE = H5OPEN(H5P_CLS_ATTRIBUTE_CREATE_ID_g)

const H5P_ATTRIBUTE_ACCESS = H5OPEN(H5P_CLS_ATTRIBUTE_ACCESS_ID_g)

const H5P_OBJECT_COPY = H5OPEN(H5P_CLS_OBJECT_COPY_ID_g)

const H5P_LINK_CREATE = H5OPEN(H5P_CLS_LINK_CREATE_ID_g)

const H5P_LINK_ACCESS = H5OPEN(H5P_CLS_LINK_ACCESS_ID_g)

const H5P_VOL_INITIALIZE = H5OPEN(H5P_CLS_VOL_INITIALIZE_ID_g)

const H5P_REFERENCE_ACCESS = H5OPEN(H5P_CLS_REFERENCE_ACCESS_ID_g)

const H5P_FILE_CREATE_DEFAULT = H5OPEN(H5P_LST_FILE_CREATE_ID_g)

const H5P_FILE_ACCESS_DEFAULT = H5OPEN(H5P_LST_FILE_ACCESS_ID_g)

const H5P_DATASET_CREATE_DEFAULT = H5OPEN(H5P_LST_DATASET_CREATE_ID_g)

const H5P_DATASET_ACCESS_DEFAULT = H5OPEN(H5P_LST_DATASET_ACCESS_ID_g)

const H5P_DATASET_XFER_DEFAULT = H5OPEN(H5P_LST_DATASET_XFER_ID_g)

const H5P_FILE_MOUNT_DEFAULT = H5OPEN(H5P_LST_FILE_MOUNT_ID_g)

const H5P_GROUP_CREATE_DEFAULT = H5OPEN(H5P_LST_GROUP_CREATE_ID_g)

const H5P_GROUP_ACCESS_DEFAULT = H5OPEN(H5P_LST_GROUP_ACCESS_ID_g)

const H5P_DATATYPE_CREATE_DEFAULT = H5OPEN(H5P_LST_DATATYPE_CREATE_ID_g)

const H5P_DATATYPE_ACCESS_DEFAULT = H5OPEN(H5P_LST_DATATYPE_ACCESS_ID_g)

const H5P_MAP_CREATE_DEFAULT = H5OPEN(H5P_LST_MAP_CREATE_ID_g)

const H5P_MAP_ACCESS_DEFAULT = H5OPEN(H5P_LST_MAP_ACCESS_ID_g)

const H5P_ATTRIBUTE_CREATE_DEFAULT = H5OPEN(H5P_LST_ATTRIBUTE_CREATE_ID_g)

const H5P_ATTRIBUTE_ACCESS_DEFAULT = H5OPEN(H5P_LST_ATTRIBUTE_ACCESS_ID_g)

const H5P_OBJECT_COPY_DEFAULT = H5OPEN(H5P_LST_OBJECT_COPY_ID_g)

const H5P_LINK_CREATE_DEFAULT = H5OPEN(H5P_LST_LINK_CREATE_ID_g)

const H5P_LINK_ACCESS_DEFAULT = H5OPEN(H5P_LST_LINK_ACCESS_ID_g)

const H5P_VOL_INITIALIZE_DEFAULT = H5OPEN(H5P_LST_VOL_INITIALIZE_ID_g)

const H5P_REFERENCE_ACCESS_DEFAULT = H5OPEN(H5P_LST_REFERENCE_ACCESS_ID_g)

const H5P_CRT_ORDER_TRACKED = 0x0001

const H5P_CRT_ORDER_INDEXED = 0x0002

const H5P_DEFAULT = hid_t(0)

const H5P_NO_CLASS = H5P_ROOT

const H5PL_NO_PLUGIN = "::"

const H5PL_FILTER_PLUGIN = 0x0001

const H5PL_VOL_PLUGIN = 0x0002

const H5PL_ALL_PLUGIN = 0xffff

# Skipping MacroDefinition: H5R_OBJ_REF_BUF_SIZE sizeof ( haddr_t )

# Skipping MacroDefinition: H5R_DSET_REG_REF_BUF_SIZE ( sizeof ( haddr_t ) + 4 )

const H5R_REF_BUF_SIZE = 64

const H5R_OBJECT = H5R_OBJECT1

const H5R_DATASET_REGION = H5R_DATASET_REGION1

const H5S_ALL = hid_t(0)

const H5S_UNLIMITED = HSIZE_UNDEF

const H5S_MAX_RANK = 32

const H5S_SEL_ITER_GET_SEQ_LIST_SORTED = 0x0001

const H5S_SEL_ITER_SHARE_WITH_DATASPACE = 0x0002

const H5VL_VERSION = 0

const H5_VOL_INVALID = -1

const H5_VOL_NATIVE = 0

const H5_VOL_RESERVED = 256

const H5_VOL_MAX = 65535

const H5VL_CAP_FLAG_NONE = 0

const H5VL_CAP_FLAG_THREADSAFE = 0x01

const H5VL_CONTAINER_INFO_VERSION = 0x01

const H5VL_MAX_BLOB_ID_SIZE = 16

const H5VL_NATIVE = H5VL_native_register()

const H5VL_NATIVE_NAME = "native"

const H5VL_NATIVE_VALUE = H5_VOL_NATIVE

const H5VL_NATIVE_VERSION = 0

const H5VL_NATIVE_ATTR_ITERATE_OLD = 0

const H5VL_NATIVE_DATASET_FORMAT_CONVERT = 0

const H5VL_NATIVE_DATASET_GET_CHUNK_INDEX_TYPE = 1

const H5VL_NATIVE_DATASET_GET_CHUNK_STORAGE_SIZE = 2

const H5VL_NATIVE_DATASET_GET_NUM_CHUNKS = 3

const H5VL_NATIVE_DATASET_GET_CHUNK_INFO_BY_IDX = 4

const H5VL_NATIVE_DATASET_GET_CHUNK_INFO_BY_COORD = 5

const H5VL_NATIVE_DATASET_CHUNK_READ = 6

const H5VL_NATIVE_DATASET_CHUNK_WRITE = 7

const H5VL_NATIVE_DATASET_GET_VLEN_BUF_SIZE = 8

const H5VL_NATIVE_DATASET_GET_OFFSET = 9

const H5VL_NATIVE_FILE_CLEAR_ELINK_CACHE = 0

const H5VL_NATIVE_FILE_GET_FILE_IMAGE = 1

const H5VL_NATIVE_FILE_GET_FREE_SECTIONS = 2

const H5VL_NATIVE_FILE_GET_FREE_SPACE = 3

const H5VL_NATIVE_FILE_GET_INFO = 4

const H5VL_NATIVE_FILE_GET_MDC_CONF = 5

const H5VL_NATIVE_FILE_GET_MDC_HR = 6

const H5VL_NATIVE_FILE_GET_MDC_SIZE = 7

const H5VL_NATIVE_FILE_GET_SIZE = 8

const H5VL_NATIVE_FILE_GET_VFD_HANDLE = 9

const H5VL_NATIVE_FILE_RESET_MDC_HIT_RATE = 10

const H5VL_NATIVE_FILE_SET_MDC_CONFIG = 11

const H5VL_NATIVE_FILE_GET_METADATA_READ_RETRY_INFO = 12

const H5VL_NATIVE_FILE_START_SWMR_WRITE = 13

const H5VL_NATIVE_FILE_START_MDC_LOGGING = 14

const H5VL_NATIVE_FILE_STOP_MDC_LOGGING = 15

const H5VL_NATIVE_FILE_GET_MDC_LOGGING_STATUS = 16

const H5VL_NATIVE_FILE_FORMAT_CONVERT = 17

const H5VL_NATIVE_FILE_RESET_PAGE_BUFFERING_STATS = 18

const H5VL_NATIVE_FILE_GET_PAGE_BUFFERING_STATS = 19

const H5VL_NATIVE_FILE_GET_MDC_IMAGE_INFO = 20

const H5VL_NATIVE_FILE_GET_EOA = 21

const H5VL_NATIVE_FILE_INCR_FILESIZE = 22

const H5VL_NATIVE_FILE_SET_LIBVER_BOUNDS = 23

const H5VL_NATIVE_FILE_GET_MIN_DSET_OHDR_FLAG = 24

const H5VL_NATIVE_FILE_SET_MIN_DSET_OHDR_FLAG = 25

const H5VL_NATIVE_FILE_GET_MPI_ATOMICITY = 26

const H5VL_NATIVE_FILE_SET_MPI_ATOMICITY = 27

const H5VL_NATIVE_FILE_POST_OPEN = 28

const H5VL_NATIVE_GROUP_ITERATE_OLD = 0

const H5VL_NATIVE_GROUP_GET_OBJINFO = 1

const H5VL_NATIVE_OBJECT_GET_COMMENT = 0

const H5VL_NATIVE_OBJECT_SET_COMMENT = 1

const H5VL_NATIVE_OBJECT_DISABLE_MDC_FLUSHES = 2

const H5VL_NATIVE_OBJECT_ENABLE_MDC_FLUSHES = 3

const H5VL_NATIVE_OBJECT_ARE_MDC_FLUSHES_DISABLED = 4

const H5VL_NATIVE_OBJECT_GET_NATIVE_INFO = 5

const H5FD_CORE = H5FD_core_init()

const H5FD_DIRECT = H5I_INVALID_HID

const H5FD_FAMILY = H5FD_family_init()

const H5FD_HDFS = H5I_INVALID_HID

const H5FD__CURR_HDFS_FAPL_T_VERSION = 1

const H5FD__HDFS_NODE_NAME_SPACE = 128

const H5FD__HDFS_USER_NAME_SPACE = 128

const H5FD__HDFS_KERB_CACHE_PATH_SPACE = 128

const H5FD_LOG = H5FD_log_init()

const H5FD_LOG_TRUNCATE = 0x00000001

const H5FD_LOG_META_IO = H5FD_LOG_TRUNCATE

const H5FD_LOG_LOC_READ = 0x00000002

const H5FD_LOG_LOC_WRITE = 0x00000004

const H5FD_LOG_LOC_SEEK = 0x00000008

const H5FD_LOG_LOC_IO = (H5FD_LOG_LOC_READ | H5FD_LOG_LOC_WRITE) | H5FD_LOG_LOC_SEEK

const H5FD_LOG_FILE_READ = 0x00000010

const H5FD_LOG_FILE_WRITE = 0x00000020

const H5FD_LOG_FILE_IO = H5FD_LOG_FILE_READ | H5FD_LOG_FILE_WRITE

const H5FD_LOG_FLAVOR = 0x00000040

const H5FD_LOG_NUM_READ = 0x00000080

const H5FD_LOG_NUM_WRITE = 0x00000100

const H5FD_LOG_NUM_SEEK = 0x00000200

const H5FD_LOG_NUM_TRUNCATE = 0x00000400

const H5FD_LOG_NUM_IO = ((H5FD_LOG_NUM_READ | H5FD_LOG_NUM_WRITE) | H5FD_LOG_NUM_SEEK) | H5FD_LOG_NUM_TRUNCATE

const H5FD_LOG_TIME_OPEN = 0x00000800

const H5FD_LOG_TIME_STAT = 0x00001000

const H5FD_LOG_TIME_READ = 0x00002000

const H5FD_LOG_TIME_WRITE = 0x00004000

const H5FD_LOG_TIME_SEEK = 0x00008000

const H5FD_LOG_TIME_TRUNCATE = 0x00010000

const H5FD_LOG_TIME_CLOSE = 0x00020000

const H5FD_LOG_TIME_IO = (((((H5FD_LOG_TIME_OPEN | H5FD_LOG_TIME_STAT) | H5FD_LOG_TIME_READ) | H5FD_LOG_TIME_WRITE) | H5FD_LOG_TIME_SEEK) | H5FD_LOG_TIME_TRUNCATE) | H5FD_LOG_TIME_CLOSE

const H5FD_LOG_ALLOC = 0x00040000

const H5FD_LOG_FREE = 0x00080000

const H5FD_LOG_ALL = ((((((H5FD_LOG_FREE | H5FD_LOG_ALLOC) | H5FD_LOG_TIME_IO) | H5FD_LOG_NUM_IO) | H5FD_LOG_FLAVOR) | H5FD_LOG_FILE_IO) | H5FD_LOG_LOC_IO) | H5FD_LOG_META_IO

const H5FD_MIRROR = H5I_INAVLID_HID

const H5D_ONE_LINK_CHUNK_IO_THRESHOLD = 0

const H5D_MULTI_CHUNK_IO_COL_THRESHOLD = 60

const H5FD_MPIO = H5I_INVALID_HID

const H5FD_MULTI = H5FD_multi_init()

const H5FD_ROS3 = H5I_INVALID_HID

const H5FD_SEC2 = H5FD_sec2_init()

const H5FD_SPLITTER = H5FD_splitter_init()

const H5FD_CURR_SPLITTER_VFD_CONFIG_VERSION = 1

const H5FD_SPLITTER_PATH_MAX = 4096

const H5FD_SPLITTER_MAGIC = 0x2b916880

const H5FD_STDIO = H5FD_stdio_init()

const H5FD_WINDOWS = H5FD_sec2_init()

const H5VL_PASSTHRU = H5VL_pass_through_register()

const H5VL_PASSTHRU_NAME = "pass_through"

const H5VL_PASSTHRU_VALUE = 505

const H5VL_PASSTHRU_VERSION = 0

# exports
const PREFIXES = ["H5"]
for name in names(@__MODULE__; all=true), prefix in PREFIXES
    if startswith(string(name), prefix)
        @eval export $name
    end
end

end # module
