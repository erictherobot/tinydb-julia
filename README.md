# TinyDB Julia

An extremely simple database written in the Julia Programming Language. This is a very rudimentary database and lacks many features you would expect in a production-ready system, such as indexing for fast lookups, transactions, concurrency control, error handling, data integrity checks, and more. It is intended to be used for small projects where you need a database but don't want to deal with the overhead of setting up a full-fledged database.

## Installation

Since this is a simple project, there is no installation process per se. You just need to clone the repository and ensure you have Julia installed on your system.

```bash
git clone https://github.com/erictherobot/tinydb-julia.git
```

## Usage

This project provides a `TinyDB` struct that represents the database and `store` and `retrieve` functions to interact with the database.

Here is a basic example:

```julia
include("src/TinyDB.jl")

# create a new database
db = TinyDB("mydb.txt")

# store a key-value pair in the database
store(db, "Hello", "World")

# retrieve the value for a given key
println(retrieve(db, "Hello"))  # prints "World"
```

The database is stored in a text file. The file format is very simple: each line contains a key-value pair separated by a colon. For example, the following file contains two key-value pairs:

## Running the Example

To run the example, use the following command:

```bash
julia example.jl
```

This will create a database file called `mydb.txt` and store the key-value pair `"Hello": "World"` in the database. It will then retrieve the value for the key `"Hello"` and print it to the console.

## Tests

This project includes a small set of tests. You can run the tests with the following command:

```bash
julia test/runtests.jl
```

which should produce the following output:

```bash
Test Summary: | Pass  Total  Time
TinyDB Tests  |    3      3  0.1s
```

These tests verify basic functionality such as storing and retrieving key-value pairs, and overwriting existing keys with new values. They also test that the database file is created if it does not already exist.

## Future Work

While this project is intentionally simple, there are many ways it will be extended:

- Add error handling: Currently, if an error occurs during a file operation, the program will crash. It would be better to catch these errors and handle them gracefully.
- Support more data types: Right now, this database can only store strings. It would be useful to support other data types, such as integers, floats, and booleans.
- Indexing: To improve lookup speed, an index could be added. This would be especially beneficial for large databases.
- Transactions: Adding support for transactions would make the database more robust and allow for complex operations that involve multiple reads and writes.
- Concurrency control: If multiple processes are accessing the database at the same time, there is a risk of data corruption. Adding concurrency control would prevent this.
- Data integrity checks: It would be useful to add some sort of checksum to the database file to ensure that it has not been corrupted.
- More tests: The test suite could be expanded to cover more functionality and edge cases.
- Benchmarks: It would be interesting to compare the performance of this database to other databases.
- Documentation: This project could benefit from more documentation, including a description of the database format and how to use the database.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Author

[Eric David Smith](https://ericdavidsmith.com)
