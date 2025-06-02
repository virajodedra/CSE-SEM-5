class MainClass{

  void demo(){
    print("Mehtod called by (MAIN CLASS) . . . .  . . . . ");
  }

}


class SubClass extends MainClass{

  @override
  void demo(){
    super.demo();
    print("Method called by (SUB CLASS) . . . . . . .");
  }

}

void main(){

  SubClass s1 = new SubClass();
  s1.demo();
}