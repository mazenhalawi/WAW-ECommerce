import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waw_app/Blocs/CartBloc.dart';

class CartScene extends StatefulWidget {
  static const SceneName = 'CartScene';

  @override
  _CartSceneState createState() => _CartSceneState();
}

class _CartSceneState extends State<CartScene>
    with AutomaticKeepAliveClientMixin<CartScene> {
  CartBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_bloc == null) {
      _bloc = Provider.of<CartBloc>(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(
            'number of items in cart: ${_bloc.numberOFItemsInCart.toString()}'),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
