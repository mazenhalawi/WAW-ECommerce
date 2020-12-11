import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waw_app/Blocs/HomeBloc.dart';
import 'package:waw_app/Views/CampaignView.dart';

class HomeScene extends StatefulWidget {
  static const SceneName = 'HomeScene';

  @override
  _HomeSceneState createState() => _HomeSceneState();
}

class _HomeSceneState extends State<HomeScene>
    with AutomaticKeepAliveClientMixin<HomeScene> {
  HomeBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_bloc == null) {
      _bloc = Provider.of<HomeBloc>(context);
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
