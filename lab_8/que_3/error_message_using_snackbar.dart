import '../../lab_2/card_view/import_export.dart';

class ErrorMessageUsingSnackbar extends StatefulWidget {
  const ErrorMessageUsingSnackbar({super.key});

  @override
  State<ErrorMessageUsingSnackbar> createState() => _ErrorMessageUsingSnackbarState();
}

class _ErrorMessageUsingSnackbarState extends State<ErrorMessageUsingSnackbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Showing the error message using the Snackbar... '),
      ),
      body:  Center(
        child: ElevatedButton(onPressed: () {

        }, child: Text('Click !!')),
      ),
    );
  }

  void showError(String message){

  }
}
