import 'dart:convert';

import 'package:pf_flutter_template/base/custom_exception.dart';
import 'package:pf_flutter_template/base/example/model/example_model.dart';

/// need to edit BaseModel.fromJson
/// if you have to parse ServerResponse<T extends BaseModel> or ServerResponse<List<T extends BaseModel>>
abstract class BaseModel {
  factory BaseModel.fromJson(Map<String, dynamic> json) {
    if (json.containsKey("example")) {
      return ExampleModel.fromJson(json);
    }
    throw JsonParsingException(message: "JsonParsingException: ${jsonEncode(json)}");
  }

  Map<String, dynamic> toJson(BaseModel baseModel);
}