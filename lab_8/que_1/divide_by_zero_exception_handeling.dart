import 'dart:io';

void main() {
  print("Enter the value of the A :");
  int? a = int.tryParse(stdin.readLineSync()!);

  print("Enter the value of the B :");
  int? b = int.tryParse(stdin.readLineSync()!);

  try {

    int result = a! ~/ b!;
    print('The result of the division operaiton is  : ${result}');
  }
  catch(e) {
    print("Hey, Error occurred : ${e} ");
  }
}
