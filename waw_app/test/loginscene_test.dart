import 'package:flutter_test/flutter_test.dart';
import 'package:waw_app/Managers/ConnectionManager.dart';
import 'package:waw_app/Models/User.dart';
import 'package:waw_app/Utility/Constants.dart';

void main() {
  test('Testing user login', () async {
    String url = BASE_URL + ENDPOINT_AUTH;
    print(url);

    final conn = ConnectionManager();
    final result = await conn.loginUserWith('shamma@big-bang.ae', '12345678');

    expect(
      result.status,
      true,
      reason: 'response should return body if successful',
    );

    final user = User.fromJSON(result.data as Map<String, dynamic>);

    expect(
      user,
      isNotNull,
      reason: 'Could not convert map into User class',
    );
  });
}
