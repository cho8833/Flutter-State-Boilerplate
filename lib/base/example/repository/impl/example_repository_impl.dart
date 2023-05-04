
import 'package:pf_flutter_template/base/example/model/example_model.dart';
import 'package:pf_flutter_template/base/example/repository/example_repository.dart';

class ExampleRepositoryImpl extends ExampleRepository {
  ExampleRepositoryImpl(super.client);

  @override
  Future<List<ExampleModel>> loadData() async {
    await Future.delayed(const Duration(seconds: 1));
    return Future.value([ExampleModel("example")]);
  }
}