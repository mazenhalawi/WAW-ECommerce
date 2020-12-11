import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waw_app/Blocs/WishlistBloc.dart';

class WishlistScene extends StatefulWidget {
  static const SceneName = 'WishlistScene';

  @override
  _WishlistSceneState createState() => _WishlistSceneState();
}

class _WishlistSceneState extends State<WishlistScene>
    with AutomaticKeepAliveClientMixin<WishlistScene> {
  WishlistBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_bloc == null) {
      _bloc = Provider.of<WishlistBloc>(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(
            'Number of items in Wish List is \n\n${_bloc.listCount.toString()}'),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
