import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waw_app/Views/CampaignView.dart';

class HomeScene extends StatefulWidget {
  static const SceneName = 'HomeScene';

  @override
  _HomeSceneState createState() => _HomeSceneState();
}

class _HomeSceneState extends State<HomeScene>
    with AutomaticKeepAliveClientMixin<HomeScene> {
  MediaQueryData mediaQuery;
  final double containerWidthRatio = 0.75;
  final double flyerCardWidthRatio = 0.25;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (mediaQuery == null) {
      mediaQuery = MediaQuery.of(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(250, 247, 250, 1),
        child: CampaignView(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
