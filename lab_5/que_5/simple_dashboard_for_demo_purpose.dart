import '../../lab_2/card_view/import_export.dart';

class SimpleDashboardForDemoPurpose extends StatefulWidget {
  const SimpleDashboardForDemoPurpose({super.key});

  @override
  State<SimpleDashboardForDemoPurpose> createState() => _SimpleDashboardForDemoPurposeState();
}

class _SimpleDashboardForDemoPurposeState extends State<SimpleDashboardForDemoPurpose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Center(child: Text('Welcome to your Dashboard!', style: TextStyle(color: Colors.blueGrey, fontSize: 25, fontWeight: FontWeight.bold),), ),
    );
  }
}
