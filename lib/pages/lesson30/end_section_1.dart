import '../../utils/import.dart';

class EndSection extends StatelessWidget {
  const EndSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('中間課題1'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            PlaneText(context, 'Problem1', 25),
            PlaneText(context, 'horizontal list', 20),
            SizedBox(
              height: 270,
              child: ListView.builder(
                shrinkWrap: true, // Columnのなかで用いる場合に必須
                scrollDirection: Axis.horizontal, // 横方向のリスト
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) {
                  /// TODO : Rowではない用いるべきウィジェットは？
                  return Row(
                    // Rowなどで囲い、SizedBoxを用いればサイズ調整可能
                    children: [
                      SizedBox(
                        width: 250,
                        height: 250,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.pink,
                            ),
                          ),
                        ),
                      ),
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
