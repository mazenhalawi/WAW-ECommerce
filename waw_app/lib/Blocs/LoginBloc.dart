import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:waw_app/Enums/ResultStatus.dart';
import 'package:waw_app/Managers/ConnectionManager.dart';
import 'package:waw_app/Managers/UserManager.dart';
import 'package:waw_app/Models/Result.dart';
import 'package:waw_app/Models/User.dart';

class LoginBloc extends ChangeNotifier {
  final _loginController = StreamController<Result>();
  final _connManager = ConnectionManager();

  Stream<Result> get loginStream$ => _loginController.stream;

  Future<void> loginUserWithEmail(String email, String password) async {
    final result = await _connManager.loginUserWith(email, password);

    if (result.status == ResultStatus.SUCCESS && result.hasData) {
      final loggedUser = User.fromJSON(result.data);

      if (loggedUser != null) {
        UserManager.current.initialize(loggedUser);
        _loginController.sink.add(Result(status: ResultStatus.SUCCESS));
        return;
      }
    }

    _loginController.addError(
      Result(status: ResultStatus.FAILURE, message: result.message),
    );
  }

  void closeStreams() {
    _loginController.close();
  }
}
