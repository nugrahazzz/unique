part of 'global_functions.dart';

///showing snackbar
void showCustomSnackBar({required String title, required String description}) {
  Get.snackbar(
    "",
    "",
    titleText: Padding(
      padding: EdgeInsets.only(left: 3.0.wp),
      child: Text(
        title,
        style: AppTextStyles.poppinsMedium.copyWith(
          color: AppColors.white,
          fontSize: 3.2.wp,
          wordSpacing: 0.3,
          letterSpacing: 0.3,
        ),
      ),
    ),
    messageText: Padding(
      padding: EdgeInsets.only(left: 3.0.wp),
      child: Text(
        description,
        style: AppTextStyles.poppinsMedium.copyWith(
          fontSize: 2.9.wp,
          color: AppColors.white,
          wordSpacing: 0.6,
          letterSpacing: 0.6,
        ),
      ),
    ),
    shouldIconPulse: false,
    icon: Container(
      padding: EdgeInsets.only(left: 4.0.wp),
      child: Icon(
        Icons.info_outline_rounded,
        color: AppColors.white,
        size: 7.0.wp,
      ),
    ),
    isDismissible: false,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.fastOutSlowIn,
    duration: const Duration(milliseconds: 3000),
    animationDuration: const Duration(milliseconds: 750),
    margin: EdgeInsets.all(6.25.wp),
    snackPosition: SnackPosition.bottom,
    backgroundColor: Colors.blueGrey,
    colorText: AppColors.white,
  );
}
