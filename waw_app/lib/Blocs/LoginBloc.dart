import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:waw_app/Enums/ResultStatus.dart';
import 'package:waw_app/Managers/ConnectionManager.dart';
import 'package:waw_app/Models/Result.dart';

class LoginBloc extends ChangeNotifier {
  final _loginController = StreamController<Result>();
  final _connManager = ConnectionManager();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Stream<Result> get loginStream$ => _loginController.stream;

  void loginUserWithEmail(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    final response = await _connManager.loginUserWith(email, password);

    if (response.status == true) {
      //TODO: register user with UserManager singleton
      _loginController.sink.add(Result(status: ResultStatus.SUCCESS));
    } else {
      _loginController.addError(
        Result(status: ResultStatus.FAILURE, message: response.message),
      );
    }

    _isLoading = false;
    notifyListeners();
  }

  void closeStreams() {
    _loginController.close();
  }
}
