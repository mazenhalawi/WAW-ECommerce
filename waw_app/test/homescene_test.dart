import 'package:flutter_test/flutter_test.dart';
import 'package:waw_app/Managers/ConnectionManager.dart';
import 'package:waw_app/Models/Campaign.dart';
import 'package:waw_app/Utility/Constants.dart';

void main() {
  test('Testing campaign retrieval', () async {
    String url = BASE_URL + ENDPOINT_CAMPAIGN;
    print(url);

    final conn = ConnectionManager();
    final response = await conn.getCampaigns();

    expect(
      response.status,
      true,
      reason: 'response should return body if successful',
    );

    final campaigns = (response.data as List<dynamic>)
        .map((e) => Campaign.fromJSON(e))
        .toList();

    expect(
      campaigns.length,
      isNonZero,
      reason: 'Could not convert map into Campaign class',
    );
  });
}
