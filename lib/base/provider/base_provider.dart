
import 'package:flutter/material.dart';
import 'package:pf_flutter_template/base/status.dart';

abstract class BaseProvider<T> with ChangeNotifier {

  Status _status = Status.idle;

  String? _errorMessage;

  Status get status => _status;
  String? get errorMessage => _errorMessage;

  T get data;

  // StatusBuilder 의 loadingBuilder 호출
  void notifyLoading() {
    _status = Status.loading;
    notifyListeners();
  }

  // StatusBuilder 의 SuccessBuilder 호출
  void notifySuccess() {
    _status = Status.success;
    notifyListeners();
  }

  // StatusBuilder 의 FailBuilder 호출
  void notifyFail({String? errorMessage}) {
    _status = Status.fail;
    _errorMessage = errorMessage;
    notifyListeners();
  }
}