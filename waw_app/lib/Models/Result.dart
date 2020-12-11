import 'package:flutter/foundation.dart';
import 'package:waw_app/Enums/ResultStatus.dart';

class Result<T> {
  final ResultStatus status;
  final T data;
  final String message;

  Result({@required this.status, this.data, this.message});

  bool get hasData => data != null;
}
