import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:rxdart/subjects.dart';
import 'package:waw_app/Enums/ResultStatus.dart';
import 'package:waw_app/Managers/ConnectionManager.dart';
import 'package:waw_app/Models/Campaign.dart';

export 'package:waw_app/Models/Campaign.dart';

class HomeBloc with ChangeNotifier {
  final connManager = ConnectionManager();
  final _downloadController = BehaviorSubject<List<Map<String, dynamic>>>();
  final _campaignController = BehaviorSubject<List<Campaign>>();
  final Map<String, int> _orderQuantities = {};

  Stream<List<Campaign>> get campaign$ => _campaignController.stream;

  int quantityOrdered(int campaignID) =>
      _orderQuantities[campaignID.toString()] ?? 1;

  HomeBloc() {
    _downloadController.stream
        .transform(_mapToCampaignTransformer)
        .pipe(_campaignController);
  }

  void updateQuantityForCampaign(int campaignID, int quantity) {
    _orderQuantities[campaignID.toString()] = quantity;
  }

  Future<void> getCampaigns() async {
    final result = await connManager.getCampaigns();

    if (result.status == ResultStatus.SUCCESS && result.hasData) {
      try {
        final data =
            (result.data as List<dynamic>).cast<Map<String, dynamic>>();
        _downloadController.sink.add(data);
        return;
      } on Exception {
        //Handle bad data received from server
        print('getCampaigns failed');
        print(result.message ?? 'Possible bad data received from server.');
      }
    }

    _downloadController.addError(result.message ??
        'An unidentified error has occurred, please try again later.');
  }

  StreamTransformer<List<Map<String, dynamic>>, List<Campaign>>
      get _mapToCampaignTransformer => StreamTransformer.fromHandlers(
          handleData: (List<Map<String, dynamic>> data,
              EventSink<List<Campaign>> sink) {
            final campaigns = data.map((e) => Campaign.fromJSON(e)).toList();
            sink.add(campaigns);
          },
          handleError: (error, stacktrace, sink) {});

  void dispose() {
    _downloadController.close();
    _campaignController.close();
  }
}
