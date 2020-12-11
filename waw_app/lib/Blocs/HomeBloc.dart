import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:waw_app/Enums/ResultStatus.dart';
import 'package:waw_app/Managers/ConnectionManager.dart';
import 'package:waw_app/Models/Campaign.dart';

class HomeBloc with ChangeNotifier {
  final connManager = ConnectionManager();
  final _downloadController = StreamController<Map<String, dynamic>>();
  final _campaignController = StreamController<List<Campaign>>();

  Stream<List<Campaign>> get campaign$ => _campaignController.stream;

  HomeBloc() {
    _downloadController.stream
        .transform(_mapToCampaignTransformer)
        .pipe(_campaignController);
  }

  void getCampaigns() async {
    final result = await connManager.getCampaigns();
    if (result.status == ResultStatus.SUCCESS && result.hasData) {
      try {
        _downloadController.add(result.data);
        return;
      } on Exception {
        //Handle bad data received from server
        print(result.message ?? 'Possible bad data received from server.');
      }
    }

    _downloadController.addError(result.message ??
        'An unidentified error has occurred, please try again later.');
  }

  StreamTransformer<Map<String, dynamic>, List<Campaign>>
      get _mapToCampaignTransformer => StreamTransformer.fromHandlers(
          handleData: (Map<String, dynamic> data, sink) {
            final campaigns = (data as List<dynamic>)
                .map((e) => Campaign.fromJSON(e))
                .toList();
            sink.add(campaigns);
          },
          handleError: (error, stacktrace, sink) {});

  void dispose() {
    _downloadController.close();
    _campaignController.close();
  }
}
