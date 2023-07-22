using Test
include("../src/TinyDB.jl")

@testset "TinyDB Tests" begin
    # Create a new database
    db = TinyDB("testdb.txt")

    # Define test data
    key1, value1 = "Hello", "World"
    key2, value2 = "Julia", "Programming"

    # Test storing and retrieving a single key-value pair
    @testset "store and retrieve" begin
        store(db, key1, value1)
        @test retrieve(db, key1) == value1
    end

    # Test overwriting an existing key
    @testset "overwrite key" begin
        # Store a new value under the same key
        new_value = "Universe"
        store(db, key1, new_value)
        # The old value should be overwritten
        @test retrieve(db, key1) == new_value
    end

    # Test retrieving a key that doesn't exist
    @testset "retrieve non-existent key" begin
        @test retrieve(db, "Non-existent key") == nothing
    end

    # Cleanup the test database file
    rm("testdb.txt")
end
