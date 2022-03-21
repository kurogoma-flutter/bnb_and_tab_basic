import '../../utils/import.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              height: 80,
              child: const DrawerHeader(
                child: Text(
                  'Header',
                  style: optionStyle,
                ),
                decoration: BoxDecoration(
                  color: Colors.purpleAccent,
                ),
              ),
            ),
            const ListTile(
              title: Text(
                'Home',
                style: optionStyle,
              ),
              trailing: Icon(Icons.home),
            ),
            const ListTile(
              title: Text(
                'Business',
                style: optionStyle,
              ),
              trailing: Icon(Icons.business),
            ),
            const ListTile(
              title: Text(
                'school',
                style: optionStyle,
              ),
              trailing: Icon(Icons.school),
            ),
          ],
        ),
      ),
    );
  }
}
