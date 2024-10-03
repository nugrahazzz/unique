import 'package:unique/features/game/domain/entities/game_question_entity.dart';

class GameQuestionModel extends GameQuestion {
  GameQuestionModel({required super.numerator, required super.denominator});

  factory GameQuestionModel.fromJson(Map<String, dynamic> json) {
    return GameQuestionModel(
      numerator: json['numerator'],
      denominator: json['denominator'],
    );
  }

  GameQuestion toEntity() {
    return GameQuestion(
      numerator: numerator.toInt(),
      denominator: denominator.toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'numerator': numerator,
      'denominator': denominator,
    };
  }
}
