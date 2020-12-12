import 'package:waw_app/Enums/ResultStatus.dart';
import 'package:waw_app/Models/Result.dart';

class ApiResponse {
  final data;
  final bool status;
  final String message;
  final int code;

  ApiResponse({this.data, this.status, this.message, this.code});

  factory ApiResponse.fromJSON(Map<String, dynamic> json) {
    String message = '';
    if (json['message'] is Map) {
      final messages = json['message'] as Map<String, dynamic>;
      final msg = (messages[messages.keys.first] as List<dynamic>).first;
      message = msg;
    } else if (json['message'] is String) {
      message = json['message'];
    } else {
      message =
          'An unidentified error has occurred. Please check your connection and try again later.';
    }

    return ApiResponse(
        data: json['data'],
        status: json['status'],
        message: message,
        code: json['code']);
  }

  bool get isSuccessful => status;

  bool get hasData => data != null;

  Result toResult() {
    return Result(
        status: this.status ? ResultStatus.SUCCESS : ResultStatus.FAILURE,
        data: this.hasData ? data : null,
        message: this.message);
  }
}
