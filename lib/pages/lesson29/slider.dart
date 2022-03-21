import '../../utils/import.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider'),
      ),
      body: Slider(
        value: _currentSliderValue,
        min: 0,
        max: 100,
        divisions: 20, // 何分割するのか
        label: _currentSliderValue.round().toString(),
        onChanged: (double value) {
          setState(
            () {
              _currentSliderValue = value;
            },
          );
        },
      ),
    );
  }
}
