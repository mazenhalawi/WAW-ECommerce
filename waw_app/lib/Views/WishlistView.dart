import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waw_app/Blocs/WishlistBloc.dart';
import 'package:waw_app/Models/Campaign.dart';
import 'package:waw_app/Utility/Constants.dart';
import 'package:waw_app/Views/CircularButton.dart';
import 'package:waw_app/Views/CircularIndicator.dart';
import 'package:waw_app/Views/InfoCircle.dart';

import 'ImageCard.dart';

class WishlistView extends StatelessWidget {
  final Campaign campaign;
  final imageCardRatio = 0.25;
  final cardWidthRatio = 0.9;
  final cardHeightRatio = 0.7;

  WishlistView({@required this.campaign});

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
            //Product Row (Image - Name - category)
            Positioned(
              top: _mediaQuery.size.width *
                  (cardWidthRatio - cardHeightRatio) /
                  4,
              left: 10,
              child: GroupedItemView(
                mediaQuery: _mediaQuery,
                image: campaign.productImageLink,
                name: campaign.productName,
              ),
            ),
            //Prize Row (Image - Name - category
            Positioned(
              bottom: _mediaQuery.size.width *
                  (cardWidthRatio - cardHeightRatio) /
                  4,
              left: 10,
              child: GroupedItemView(
                mediaQuery: _mediaQuery,
                image: campaign.prizeImageLink,
                name: campaign.prizeName,
              ),
            ),
            //Vertical Action Buttons : Add To Cart + Delete
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
                      //TODO: Add functionality for adding item to cart and removing it from Wishlist
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
                      onPressed: () =>
                          Provider.of<WishlistBloc>(context, listen: false)
                              .removeFromWishList(campaign: campaign)),
                ],
              ),
            ),
            //Circular Indicator View
            Positioned(
              bottom: 30,
              right: 15,
              child: CircularIndicator(
                width: 95,
                height: 95,
                percentage: campaign.qtyPercentage,
              ),
            ),
            //Circular Sales Info View
            Positioned(
              bottom: 42.5,
              right: 27.5,
              child:
                  InfoCircle(sold: campaign.qtySold, stock: campaign.qtyStock),
            ),
            //Price
            Positioned(
              left: _mediaQuery.size.width * imageCardRatio + 25,
              top: _mediaQuery.size.width * cardHeightRatio / 2 - 10,
              child: Text(
                campaign.productPriceWhole,
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

  Widget GroupedItemView(
      {@required MediaQueryData mediaQuery,
      String name = '',
      String image = '',
      String category = ''}) {
    return Row(
      children: [
        ImageCard(
          width: mediaQuery.size.width * imageCardRatio,
          height: mediaQuery.size.width * imageCardRatio,
          imageLink: image,
          elevation: 0,
          backgroundColor: Colors.black12,
        ),
        SizedBox(
          width: 8,
        ),
        Container(
          height: mediaQuery.size.width * imageCardRatio,
          width:
              mediaQuery.size.width * (cardWidthRatio - imageCardRatio - 0.4),
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
                  text: name,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  )),
              SizedBox(
                height: 4,
              ),
              LineLabel(text: category + ' '),
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
              text + ' ',
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
