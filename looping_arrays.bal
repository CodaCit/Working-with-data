
import ballerina/io;

public function main() {
    string[] fruits = ["Apple", "Banana", "Cherry"];

    foreach string fruit in fruits {
        io:println(fruit); // Output each fruit
    }
}
