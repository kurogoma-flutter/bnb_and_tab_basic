import '../../utils/import.dart';

class EndSection4 extends StatefulWidget {
  const EndSection4({Key? key}) : super(key: key);

  @override
  _EndSection4State createState() => _EndSection4State();
}

class _EndSection4State extends State<EndSection4> {
  // BottomNavigationBarのインデックスを管理する変数
  int _bnbIndex = 0;

  /// BottomNavigationBarのページリスト
  static const List<Widget> _navigationList = <Widget>[
    SearchPage(),
    Text('Index 1: 真ん中ページ'),
    Text('Index 2: 右のページ'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _navigationList.elementAt(_bnbIndex), //bnbのn番目のウィジェットが呼び出される。
      ),
      bottomNavigationBar: BottomNavigationBar(
        /// BottomNavigationBarのアイコンリスト
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 40),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_pizza_rounded, size: 40),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(radius: 20, backgroundImage: AssetImage('assets/images/cat.jpeg')),
            label: '',
          ),
        ],

        // 選択されているインデックスの指定
        currentIndex: _bnbIndex,
        // 選択時の色指定
        selectedItemColor: Colors.blue,
        // BNBの切り替えアクションを指定
        onTap: _changeBnb,
      ),
    );
  }

  /// BottomNavigationBarをタップした時のアクション
  /// 引数に指定したindexは初期値扱いできる（タップしたアイコンのインデックスが取得できる）
  void _changeBnb(int index) {
    //関数の作成
    setState(() {
      _bnbIndex = index;
    });
  }
}

///
/// BottomNavigation:検索アイコンのページ
///
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // デフォルトのタブの位置（左から２番目）
  int _tabIndex = 1;

  /// Tabのページリスト
  static const List<Widget> _tabItems = <Widget>[
    Center(child: Text('Sample1', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold))),
    SightseeingPage(),
    Center(child: Text('Sample2', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold))),
    Center(child: Text('Sample3', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold))),
  ];

  @override
  Widget build(BuildContext context) {
    /// TabControllerを用いながらタブ制御
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          /// 戻るボタンの非活性化
          automaticallyImplyLeading: false,

          /// AppBarの段差非表示
          elevation: 0,

          /// 本体と同色に。 TODO: canvas colorなくなった？
          backgroundColor: Colors.white,
          title: const Padding(
            padding: EdgeInsets.fromLTRB(10, 30, 0, 0),
            child: Text(
              '良い旅行を！',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),

          /// iOSは自動で中央揃え、Androidは左揃えになってしまうので指定が必要
          centerTitle: false,
          bottom: PreferredSize(
            /// AppBarの高さをデフォルトから変更したい場合必要となる
            preferredSize: const Size(100, 80),
            child: TabBar(
              /// Tabのアイコンリスト
              tabs: <Widget>[
                /// 手動で切替するため、GestureDetectorでアイコン作成
                GestureDetector(
                  child: Tab(
                    icon: CircleAvatar(
                      radius: 80,
                      backgroundColor: _tabIndex == 0 ? Colors.cyanAccent : Colors.black12,
                      child: Icon(
                        Icons.airplanemode_active_outlined,
                        color: _tabIndex == 0 ? Colors.cyan : Colors.grey,
                      ),
                    ),
                  ),
                  onTap: () {
                    _changeTab(0);
                  },
                ),
                GestureDetector(
                  child: Tab(
                    icon: CircleAvatar(
                      radius: 80,
                      backgroundColor: _tabIndex == 1 ? Colors.cyanAccent : Colors.black12,
                      child: Icon(
                        Icons.hotel,
                        color: _tabIndex == 1 ? Colors.cyan : Colors.grey,
                      ),
                    ),
                  ),
                  onTap: () {
                    _changeTab(1);
                  },
                ),
                GestureDetector(
                  child: Tab(
                    icon: CircleAvatar(
                      radius: 80,
                      backgroundColor: _tabIndex == 2 ? Colors.cyanAccent : Colors.black12,
                      child: Icon(
                        Icons.directions_walk_outlined,
                        color: _tabIndex == 2 ? Colors.cyan : Colors.grey,
                      ),
                    ),
                  ),
                  onTap: () {
                    _changeTab(2);
                  },
                ),
                GestureDetector(
                  child: Tab(
                    icon: CircleAvatar(
                      radius: 80,
                      backgroundColor: _tabIndex == 3 ? Colors.cyanAccent : Colors.black12,
                      child: Icon(
                        Icons.directions_bike_outlined,
                        color: _tabIndex == 3 ? Colors.cyan : Colors.grey,
                      ),
                    ),
                  ),
                  onTap: () {
                    _changeTab(3);
                  },
                ),
              ],
            ),
          ),
        ),

        /// TODO : スワイプを検知してページ切り替えをしたい。
        body: _tabItems.elementAt(_tabIndex),
      ),
    );
  }

  /// Tab切り替えのアクション
  void _changeTab(int index) {
    //関数の作成
    setState(() {
      _tabIndex = index;
    });
  }
}

///
/// スクロール可能なViewが２つあるページ
///
class SightseeingPage extends StatefulWidget {
  const SightseeingPage({Key? key}) : super(key: key);

  @override
  _SightseeingPageState createState() => _SightseeingPageState();
}

class _SightseeingPageState extends State<SightseeingPage> {
  // 背景リスト
  final List<Map<String, String>> _whereList = [
    {
      'image': 'assets/images/venis.jpeg',
      'country': 'Italy',
      'city': 'Venis',
      'title': '3 activities',
      'explain': 'hogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogo'
    },
    {
      'image': 'assets/images/sydney.jpeg',
      'country': 'Australia',
      'city': 'Sydney',
      'title': '3 activities',
      'explain': 'hogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogo'
    },
    {
      'image': 'assets/images/paris.jpeg',
      'country': 'France',
      'city': 'Paris',
      'title': '3 activities',
      'explain': 'hogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogo'
    },
    {
      'image': 'assets/images/amsterdam.jpeg',
      'country': 'Netherlands',
      'city': 'Amsterdam',
      'title': '3 activities',
      'explain': 'hogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogo'
    }
  ];
  // ホテルリスト
  final List<Map<String, String>> _hotelList = [
    {
      'image': 'assets/images/hotel1.jpeg',
      'country': 'Italy',
      'city': 'Venis',
      'title': '3 activities',
      'explain': 'hogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogo'
    },
    {
      'image': 'assets/images/hotel2.jpeg',
      'country': 'Australia',
      'city': 'Sydney',
      'title': '3 activities',
      'explain': 'hogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogo'
    },
    {
      'image': 'assets/images/hotel3.jpeg',
      'country': 'France',
      'city': 'Paris',
      'title': '3 activities',
      'explain': 'hogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogo'
    },
    {
      'image': 'assets/images/hotel4.jpeg',
      'country': 'Netherlands',
      'city': 'Amsterdam',
      'title': '3 activities',
      'explain': 'hogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogohogo'
    }
  ];

  @override
  Widget build(BuildContext context) {
    /// スクロールできるように指定
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            /// テキストエリア
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BoldText(context, 'Where', 24),
                TextButton(
                  onPressed: () {
                    null;
                  },
                  child: const Text('全て見る', style: TextStyle(fontSize: 16, color: Colors.cyan)),
                ),
              ],
            ),

            /// 画像・説明リスト
            SizedBox(
              height: 360,
              child: ListView.builder(
                shrinkWrap: true, // Columnのなかで用いる場合に必須
                scrollDirection: Axis.horizontal, // 横方向のリスト
                itemCount: _whereList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    // Rowなどで囲い、SizedBoxを用いればサイズ調整可能
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          /// 説明エリア
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                width: 240,
                                height: 170,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 80,
                                    ),
                                    BoldText(context, _whereList[index]['title'] ?? '', 20),
                                    ColorText(context, _whereList[index]['explain'] ?? '', 16, Colors.grey),
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
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 80),
                            child: Stack(
                              alignment: AlignmentDirectional.bottomStart,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  width: 250,
                                  height: 250,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.asset(
                                      _whereList[index]['image'] ?? '', // indexで配列から画像パスを指定
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Column(
                                    children: [
                                      ColorText(
                                        context,
                                        _hotelList[index]['city'] ?? '',
                                        24,
                                        Colors.white,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.send_rounded,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                          ColorText(
                                            context,
                                            _whereList[index]['country'] ?? '',
                                            15,
                                            Colors.white,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),

            /// リスト間の余白設定
            const SizedBox(height: 30),

            /// テキストエリア
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BoldText(context, 'Hotels', 24),
                TextButton(
                  onPressed: () {
                    null;
                  },
                  child: const Text(
                    '全て見る',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.cyan,
                    ),
                  ),
                ),
              ],
            ),

            /// 画像・説明リスト
            SizedBox(
              height: 380,
              child: ListView.builder(
                shrinkWrap: true, // Columnのなかで用いる場合に必須
                scrollDirection: Axis.horizontal, // 横方向のリスト
                itemCount: _hotelList.length,
                itemBuilder: (BuildContext context, int index) {
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
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                width: 240,
                                height: 160,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 80,
                                    ),
                                    BoldText(context, _hotelList[index]['title'] ?? '', 20),
                                    ColorText(context, _hotelList[index]['explain'] ?? '', 16, Colors.grey)
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
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 80),
                            child: Stack(
                              alignment: AlignmentDirectional.bottomStart,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  width: 250,
                                  height: 250,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.asset(
                                      _hotelList[index]['image'] ?? '', // indexで配列から画像パスを指定
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Column(
                                    children: [
                                      ColorText(
                                        context,
                                        _hotelList[index]['city'] ?? '',
                                        24,
                                        Colors.white,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.send_rounded,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                          ColorText(
                                            context,
                                            _hotelList[index]['country'] ?? '',
                                            15,
                                            Colors.white,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),

            /// 戻るボタン
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('戻る'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
