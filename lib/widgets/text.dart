import '../utils/import.dart';

// 黒字のデフォルトテキスト
class PlaneText extends Text {
  PlaneText(BuildContext context, String text, double fontSize)
      : super(
          text,
          maxLines: 2,
          style: TextStyle(
            fontSize: fontSize,
          ),
        );
}

// 色・サイズが指定できるテキスト
class ColorText extends Text {
  ColorText(BuildContext context, String text, double fontSize, Color color)
      : super(
          text,
          maxLines: 2,
          style: TextStyle(
            fontSize: fontSize,
            color: color,
          ),
        );
}

// 太字テキスト
class BoldText extends Text {
  BoldText(BuildContext context, String text, double fontSize)
      : super(
          text,
          maxLines: 2,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        );
}
