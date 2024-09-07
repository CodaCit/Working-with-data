
import ballerina/io;

public function main() {
    try {
        int result = check divide(10, 0); // This will return an error
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
