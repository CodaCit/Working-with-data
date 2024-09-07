
import ballerina/io;

type Student record {
    string name;
    string grade;
    string subject;
};

public function main() {
    Student student = { name: "Shen", grade: "A", subject: "Computer Science" };
    io:println(student.name); // Output: Shen
}
