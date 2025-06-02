abstract class MainClass{

  void display();

}

class SubClass extends MainClass{

  @override
  void display(){
    print(" ::: BODY Completed by CHILD class ::::: ");
  }
}

void main(){

  SubClass s1 = new SubClass();
  s1.display();
}