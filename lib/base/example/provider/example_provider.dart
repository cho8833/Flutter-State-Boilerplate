import 'package:pf_flutter_template/base/example/model/example_model.dart';
import 'package:pf_flutter_template/base/provider/base_provider.dart';

abstract class ExampleProvider extends BaseProvider<List<ExampleModel>> {

  Future<void> testGetData();
}