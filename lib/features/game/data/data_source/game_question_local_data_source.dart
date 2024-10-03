import 'package:unique/core/utils/enums/data_source.dart';
import 'package:unique/core/utils/error/error_handler.dart';
import 'package:unique/features/game/data/models/game_question_model.dart';

abstract class GameQuestionLocalDataSource {
  Future<List<GameQuestionModel>> getAllQuestion();
}

class GameQuestionLocalDataSourceImpl implements GameQuestionLocalDataSource {

  GameQuestionLocalDataSourceImpl();

  @override
  Future<List<GameQuestionModel>> getAllQuestion() async {
    try {
      return [
        GameQuestionModel(numerator: 2, denominator: 10),
        GameQuestionModel(numerator: 3, denominator: 12),
        GameQuestionModel(numerator: 6, denominator: 50),
        GameQuestionModel(numerator: 9, denominator: 81),
        GameQuestionModel(numerator: 5, denominator: 20),
        GameQuestionModel(numerator: 4, denominator: 40),
        GameQuestionModel(numerator: 7, denominator: 49),
        GameQuestionModel(numerator: 8, denominator: 24),
        GameQuestionModel(numerator: 10, denominator: 60),
        GameQuestionModel(numerator: 4, denominator: 40),

      ];
    } catch (e) {
      throw DataSource.custom.setFailure(e.toString());
    }
  }


}
