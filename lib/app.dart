import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unique/config/routes/pages.dart';
import 'package:unique/config/routes/routes.dart';
import 'package:unique/core/constant/styles/colors.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      //
      color: AppColors.bgDark,
      defaultTransition: Transition.fadeIn,
      //
      getPages: Pages.getPages,
      initialRoute: Routes.gamePage,
      //
    );
  }
}
