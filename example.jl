# Include the TinyDB module from your file
include("src/TinyDB.jl")

# Create a new database
db = TinyDB("mydb.txt")

# Store a value
store(db, "Hello", "World")

# Retrieve and print a value
println(retrieve(db, "Hello"))  # Should print "World"