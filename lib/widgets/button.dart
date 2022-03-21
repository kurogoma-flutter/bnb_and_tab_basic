import '../utils/import.dart';

class ButtonSmall extends SizedBox {
  ButtonSmall(BuildContext context, String text, String route, Size size, {Key? key})
      : super(
          key: key,
          width: size.width * 0.3,
          height: size.height * 0.05,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, route);
            },
            child: Text(text),
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
            ),
          ),
        );
}

class ButtonMedium extends SizedBox {
  ButtonMedium(BuildContext context, String text, String route, Size size, {Key? key})
      : super(
          key: key,
          width: size.width * 0.4,
          height: size.height * 0.06,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, route);
            },
            child: Text(
              text,
              style: const TextStyle(fontSize: 18),
            ),
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
            ),
          ),
        );
}

class ButtonLarge extends SizedBox {
  ButtonLarge(BuildContext context, String text, String route, Size size, {Key? key})
      : super(
          key: key,
          width: size.width * 0.6,
          height: size.height * 0.08,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, route);
            },
            child: Text(
              text,
              style: const TextStyle(fontSize: 20),
            ),
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
            ),
          ),
        );
}
