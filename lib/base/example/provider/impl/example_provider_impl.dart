import 'package:pf_flutter_template/base/example/model/example_model.dart';
import 'package:pf_flutter_template/base/example/provider/example_provider.dart';
import 'package:pf_flutter_template/base/example/repository/example_repository.dart';

class ExampleProviderImpl extends ExampleProvider {
  ExampleProviderImpl(this._repository);

  final ExampleRepository _repository;

  List<ExampleModel> _examples = [];

  @override
  Future<void> testGetData() async {
    notifyLoading();
    _repository.loadData().then((value) {
      _examples = value;
      notifySuccess();
    }).catchError((e) {
      notifyFail(errorMessage: e.toString());
    });
  }

  @override
  List<ExampleModel> get data => _examples;
}