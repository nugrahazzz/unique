import 'dart:math' as math;
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import 'package:unique/core/component/widgets.dart';
import 'package:unique/core/constant/styles/colors.dart';
import 'package:unique/core/utils/extensions/global_extensions.dart';
import 'package:unique/core/utils/functions/global_functions.dart';
import 'package:unique/features/game/domain/entities/game_question_entity.dart';
import 'package:unique/features/game/presentation/controller/game_question_controller.dart';
import 'package:unique/features/game/presentation/widgets/horizontal_slider_thumb.dart';
import 'package:unique/features/game/presentation/widgets/vertical_slider_thumb.dart';

class GameQuestionPage extends GetView<GameQuestionController> {
  const GameQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color1,
      body: SafeArea(
        child: DoubleBack(
          // Handle double back press to exit the game
          onFirstBackPress: (context) {
            showCustomSnackBar(
                title: "Press “back” again", description: "To leave this app");
          },
          waitForSecondBackPress: 3,
          child: controller.obx(
            (List<GameQuestion> state) => SingleChildScrollView(
              child: Column(
                children: [
                  _buildProgressIndicator(
                    currentQuestionIndex: controller.currentQuestionIndex.value,
                  ),
                  _buildCustomHeader(), // Build the custom header
                  SizedBox(height: 6.0.wp), // Build the progress indicator
                  _buildCurrentQuestion(), // Display the current question
                  SizedBox(height: 4.0.wp),

                  // Container for the grid and sliders
                  SizedBox(
                    height: 100.0.wp,
                    width: 100.0.wp,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(13.0.wp),
                          child: _buildGrid(), // Call the existing grid method
                        ),
                        // Vertical sliders
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 7.0.wp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildVerticalSlider(0.5, true),
                              _buildVerticalSlider(1.5, false),
                            ],
                          ),
                        ),
                        // Horizontal sliders
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 7.0.wp),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildHorizontalSlider(rotationAngle: math.pi),
                              _buildHorizontalSlider(
                                  rotationAngle: math.pi * 2),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0.wp),

                  // Submit Button
                  CustomButton(
                    width: 50.0.wp,
                    function: () => controller.submitAnswer(),
                    // Call submitAnswer method
                    onlyIcon: true,
                    icons: const Icon(Icons.check, color: Colors.green),
                    color: AppColors.color3,
                  ),
                ],
              ),
            ),
            onLoading: const CustomLoading(),
            // Show loading indicator while data is loading
            onEmpty: const CustomEmpty(),
            // Show when there are no questions
            onError: (String? error) => CustomError(
              errorMessage: error.toString(), // Display error message
              function: controller.onInit,
            ),
          ),
        ),
      ),
    );
  }

  // Custom Header replacing AppBar
  Widget _buildCustomHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: AppColors.color3,
      height: 15.0.wp, // Height similar to AppBar
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Reset Game Button
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.grey),
            onPressed: controller.resetGame, // Reset the game
          ),
          // Star Icons Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildStarIcon(controller.starsCount.value >= 1),
              SizedBox(width: 2.0.wp),
              _buildStarIcon(controller.starsCount.value == 2),
            ],
          ),
          // Forward Icon Button
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              color: (controller.canSwitchQuestion.value == true)
                  ? Colors.green
                  : Colors.grey,
            ),
            onPressed: () {
              if (controller.canSwitchQuestion.value == true) {
                controller.switchQuestion();
              }
            }, // Reset the game on forward press
          ),
        ],
      ),
    );
  }

  // Progress Indicator
  Widget _buildProgressIndicator({required int currentQuestionIndex}) {
    return Container(
        height: 4.0.wp, // Tinggi progress bar
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple,
              Colors.deepPurple,
              Colors.blue,
              Colors.lightBlue,
            ],
            stops: [0.0, 0.3, 0.6, 1.0],
          ),
        ),
        child: SimpleAnimationProgressBar(
          height: 4.0.wp,
          width: 100.0.wp,
          backgroundColor: AppColors.color3,
          foregrondColor: AppColors.transparent,
          ratio: (currentQuestionIndex * 0.1).toDouble(),
          direction: Axis.horizontal,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: const Duration(seconds: 2),
          gradientColor: const LinearGradient(
              colors: [Colors.purple, Colors.deepPurple, Colors.blue]),
          // boxShadow: const [
          //   BoxShadow(
          //     color: Colors.pink,
          //     offset: Offset(
          //       5.0,
          //       5.0,
          //     ),
          //     blurRadius: 10.0,
          //     spreadRadius: 2.0,
          //   ),
          // ],
        ));
  }

  // Current Question Display
  Widget _buildCurrentQuestion() {
    final currentQuestion =
        controller.state[controller.currentQuestionIndex.value];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          // Display numerator
          Text(
            currentQuestion.numerator.toString(),
            style: const TextStyle(fontSize: 24, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(width: 10.0.wp, child: const Divider()),
          // Display denominator
          Text(
            currentQuestion.denominator.toString(),
            style: const TextStyle(fontSize: 24, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Horizontal Slider Builder
  Widget _buildHorizontalSlider({required double rotationAngle}) {
    return RotatedBox(
      quarterTurns: 2,
      child: SliderTheme(
        data: SliderTheme.of(Get.context!).copyWith(
          activeTrackColor: AppColors.color1,
          inactiveTrackColor: AppColors.color1,
          thumbShape: HorizontalSliderThumb(
            thumbRadius: 17.0,
            sliderValue: controller.horizontalSlider.value,
            rotationAngle: rotationAngle,
          ),
          valueIndicatorTextStyle: const TextStyle(color: Colors.white),
          showValueIndicator: ShowValueIndicator.always,
        ),
        child: Slider(
          value: controller.horizontalSlider.value,
          onChanged: (newValue) {
            controller.horizontalSlider.value = newValue;
          },
          min: 1,
          max: 10,
        ),
      ),
    );
  }

  // Vertical Slider Builder
  Widget _buildVerticalSlider(double rotationAngle, bool flipX) {
    return RotatedBox(
      quarterTurns: 1,
      child: SliderTheme(
        data: SliderTheme.of(Get.context!).copyWith(
          activeTrackColor: Colors.transparent,
          inactiveTrackColor: Colors.transparent,
          thumbShape: VerticalSliderThumb(
            thumbRadius: 17.0,
            sliderValue: controller.verticalSlider.value,
            rotationAngle: math.pi * rotationAngle,
            flipX: flipX,
          ),
          valueIndicatorTextStyle: const TextStyle(color: Colors.white),
          showValueIndicator: ShowValueIndicator.always,
        ),
        child: Slider(
          value: 11 - controller.verticalSlider.value,
          onChanged: (newValue) {
            controller.verticalSlider.value = 11 - newValue;
            controller.update(); // Force the UI to rebuild
          },
          min: 1,
          max: 10,
        ),
      ),
    );
  }

  // Grid Builder
  Widget _buildGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        double gridWidth = constraints.maxWidth;
        double gridHeight = constraints.maxHeight;

        double itemWidth = gridWidth / controller.columnCount;
        double itemHeight = gridHeight / controller.rowCount;

        return GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: controller.columnCount,
            childAspectRatio: itemWidth / itemHeight,
          ),
          itemCount: controller.rowCount * controller.columnCount,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => controller.toggleContainer(index),
              child: Obx(() {
                return Container(
                  margin: const EdgeInsets.all(0.2),
                  decoration: BoxDecoration(
                    color: controller.tappedContainers.contains(index)
                        ? Colors.cyan
                        : AppColors.color4,
                    border: Border.all(color: AppColors.color1),
                  ),
                  child: const SizedBox.shrink(),
                );
              }),
            );
          },
        );
      },
    );
  }

  // Method to build star icon with border
  Widget _buildStarIcon(bool isFilled) {
    return SizedBox(
      width: 10.0.wp,
      height: 10.0.wp,
      child: Icon(
        Icons.star,
        size: 8.0.wp, // Ukuran ikon bintang
        color: isFilled
            ? Colors.green
            : Colors.red, // Transparan jika tidak terisi
      ),
    );
  }
}
