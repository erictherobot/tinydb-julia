struct TinyDB
    filename::String
end

function store(db::TinyDB, key::String, value::String)
    data = Dict{String,String}()

    # Check if file exists before trying to read
    if isfile(db.filename)
        open(db.filename, "r") do file
            for line in eachline(file)
                (k, v) = split(line, "\t")
                data[k] = v
            end
        end
    end

    # Add or update the key-value pair
    data[key] = value

    # Overwrite the file with the updated data
    open(db.filename, "w") do file
        for (k, v) in data
            println(file, "$k\t$v")
        end
    end
end

function retrieve(db::TinyDB, key::String)
    lines = readlines(db.filename)
    for line in lines
        k, v = split(line, '\t')
        if k == key
            return v
        end
    end
    return nothing
end
