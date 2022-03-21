import '../../utils/import.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _selectedIndex = 0;

  //TextStyleをあらかじめ統一しておく。
  //後から変更しやすい、コード量が減るメリットがある
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  //ウィジェットのリストを作成
  static const List<Widget> _navigationList = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigationBar'),
      ),
      body: Center(
        child: _navigationList.elementAt(_selectedIndex), //n番目のウィジェットが呼び出される。
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Colors.black,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        type: BottomNavigationBarType.shifting, // ボタン別で背景色を変えたい場合
        onTap: _onItemTapped, //ボタンが押されたときに、_onItemTappedが実行される。このとき、indexの値は受け渡される。
      ),
    );
  }

  /// タップした時のウィジェット
  void _onItemTapped(int index) {
    //関数の作成
    setState(() {
      _selectedIndex = index; //_selectedIndexをindexと対応させる
    });
  }
}
