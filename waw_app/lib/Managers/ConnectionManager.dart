import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:waw_app/Models/ApiResponse.dart';
import 'package:waw_app/Utility/Constants.dart';

class ConnectionManager {
  Client http;

  ConnectionManager() {
    http = Client();
  }

  ApiResponse get offlineErrorReponse => ApiResponse(
        data: null,
        status: false,
        message: 'Please check your internet connection and try again.',
        code: 0,
      );

  Future<ApiResponse> loginUserWith(String email, String password) async {
    final url = BASE_URL + ENDPOINT_AUTH;

    final body = {'email': email, 'password': password};

    final header = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept-Language': 'en',
    };

    try {
      final response = await http.post(url, body: body, headers: header);

      final json = jsonDecode(response.body);

      return ApiResponse.fromJSON(json);
    } on Exception {
      return offlineErrorReponse;
    }
  }

  Future<ApiResponse> getCampaigns() async {
    final url = BASE_URL + ENDPOINT_CAMPAIGN;

    final headers = {
      'Accept-Language': 'en',
      'Authorization': 'Bearer 2|z5FbuwFBPZCsMBvDLVgbZe3joCF1nNJXKgPVNOPq'
    };

    try {
      final response = await http.get(url, headers: headers);
      final json = jsonDecode(response.body);

      return ApiResponse.fromJSON(json);
    } on Exception {
      return offlineErrorReponse;
    }
  }
}
