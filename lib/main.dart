import 'utils/import.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '練習問題',
      theme: ThemeData.from(
        colorScheme: const ColorScheme.light(primary: Colors.deepPurpleAccent),
      ),
      routes: {
        '/home': (context) => const HomePage(),
        '/safeArea': (context) => const SafeAreaPage(),
        '/listView': (context) => const ListViewPage(),
        '/listView/2': (context) => const ListViewPage2(),
        '/tabBar': (context) => const TabBarPage(),
        '/bottomNavigation': (context) => const BottomNavigationPage(),
        '/drawer': (context) => const DrawerPage(),
        '/image': (context) => const ImagePage(),
        '/image/2': (context) => const ImagePage2(),
        '/wrap': (context) => const WrapPage(),
        '/slider': (context) => const SliderPage(),
        '/endSection': (context) => const EndSection(),
        '/endSection/2': (context) => const EndSection2(),
        '/endSection/3': (context) => const EndSection3(),
        '/endSection/4': (context) => const EndSection4(),
      },
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('練習問題'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SizedBox(
            width: size.width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      PlaneText(context, '22.SafeArea', 28),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ButtonLarge(context, 'SafeArea', '/safeArea', size),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      PlaneText(context, '23.ListView', 28),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ButtonMedium(context, 'ListView-1', '/listView', size),
                          ButtonMedium(context, 'ListView-2', '/listView/2', size),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      PlaneText(context, '24.TabBar', 28),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ButtonLarge(context, 'TabBar', '/tabBar', size),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      PlaneText(context, '25.bottomNavigationBar', 28),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ButtonLarge(context, 'bottomNavigation', '/bottomNavigation', size),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      PlaneText(context, '26.Drawer', 24),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ButtonLarge(context, 'Drawer', '/drawer', size),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      PlaneText(context, '27.Image', 24),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ButtonMedium(context, 'Image-1', '/image', size),
                          ButtonMedium(context, 'Image-2', '/image/2', size),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      PlaneText(context, '28.Wrap', 24),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ButtonLarge(context, 'Wrap', '/wrap', size),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      PlaneText(context, '29.Slider', 24),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ButtonLarge(context, 'Slider', '/slider', size),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      PlaneText(context, '30.章末問題', 24),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ButtonMedium(context, '章末 ①', '/endSection', size),
                          ButtonMedium(context, '章末 ②', '/endSection/2', size),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ButtonMedium(context, '章末 ③', '/endSection/3', size),
                          ButtonMedium(context, '章末 ④', '/endSection/4', size),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
