import 'package:get/get.dart';
import 'package:unique/features/game/data/data_source/game_question_local_data_source.dart';
import 'package:unique/features/game/data/repositories/game_question_repository_impl.dart';
import 'package:unique/features/game/domain/repositories/game_question_repository.dart';
import 'package:unique/features/game/domain/usecases/get_all_question.dart';
import 'package:unique/features/game/presentation/controller/game_question_controller.dart';

class GameQuestionBinding implements Binding {
  @override
  List<Bind> dependencies() {
    return [
      //Controller
      Bind.lazyPut(
        () => GameQuestionController(getAllQuestionUseCase: Get.find()),
      ),

      //Datasource
      Bind.lazyPut<GameQuestionLocalDataSource>(
        () => GameQuestionLocalDataSourceImpl(),
      ),
      //Repository
      Bind.lazyPut<GameQuestionRepository>(
        () => GameQuestionRepositoryImpl(
          localDataSource: Get.find(),
        ),
      ),
      //Usecase
      Bind.lazyPut(() => GetAllQuestionUseCase(Get.find())),
    ];
  }
}
