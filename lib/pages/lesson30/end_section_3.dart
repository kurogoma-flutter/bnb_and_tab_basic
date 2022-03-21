import 'dart:async';

import 'package:intl/intl.dart';

import '../../utils/import.dart';

class EndSection3 extends StatefulWidget {
  const EndSection3({Key? key}) : super(key: key);

  @override
  _EndSection3State createState() => _EndSection3State();
}

class _EndSection3State extends State<EndSection3> {
  int _selectedIndex = 0;

  //TextStyleをあらかじめ統一しておく。
  //後から変更しやすい、コード量が減るメリットがある
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  //ウィジェットのリストを作成
  static const List<Widget> _navigationList = <Widget>[
    IncreasePanel(),
    SelectImage(),
    Clock(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('中間課題３'),
      ),
      body: Center(
        child: _navigationList.elementAt(_selectedIndex), //n番目のウィジェットが呼び出される。
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart_sharp),
            label: 'part1',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books_rounded),
            label: 'part2',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'part3',
            backgroundColor: Colors.black,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        type: BottomNavigationBarType.shifting, // アイコンを動かしたい場合
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

///
/// 問題3-1 : ボタンを押したらパネルが増える画面
///
class IncreasePanel extends StatefulWidget {
  const IncreasePanel({Key? key}) : super(key: key);

  @override
  _IncreasePanelState createState() => _IncreasePanelState();
}

class _IncreasePanelState extends State<IncreasePanel> {
  /// 項目数を管理するウィジェット
  int _panelCount = 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          PlaneText(context, 'Problem3', 30),
          SizedBox(
            height: 380,
            child: ListView.builder(
              shrinkWrap: true, // Columnのなかで用いる場合に必須
              scrollDirection: Axis.horizontal, // 横方向のリスト
              itemCount: _panelCount,
              itemBuilder: (BuildContext context, int index) {
                /// リストの形式はSection1,2と同様
                return Column(
                  // Rowなどで囲い、SizedBoxを用いればサイズ調整可能
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        /// 説明エリア
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 260,
                              height: 120,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 60,
                                  ),
                                  BoldText(context, 'picture', 20),
                                  ColorText(context, 'No. ${(index + 1).toString()}', 16, Colors.grey)
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        ///　画像エリア
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 50),
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            width: 250,
                            height: 250,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/images/image1.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                _addPanel();
              },
              child: const Text('パネル追加'),
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _addPanel() {
    //関数の作成
    setState(() {
      _panelCount += 1; //_selectedIndexをindexと対応させる
    });
  }
}

///
/// 問題3-2 : いくつかの写真をスクロールできる
///
class SelectImage extends StatefulWidget {
  const SelectImage({Key? key}) : super(key: key);

  @override
  _SelectImageState createState() => _SelectImageState();
}

class _SelectImageState extends State<SelectImage> {
  // 画像リスト
  final _imageList = [
    'assets/images/genshin1.jpeg',
    'assets/images/genshin2.jpeg',
    'assets/images/genshin3.jpeg',
    'assets/images/genshin4.jpeg',
    'assets/images/genshin5.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          PlaneText(context, 'Problem3', 30),
          SizedBox(
            height: 380,
            child: ListView.builder(
              shrinkWrap: true, // Columnのなかで用いる場合に必須
              scrollDirection: Axis.horizontal, // 横方向のリスト
              itemCount: _imageList.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  // Rowなどで囲い、SizedBoxを用いればサイズ調整可能
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      width: 250,
                      height: 250,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          _imageList[index], // indexで配列から画像パスを指定
                          fit: BoxFit.cover,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

///
/// 問題3-3：現在時刻を表示
///
class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  String _time = 'Loading...';

  void initState() {
    if (mounted) {
      super.initState();
      // Timer.periodicで繰り返し処理
      Timer.periodic(const Duration(seconds: 1), _onTimer);
    }
  }

  void _onTimer(Timer timer) {
    // 現在時刻を取得する
    var now = DateTime.now();
    // 「時:分:秒」表記に文字列を変換するdateFormatを宣言する
    var dateFormat = DateFormat('yyyy/MM/dd HH:mm:ss');
    // nowをdateFormatでstringに変換する
    var timeString = dateFormat.format(now);
    setState(
      () => {
        _time = timeString,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PlaneText(
        context,
        _time,
        30,
      ),
    );
  }
}
