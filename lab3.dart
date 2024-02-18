class Student {
  String firstName;
  String lastName;
  double averageGrade;

  Student({required this.firstName, required this.lastName, required this.averageGrade});
}

class StudentJournal {
  List<Student> students = [];

  void addStudent(Student student) {
    students.add(student);
  }

  void removeStudent(String firstName, String lastName) {
    students.removeWhere((student) => student.firstName == firstName && student.lastName == lastName);
  }

  void displayAllStudents() {
    students.forEach((student) {
      print('Name: ${student.firstName} ${student.lastName}, GPA: ${student.averageGrade}');
    });
  }

  void listStudentsDescendingOrder() {
    students.sort((a, b) => b.averageGrade.compareTo(a.averageGrade));
  }

  double averageScore() {
    double totalScore = students.fold(0, (sum, student) => sum + student.averageGrade);
    return totalScore / students.length;
  }

  Student getStudentWithHighestGPA() {
    listStudentsDescendingOrder();
    return students.isNotEmpty ? students.first : throw Exception('No students in the journal.');
  }
}

void main() {
  StudentJournal journal = StudentJournal();

  // Example Usage:
  journal.addStudent(Student(firstName: 'John', lastName: 'Doe', averageGrade: 3.8));
  journal.addStudent(Student(firstName: 'Jane', lastName: 'Smith', averageGrade: 4.0));

  journal.displayAllStudents();

  print('Average Score: ${journal.averageScore()}');
  print('Student with the Highest GPA: ${journal.getStudentWithHighestGPA().firstName}');
}
