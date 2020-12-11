import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:waw_app/Enums/ResultStatus.dart';
import 'package:waw_app/Models/ApiResponse.dart';
import 'package:waw_app/Models/Result.dart';
import 'package:waw_app/Utility/Constants.dart';

class ConnectionManager {
  Client http;

  ConnectionManager() {
    http = Client();
  }

  Result get offlineErrorReponse => Result(
        status: ResultStatus.FAILURE,
        data: null,
        message: 'Please check your internet connection and try again.',
      );

  Future<Result> loginUserWith(String email, String password) async {
    final url = BASE_URL + ENDPOINT_AUTH;

    final body = {'email': email, 'password': password};

    final header = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept-Language': 'en',
    };

    try {
      final response = await http.post(url, body: body, headers: header);

      final json = jsonDecode(response.body);

      final apiResponse = ApiResponse.fromJSON(json);
      Result result = apiResponse.toResult();
      return Result(
          status: result.status,
          data: result.data['user'],
          message: result.message);
    } on Exception {
      return offlineErrorReponse;
    }
  }

  Future<Result> getCampaigns() async {
    final url = BASE_URL + ENDPOINT_CAMPAIGN;

    //TODO: change Authorization value to token from UserManager.current
    final headers = {
      'Accept-Language': 'en',
      'Authorization': 'Bearer 2|z5FbuwFBPZCsMBvDLVgbZe3joCF1nNJXKgPVNOPq'
    };

    try {
      final response = await http.get(url, headers: headers);
      final json = jsonDecode(response.body);

      final apiResponse = ApiResponse.fromJSON(json);
      return apiResponse.toResult();
    } on Exception {
      return offlineErrorReponse;
    }
  }
}
