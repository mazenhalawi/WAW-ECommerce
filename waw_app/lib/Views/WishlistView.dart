import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waw_app/Utility/Constants.dart';
import 'package:waw_app/Views/CircularButton.dart';
import 'package:waw_app/Views/CircularIndicator.dart';
import 'package:waw_app/Views/InfoCircle.dart';

import 'ImageCard.dart';

class WishlistView extends StatelessWidget {
  final imageCardRatio = 0.25;
  final cardWidthRatio = 0.9;
  final cardHeightRatio = 0.7;

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 6,
      child: Container(
        width: _mediaQuery.size.width * cardWidthRatio,
        height: _mediaQuery.size.width * cardHeightRatio,
        child: Stack(
          children: [
            Positioned(
              top: _mediaQuery.size.width *
                  (cardWidthRatio - cardHeightRatio) /
                  4,
              left: 10,
              child: GroupedItemView(_mediaQuery),
            ),
            Positioned(
              bottom: _mediaQuery.size.width *
                  (cardWidthRatio - cardHeightRatio) /
                  4,
              left: 10,
              child: GroupedItemView(_mediaQuery),
            ),
            Positioned(
              top: 30,
              right: 15,
              child: Column(
                children: [
                  CircularButton(
                      icon: Icon(
                        CupertinoIcons.cart_badge_plus,
                        size: 30,
                        color: Colors.white,
                      ),
                      radius: 20,
                      onPressed: () => print('added to cart')),
                  SizedBox(
                    height: 16,
                  ),
                  CircularButton(
                      icon: Icon(
                        Icons.delete_forever,
                        size: 30,
                        color: Colors.white,
                      ),
                      radius: 20,
                      backgroundColor: Colors.red,
                      onPressed: () => print('deleted from wish list')),
                ],
              ),
            ),
            Positioned(
              bottom: 30,
              right: 15,
              child: CircularIndicator(
                width: 95,
                height: 95,
                percentage: 0.15,
              ),
            ),
            Positioned(
              bottom: 42.5,
              right: 27.5,
              child: InfoCircle(sold: 45, stock: 212),
            ),
            Positioned(
              left: _mediaQuery.size.width * imageCardRatio + 25,
              top: _mediaQuery.size.width * cardHeightRatio / 2 - 10,
              child: Text(
                'AED 250',
                style: TextStyle(
                  color: kPRIMARY_COLOR,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget GroupedItemView(MediaQueryData _mediaQuery) {
    return Row(
      children: [
        ImageCard(
          width: _mediaQuery.size.width * imageCardRatio,
          height: _mediaQuery.size.width * imageCardRatio,
          imageLink:
              'https://wawwinner.ae/dev/public/storage/products/CL04.png',
          elevation: 0,
          backgroundColor: Colors.black12,
        ),
        SizedBox(
          width: 8,
        ),
        Container(
          height: _mediaQuery.size.width * imageCardRatio,
          width:
              _mediaQuery.size.width * (cardWidthRatio - imageCardRatio - 0.4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LineLabel(
                  text: 'Product',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black87,
                  )),
              SizedBox(
                height: 4,
              ),
              LineLabel(
                  text: 'Nike Shoes',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  )),
              SizedBox(
                height: 4,
              ),
              LineLabel(text: 'from boots category'),
            ],
          ),
        )
      ],
    );
  }

  Widget LineLabel({String text, TextStyle style}) {
    return Row(
      children: [
        Expanded(
            child: Container(
          child: FittedBox(
            alignment: Alignment.centerLeft,
            fit: BoxFit.scaleDown,
            child: Text(
              text,
              maxLines: 1,
              textAlign: TextAlign.left,
              style: style,
            ),
          ),
        )),
      ],
    );
  }
}
