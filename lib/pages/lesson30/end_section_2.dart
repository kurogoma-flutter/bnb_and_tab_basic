import '../../utils/import.dart';

class EndSection2 extends StatefulWidget {
  const EndSection2({Key? key}) : super(key: key);

  @override
  _EndSection2State createState() => _EndSection2State();
}

class _EndSection2State extends State<EndSection2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('中間課題2'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            PlaneText(context, 'Problem2', 30),
            SizedBox(
              height: 380,
              child: ListView.builder(
                shrinkWrap: true, // Columnのなかで用いる場合に必須
                scrollDirection: Axis.horizontal, // 横方向のリスト
                itemCount: 15,
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
                                      color: Color(0xFFF0F0F0),
                                      blurRadius: 10.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(1, 1),
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
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
