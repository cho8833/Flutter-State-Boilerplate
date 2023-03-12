import 'package:pf_flutter_template/base/example/model/example_model.dart';
import 'package:pf_flutter_template/base/repository/base_repository.dart';

abstract class ExampleRepository extends BaseRepository {
  ExampleRepository(super.client);

  Future<List<ExampleModel>> loadData();
}