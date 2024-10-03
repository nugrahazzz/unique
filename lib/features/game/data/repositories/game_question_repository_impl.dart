import 'package:dartz/dartz.dart';
import 'package:unique/core/utils/error/error_handler.dart';
import 'package:unique/core/utils/error/failure.dart';
import 'package:unique/features/game/data/data_source/game_question_local_data_source.dart';
import 'package:unique/features/game/data/models/game_question_model.dart';
import 'package:unique/features/game/domain/entities/game_question_entity.dart';
import 'package:unique/features/game/domain/repositories/game_question_repository.dart';

class GameQuestionRepositoryImpl implements GameQuestionRepository {
  final GameQuestionLocalDataSource localDataSource;

  GameQuestionRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<GameQuestion>>> getAllQuestion() async {
    try {
      final List<GameQuestionModel> result = await localDataSource.getAllQuestion();
      return Right(result.map((GameQuestionModel model) => model.toEntity()).toList());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

}
