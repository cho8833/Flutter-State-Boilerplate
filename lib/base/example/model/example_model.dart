import 'package:pf_flutter_template/base/model/base_model.dart';


class ExampleModel implements BaseModel {
  ExampleModel(this.example);

  final String example;
  @override
  Map<String, dynamic> toJson(BaseModel baseModel) {
    return <String, dynamic> {
      "example": example
    };
  }

  factory ExampleModel.fromJson(Map<String, dynamic> json) {
    return ExampleModel(json["example"]);
  }
}