import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unique/config/routes/routes.dart';
import 'package:unique/features/game/presentation/binding/game_question_binding.dart';
import 'package:unique/features/game/presentation/page/game_question_page.dart';

class Pages {
  static final List<GetPage> getPages = [
    GetPage(
      name: Routes.gamePage,
      page: () => const GameQuestionPage(),
      binding: GameQuestionBinding(),
      transition: Transition.fadeIn,
    ),

  ];

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(
            "Not Found",
          ),
        ),
      ),
    );
  }
}
