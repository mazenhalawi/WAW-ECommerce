import 'package:waw_app/Models/User.dart';

class UserManager {
  User _currentUser;

  static UserManager current = UserManager._();

  UserManager._();

  initialize(User user) {
    _currentUser = user;
  }

  int get ID => _currentUser.id;

  String get fullName =>
      _currentUser.firstName + ' ' + (_currentUser.lastName ?? '');

  String get token => _currentUser.token;
}
