part of 'global_extensions.dart';

extension PercentSized on double {
  ///get height device (1/100)
  double get hp => (Get.height * ((this) / 100));

  ///get width device (1/100)
  double get wp => (Get.width * ((this) / 100));
}
