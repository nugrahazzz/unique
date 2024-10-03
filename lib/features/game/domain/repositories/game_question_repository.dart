import 'package:dartz/dartz.dart';
import 'package:unique/core/utils/error/failure.dart';
import 'package:unique/features/game/domain/entities/game_question_entity.dart';

abstract class GameQuestionRepository {
  Future<Either<Failure, List<GameQuestion>>> getAllQuestion();

}
