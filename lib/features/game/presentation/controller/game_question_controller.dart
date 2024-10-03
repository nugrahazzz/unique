import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:unique/core/constant/styles/colors.dart';
import 'package:unique/core/utils/error/failure.dart';
import 'package:unique/core/utils/functions/global_functions.dart';
import 'package:unique/core/utils/functions/show_dialog_lottie.dart';
import 'package:unique/core/utils/helper/use_case.dart';
import 'package:unique/features/game/domain/entities/game_question_entity.dart';
import 'package:unique/features/game/domain/usecases/get_all_question.dart';

class GameQuestionController extends GetxController
    with StateMixin<List<GameQuestion>> {
  final GetAllQuestionUseCase getAllQuestionUseCase;

  GameQuestionController({required this.getAllQuestionUseCase});

  RxInt currentQuestionIndex = 1.obs;
  RxDouble verticalSlider = 1.0.obs;
  RxDouble horizontalSlider = 1.0.obs;
  RxList<int> tappedContainers = <int>[].obs;
  RxBool canSwitchQuestion = false.obs;
  RxInt starsCount = 2.obs;

  @override
  void onInit() {
    super.onInit();
    futurize(() => getAllQuestionC());
    changeBarColor(
        statusBarColor: AppColors.color3,
        navBarColor: AppColors.color1
    );
  }

  Future<List<GameQuestion>> getAllQuestionC() async {
    final Either<Failure, List<GameQuestion>> result =
    await getAllQuestionUseCase(NoParams());

    return result.fold(
          (failure) => throw "${failure.message} \n (error code: ${failure.code})",
          (data) => data,
    );
  }

  void toggleContainer(int id) => tappedContainers.contains(id)
      ? tappedContainers.remove(id)
      : tappedContainers.add(id);

  int get rowCount => verticalSlider.value.round();
  int get columnCount => horizontalSlider.value.round();

  bool isAnswerCorrect() {
    final question = state[currentQuestionIndex.value];
    return tappedContainers.length == question.numerator &&
        (verticalSlider.value + horizontalSlider.value) == question.denominator;
  }

  void checkAnswer() {
    if (isAnswerCorrect()) {
      canSwitchQuestion.value = true;
    } else {
      starsCount.value--;
    }
    update();
  }

  void moveToNextQuestion() {
    if (currentQuestionIndex.value < state.length - 1) {
      currentQuestionIndex.value++;
      resetSlidersAndContainers();
    } else {
      showCustomSnackBar(
        title: "The question has run out",
        description: "You've answered all the questions",
      );
    }
    update();
  }

  void submitAnswer() {
    if (!canSwitchQuestion.value && tappedContainers.isNotEmpty) {
      final currentQuestion = state[currentQuestionIndex.value];

      if (kDebugMode) {
        print("Numerator: ${currentQuestion.numerator}");
        print("Denominator: ${currentQuestion.denominator}");
        print("User Numerator: ${tappedContainers.length}");
        print("User Denominator: ${rowCount * columnCount}");
      }

      bool isAnswerNumeratorCorrect =
          tappedContainers.length == currentQuestion.numerator;
      bool isAnswerDenominatorCorrect =
          rowCount * columnCount == currentQuestion.denominator;

      if (starsCount.value < 1) {
        showCustomSnackBar(
          title: "The chance to try has run out",
          description: "Please perform a game reset",
        );
      } else if (isAnswerNumeratorCorrect && isAnswerDenominatorCorrect) {
        resetSlidersAndContainers();
        showCongratulationDialog();
        canSwitchQuestion.value = true;
      } else {
        starsCount.value--;
      }
      update();
    } else {
      showCustomSnackBar(
        title: canSwitchQuestion.value ? "You have answered" : "Please give your answer",
        description: canSwitchQuestion.value
            ? "Please continue with the next question"
            : "You haven't answered this question",
        //            : "You've answered all the questions",
      );
    }
  }

  void switchQuestion() {
    if (canSwitchQuestion.value) {
      moveToNextQuestion();
    }
  }

  void resetGame() {
    starsCount.value = 2;
    currentQuestionIndex.value = 0;
    resetSlidersAndContainers();
    canSwitchQuestion.value = false;
    update();
  }

  void resetSlidersAndContainers() {
    tappedContainers.clear();
    verticalSlider.value = 1;
    horizontalSlider.value = 1;
    canSwitchQuestion.value = false;
  }
}
