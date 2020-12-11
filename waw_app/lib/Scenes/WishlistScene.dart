import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waw_app/Blocs/WishlistBloc.dart';
import 'package:waw_app/Views/WishlistView.dart';

class WishlistScene extends StatefulWidget {
  static const SceneName = 'WishlistScene';

  @override
  _WishlistSceneState createState() => _WishlistSceneState();
}

class _WishlistSceneState extends State<WishlistScene>
    with AutomaticKeepAliveClientMixin<WishlistScene> {
  final imageCardRatio = 0.25;
  final cardWidthRatio = 0.9;
  final cardHeightRatio = 0.7;

  WishlistBloc _bloc;
  MediaQueryData _mediaQuery;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_bloc == null) {
      _bloc = Provider.of<WishlistBloc>(context);
    }
    if (_mediaQuery == null) {
      _mediaQuery = MediaQuery.of(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final campaigns = Provider.of<WishlistBloc>(context).wishListed;

    return Scaffold(
      body: Container(
        child: ListView(
          children: campaigns.map((e) => WishlistView(campaign: e)).toList(),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
