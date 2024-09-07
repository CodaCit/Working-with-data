
# Working with Data in Ballerina

Let's continue with **working with data** in Ballerina, which includes arrays, maps, records, and error handling. These are essential data structures and concepts when building applications.

### 1. **Arrays**
An array is a collection of elements of the same type, stored in a contiguous memory location. You can access elements by their index, starting at 0.

#### Declaring and Using Arrays:
```ballerina
public function main() {
    int[] numbers = [1, 2, 3, 4, 5]; // An array of integers
    io:println(numbers[0]); // Access the first element: 1

    // Modifying an array element
    numbers[1] = 10;
    io:println(numbers[1]); // Output: 10
}
```

- `int[] numbers`: Declares an array of integers.
- Access array elements using square brackets (`[]`), e.g., `numbers[0]`.

#### Looping Through Arrays:
You can use a `foreach` loop to iterate over arrays:

```ballerina
public function main() {
    string[] fruits = ["Apple", "Banana", "Cherry"];

    foreach string fruit in fruits {
        io:println(fruit); // Output each fruit
    }
}
```

### 2. **Maps**
A map is a collection of key-value pairs where the keys are strings and the values can be of any type. Maps are useful for storing and accessing data with unique identifiers (keys).

#### Declaring and Using Maps:
```ballerina
public function main() {
    map<string> student = {
        "name": "Shen",
        "grade": "A",
        "subject": "Computer Science"
    };

    io:println(student["name"]); // Output: Shen

    // Adding a new key-value pair
    student["year"] = "2024";
    io:println(student["year"]); // Output: 2024
}
```

- `map<string>`: Declares a map where both the key and value are strings.
- Access values using the key, e.g., `student["name"]`.

#### Checking for the Existence of a Key:
You can check whether a key exists in the map using the `?` operator:

```ballerina
public function main() {
    map<string> student = { "name": "Shen", "grade": "A" };

    if student.hasKey("subject") {
        io:println("Subject exists");
    } else {
        io:println("Subject not found");
    }
}
```

### 3. **Records**
A record is a structured data type similar to a map, but with a fixed set of fields. Records are often used to represent more complex data.

#### Declaring and Using Records:
```ballerina
type Student record {
    string name;
    string grade;
    string subject;
};

public function main() {
    Student student = { name: "Shen", grade: "A", subject: "Computer Science" };
    io:println(student.name); // Output: Shen
}
```

- `record`: A record is like a map, but its fields are predefined.
- Access fields using dot notation (`.`), e.g., `student.name`.

#### Optional Fields in Records:
You can define optional fields in records by using a question mark (`?`):

```ballerina
type Student record {
    string name;
    string grade?;
};

public function main() {
    Student student = { name: "Shen" }; // grade is optional
    io:println(student.grade ?: "Grade not available");
}
```

- The `?:` operator provides a default value if the field is not set.

### 4. **Error Handling**
Ballerina has built-in support for error handling using the `error` type. You can use `try-catch` blocks to handle errors, or the `check` keyword to propagate errors.

#### Using `check` for Error Propagation:
The `check` keyword is used to call a function that may return an error. If an error occurs, the current function returns that error immediately.

```ballerina
public function main() returns error? {
    int result = check divide(10, 0); // This will return an error
    io:println(result);
}

function divide(int a, int b) returns int|error {
    if (b == 0) {
        return error("Cannot divide by zero");
    }
    return a / b;
}
```

- The `check` keyword will return the error if one occurs, skipping further execution in the current function.
- The `divide` function returns either an `int` or an `error`.

#### Using `try-catch` to Handle Errors:
You can also handle errors explicitly using `try-catch` blocks:

```ballerina
public function main() {
    int result = divide(10, 0);
    try {
        io:println(result);
    } catch error err {
        io:println("Error occurred: ", err.message());
    }
}

function divide(int a, int b) returns int|error {
    if (b == 0) {
        return error("Cannot divide by zero");
    }
    return a / b;
}
```

- `try` block executes code that might result in an error.
- `catch` block handles the error, and you can access the error message using `err.message()`.

#### Defining Custom Errors:
You can define your own error types for more specific error handling:

```ballerina
type DivisionError error<record {
    string message;
}>;

function divide(int a, int b) returns int|DivisionError {
    if (b == 0) {
        return error DivisionError("Cannot divide by zero");
    }
    return a / b;
}
```

### Summary:
- **Arrays**: Collections of elements of the same type. You can iterate through them with loops.
- **Maps**: Key-value pairs where keys are strings and values can be any type.
- **Records**: Similar to maps but with fixed, predefined fields, often used for structured data.
- **Error Handling**: Ballerina uses `check`, `try-catch`, and custom error types for robust error handling.


