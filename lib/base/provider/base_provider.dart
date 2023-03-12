
import 'package:flutter/material.dart';
import 'package:pf_flutter_template/base/status.dart';

abstract class BaseProvider<T> with ChangeNotifier {

  Status _status = Status.idle;

  String? _errorMessage;

  Status get status => _status;
  String? get errorMessage => _errorMessage;

  T get data;

  void notifyLoading() {
    _status = Status.loading;
    notifyListeners();
  }

  void notifySuccess() {
    _status = Status.success;
    notifyListeners();
  }

  void notifyFail({String? errorMessage}) {
    _status = Status.fail;
    _errorMessage = errorMessage;
    notifyListeners();
  }
}