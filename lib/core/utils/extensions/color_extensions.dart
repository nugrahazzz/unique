part of 'global_extensions.dart';

class ColorExtension extends Color {
  ///change hex to Color
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  ColorExtension(final String hexColor) : super(_getColorFromHex(hexColor));
}
