import 'package:waw_app/Models/User.dart';

class UserManager {
  User _currentUser;

  static UserManager current = UserManager._();

  UserManager._();
}
