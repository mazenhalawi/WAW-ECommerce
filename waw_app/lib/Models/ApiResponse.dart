class ApiResponse {
  final data;
  final bool status;
  final String message;
  final int code;

  ApiResponse({this.data, this.status, this.message, this.code});

  factory ApiResponse.fromJSON(Map<String, dynamic> json) {
    return ApiResponse(
        data: json['data'],
        status: json['status'],
        message: json['message'],
        code: json['code']);
  }

  bool get isSuccessful => status;

  bool get hasData => data != null;
}
