# Generates bind.jl
# To run execute `julia --project=. bind_generator.jl` in this directory

using Clang.Generators
using HDF5_jll

include_dir = normpath(HDF5_jll.artifact_dir, "include")
#clang_dir = joinpath(include_dir, "clang-c")

# wrapper generator options
options = load_options(joinpath(@__DIR__, "bind_generator.toml"))

# add compiler flags, e.g. "-DXXXXXXXXX"
args = get_default_args()
push!(args, "-I$include_dir -DH5_BUILT_AS_DYNAMIC_LIB")

headers = [normpath(include_dir, "hdf5.h")]
#headers = [joinpath(clang_dir, header) for header in readdir(clang_dir) if endswith(header, ".h")]
# there is also an experimental `detect_headers` function for auto-detecting top-level headers in the directory
# headers = detect_headers(clang_dir, args)

# create context
ctx = create_context(headers, args, options)


# run generator
#build!(ctx)
build!(ctx, BUILDSTAGE_NO_PRINTING)

function rewrite!(e::Expr)
    if e.head == :function
        body = e.args[2]
        for s in body.args
            if s.head == :call && s.args[1] == :ccall
                b = ccall_to_bind(s)
                e.head = b.head
                e.args = b.args
            end
        end
    end
end

function rewrite!(dag::ExprDAG)
    for node in get_nodes(dag)
        for expr in get_exprs(node)
            rewrite!(expr)
        end
    end
end


function ccall_to_bind(e::Expr)
    ## Extraction the information from the ccall
    func = e.args[2].args[1].value
    retval = e.args[3]
    types = e.args[4].args
    args = e.args[5:end]

    ## Reformat the information
    try
        m = match(r"([A-Z0-9]+)(.*)", string(func))
        s = lowercase(m.captures[1]) * "_" * m.captures[2]
        func = Symbol(s)
    catch err
        @error err backtrace()
    end
    arg_type_pairs = [:($a::$t)  for (a,t) in zip(args, types)]

    ## Build the macro expression
    template = :(@bind f()::ret "Error unspecified")
    # Remove line annotation
    template.args[2] = Expr(:nothing)
    template.args[3].args[2] = retval
    template.args[3].args[1].args[1] = func
    append!(template.args[3].args[1].args, arg_type_pairs)
    template.args[4] = "Error in " * string(func) * " (not annotated)"
    template
end

rewrite!(ctx.dag)

build!(ctx, BUILDSTAGE_PRINTING_ONLY)

