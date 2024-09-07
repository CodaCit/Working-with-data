
import ballerina/io;

public function main() {
    int[] numbers = [1, 2, 3, 4, 5]; // An array of integers
    io:println(numbers[0]); // Access the first element: 1

    // Modifying an array element
    numbers[1] = 10;
    io:println(numbers[1]); // Output: 10
}
