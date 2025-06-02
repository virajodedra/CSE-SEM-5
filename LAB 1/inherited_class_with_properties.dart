class Student{
  String name;
  int rollNumber;
  int age;

  Student(this.name, this.rollNumber, this.age);


  void display(){
    print("Student's name is : $name");
    print("Student's rollNumber is : $rollNumber");
    print("Student's age is : $age");

  }

}

class Basic extends Student{
  Basic(super.name, super.rollNumber, super.age);

  void student_info(){
    super.display();
  }

}

void main(){

  // Student s1 = new Student('Volt', 04, 19);
  // s1.display();

  Basic b1 = new Basic('Volt', 04, 19);
  b1.student_info();


}