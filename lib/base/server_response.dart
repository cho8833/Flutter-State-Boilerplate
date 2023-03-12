import 'dart:convert';

import 'package:pf_flutter_template/base/model/base_model.dart';

class ServerResponse<T> {
  String? message;
  int status;
  String? code;

  /// List<T> or T
  T? data;
  bool error;

  ServerResponse(
      {required this.message,
        required this.status,
        this.code,
        this.data,
        required this.error});

  static T? _dataFromJson<T>(Object? json) {
    // parsing 단일 데이터
    if (json is Map<String, dynamic>) {
      return BaseModel.fromJson(json) as T;
    }
    // parsing 여러개 데이터
    else if (json is List) {
      return json.map((e) => BaseModel.fromJson(e)).toList() as T;
    }
    return null;
  }

  factory ServerResponse.fromResponse(List<int> bodyBytes) {

    Map<String, dynamic> json = jsonDecode(utf8.decode(bodyBytes));

    return ServerResponse<T>(
      message: json['message'] as String?,
      status: json['status'] as int,
      code: json['code'] as String?,
      data: ServerResponse._dataFromJson(json['data']),
      error: json['error'] as bool,
    );
  }
}

