class MainClass{
   static int counter = 1;
}

class Demo {

  void increment(){

    //here in below line  of code we use post increment means it firstly assign the value and after increase.
    MainClass.counter = MainClass.counter++;
  }

}

class DemoSub extends Demo {

  void increase(){
    super.increment();
  }

}



void main(){

  Demo demo = new Demo();
  demo.increment();

  DemoSub demoSub = new DemoSub();
  demoSub.increase();


  print(MainClass.counter);

}
