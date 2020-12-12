import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waw_app/Blocs/OrderBloc.dart';
import 'package:waw_app/Utility/wawapp_icons.dart';
import 'package:waw_app/Views/CircularButton.dart';

class QuantityAdjuster extends StatefulWidget {
  final int availableQty;
  final int campID;
  final bool hideDropShadow;
  final double width;
  final double height;

  QuantityAdjuster({
    @required this.availableQty,
    @required this.campID,
    this.hideDropShadow = false,
    this.width = 40,
    this.height = 125,
  });

  @override
  _QuantityAdjusterState createState() => _QuantityAdjusterState();
}

class _QuantityAdjusterState extends State<QuantityAdjuster> {
  int _currentQty = 1;
  OrderBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_bloc == null) {
      _bloc = Provider.of<OrderBloc>(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: widget.hideDropShadow
          ? null
          : BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 5,
                    spreadRadius: 0.2,
                    color: Colors.black45)
              ],
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircularButton(
              radius: widget.width / 2.5,
              icon: Icon(
                WAWApp.plus,
                color: Colors.white,
                size: widget.width / 3,
              ),
              onPressed: () {
                _currentQty = _bloc.orders[widget.campID] ?? _currentQty;
                if (_currentQty >= widget.availableQty) return;
                setState(() {
                  _currentQty += 1;
                });
                _bloc.updateOrders(
                    campaignID: widget.campID.toString(),
                    quantity: _currentQty);
              },
            ),
            SizedBox(
              width: widget.width - 10,
              height: widget.height * 0.15, //20
              child: FittedBox(
                child: Text(
                  _bloc.orders[widget.campID.toString()] == null
                      ? '1'
                      : _bloc.orders[widget.campID.toString()].toString(),
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
              ),
            ),
            CircularButton(
              radius: widget.width / 2.5,
              icon: Icon(
                WAWApp.minus,
                color: Colors.white,
                size: widget.width / 3,
              ),
              onPressed: () {
                _currentQty =
                    _bloc.orders[widget.campID.toString()] ?? _currentQty;
                if (this._currentQty <= 1) return;
                setState(() {
                  this._currentQty -= 1;
                });
                _bloc.updateOrders(
                    campaignID: widget.campID.toString(),
                    quantity: _currentQty);
              },
            ),
          ],
        ),
      ),
    );
  }
}
