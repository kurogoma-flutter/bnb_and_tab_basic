import '../../utils/import.dart';

class WrapPage extends StatelessWidget {
  const WrapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wrap'),
      ),
      body: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.spaceEvenly,
        spacing: 5,
        children: [
          box(),
          box(),
          box(),
          box(),
          box(),
          box(),
          box(),
        ],
      ),
    );
  }

  Container box() {
    return Container(
      margin: EdgeInsets.all(10),
      height: 100,
      width: 100,
      color: Colors.cyan,
    );
  }
}
