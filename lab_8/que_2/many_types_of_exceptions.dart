import 'dart:io';

void main() {
  try {
    // Format Exeception
    print("Enter  a number : ");
    String? a = stdin.readLineSync();

    int num = int.parse(a!);
    print("You Entererd the number : ${num}");
  }
  on FormatException {
    print("FormatException: Please enter a valid number.");
  }

  try{
    //Socket Exeception
    print(' Loading ... connecting to the server !!');
    Socket.connect("VirServer.address" , 4000).then((vir) {
      print('Connected to the Volt Server !!');
      vir.destroy();
    },);
  }
  on SocketException {
    print("Socket Exeception : could not conect to the server ............");
  }


  // Generic exception handling (optional catch-all)
  try {
    throw Exception("A general exception occurred!");
  } catch (e) {
    print(" General Exception: $e");
  }

}