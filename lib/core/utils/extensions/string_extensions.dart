part of 'global_extensions.dart';

extension StringExtension on String {
  ///change String to boolean
  bool parseToBool() {
    if ((this).toLowerCase() == 'true') {
      return true;
    } else if ((this).toLowerCase() == 'false') {
      return false;
    }

    throw '"$this" can not be parsed to boolean.';
  }

  ///check email
  bool isEmail() {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(this);
  }

  ///capitalize first text
  String get capitalizeFirst => length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';
}
