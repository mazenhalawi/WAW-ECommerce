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
    return Scaffold(
      body: Container(
        child: Center(
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 6,
            child: Container(
              width: _mediaQuery.size.width * 0.9,
              height: _mediaQuery.size.width * 0.6,
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
