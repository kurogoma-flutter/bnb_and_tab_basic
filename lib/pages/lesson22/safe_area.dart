import '../../utils/import.dart';

class SafeAreaPage extends StatelessWidget {
  const SafeAreaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Safe Area'),
      ),
      body: SafeArea(
        child: Container(
          /// heightを最大にしても白い余白ができることを確認
          height: MediaQuery.of(context).size.height,
          color: Colors.red,
        ),
      ),
    );
  }
}
