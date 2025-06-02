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

void main(){

  Student s1 = new Student('Volt', 04, 19);
  s1.display();

}