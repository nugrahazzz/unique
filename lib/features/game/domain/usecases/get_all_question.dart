import 'package:dartz/dartz.dart';
import 'package:unique/core/utils/error/failure.dart';
import 'package:unique/core/utils/helper/use_case.dart';
import 'package:unique/features/game/domain/entities/game_question_entity.dart';
import 'package:unique/features/game/domain/repositories/game_question_repository.dart';

class GetAllQuestionUseCase implements UseCase<List<GameQuestion>, NoParams> {
  final GameQuestionRepository repository;

  GetAllQuestionUseCase(this.repository);

  @override
  Future<Either<Failure, List<GameQuestion>>> call(NoParams params) {
    return repository.getAllQuestion();
  }
}
