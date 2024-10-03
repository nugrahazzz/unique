part of 'global_functions.dart';

///coloring system (Status and Mavigation) Bar
void changeBarColor({required Color statusBarColor, required Color navBarColor}) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: statusBarColor, //top bar color
    statusBarIconBrightness: (statusBarColor != AppColors.white) ? Brightness.light : Brightness.dark, //top bar icons
    systemNavigationBarColor: navBarColor, //bottom bar color
    systemNavigationBarIconBrightness: (navBarColor != AppColors.white) ? Brightness.light : Brightness.dark, //bottom bar icons
  ));
}
