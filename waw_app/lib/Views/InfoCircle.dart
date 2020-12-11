import 'package:flutter/material.dart';
import 'package:waw_app/Utility/Constants.dart';

class InfoCircle extends StatelessWidget {
  final int sold;
  final int stock;

  InfoCircle({@required this.sold, @required this.stock});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            offset: Offset(-1, 1),
            color: Colors.black54,
            blurRadius: 4,
          )
        ],
      ),
      width: 70,
      height: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                sold.toString(),
                style: TextStyle(
                    color: kPRIMARY_COLOR,
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                    letterSpacing: -2),
              )),
          FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'SOLD',
                style: TextStyle(fontSize: 10, color: Colors.black54),
              )),
          FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'out of',
                style: TextStyle(fontSize: 10),
              )),
          FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                stock.toString(),
                style: TextStyle(fontSize: 11),
              )),
        ],
      ),
    );
  }
}
