
import ballerina/io;

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
