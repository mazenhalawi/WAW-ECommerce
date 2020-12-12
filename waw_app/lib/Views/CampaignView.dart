import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waw_app/Blocs/CartBloc.dart';
import 'package:waw_app/Blocs/HomeBloc.dart';
import 'package:waw_app/Blocs/WishlistBloc.dart';
import 'package:waw_app/Models/Campaign.dart';
import 'package:waw_app/Utility/Constants.dart';
import 'package:waw_app/Utility/wawapp_icons.dart';
import 'package:waw_app/Views/CircularButton.dart';
import 'package:waw_app/Views/CircularIndicator.dart';
import 'package:waw_app/Views/ImageCard.dart';
import 'package:waw_app/Views/QuantityAdjuster.dart';

import 'InfoCircle.dart';

class CampaignView extends StatelessWidget {
  final Campaign campaign;
  final double containerWidthRatio = 0.75;
  final double flyerCardWidthRatio = 0.25;

  CampaignView({@required this.campaign});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Card(
      elevation: 2,
      shadowColor: Colors.black45,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: mediaQuery.size.width * containerWidthRatio,
            height: mediaQuery.size.width,
          ),
          //Upper Left Image - Product Image
          Positioned(
            left: -30,
            top: 30,
            child: ImageCard(
              width: mediaQuery.size.width * flyerCardWidthRatio,
              height: mediaQuery.size.width * flyerCardWidthRatio,
              imageLink: campaign.productImageLink,
            ),
          ),
          //Lower Right Image - Win Image
          Positioned(
            bottom: 30,
            right: -30,
            child: ImageCard(
              width: mediaQuery.size.width * flyerCardWidthRatio,
              height: mediaQuery.size.width * flyerCardWidthRatio,
              imageLink: campaign.prizeImageLink,
            ),
          ),
          //Horizontal Line
          Positioned(
            top: mediaQuery.size.width / 1.8,
            left: (mediaQuery.size.width * 0.10) / 2,
            child: HorizontalLine(mediaQuery),
          ),
          //Add to Wish List Button
          Positioned(
            top: mediaQuery.size.width / 1.8 - 20,
            left: mediaQuery.size.width * 0.10 / 2 + 20,
            child: CircularButton(
              radius: 20,
              icon: Icon(
                WAWApp.heart,
                color: Colors.white,
              ),
              onPressed: () {
                Provider.of<WishlistBloc>(context, listen: false)
                    .addToWishList(campaign: this.campaign);
                showSnackbar(
                    context: context,
                    text: '${campaign.productName} was added to Wish list.');
              },
            ),
          ),
          //Add to Cart Button
          Positioned(
            top: mediaQuery.size.width / 1.8 - 20,
            right: mediaQuery.size.width * 0.10 / 2 + 20,
            child: CircularButton(
              radius: 20,
              icon: Icon(
                CupertinoIcons.cart_badge_plus,
                color: Colors.white,
              ),
              onPressed: () {
                Provider.of<CartBloc>(context, listen: false)
                    .addToCart(campaign);
                showSnackbar(
                    context: context,
                    text: '${campaign.productName} was added to cart.');
              },
            ),
          ),
          //Circle Sales Percentage Indicator
          Positioned(
            top: mediaQuery.size.width / 1.8 - 50,
            left: mediaQuery.size.width * 0.75 / 2 - 50,
            child: CircularIndicator(
              width: 100,
              height: 100,
              percentage: campaign.qtyPercentage,
            ),
          ),
          //Circle Sales Info
          Positioned(
            top: mediaQuery.size.width / 1.8 - 35,
            left: mediaQuery.size.width * 0.75 / 2 - 35,
            child: InfoCircle(sold: campaign.qtySold, stock: campaign.qtyStock),
          ),
          //Quantity Adjuster
          Positioned(
            top: 90,
            right: -20,
            child: QuantityAdjuster(
              availableQty: campaign.availableStock,
              campaignID: campaign.campaignID,
            ),
          ),
          //Price Tag
          Positioned(
            top: 30,
            right: -15,
            child:
                PriceTag(mediaQuery: mediaQuery, price: campaign.productPrice),
          ),
          //Campaign Label
          Positioned(
            top: 65,
            left: mediaQuery.size.width * 0.25 - 15,
            child:
                ProductName(mediaQuery: mediaQuery, name: campaign.productName),
          ),
          //Prize Label
          Positioned(
            left: 20,
            bottom: mediaQuery.size.width * flyerCardWidthRatio - 60,
            child: PrizeLabel(mediaQuery: mediaQuery, name: campaign.prizeName),
          ),
        ],
      ),
    );
  }

  void showSnackbar({@required BuildContext context, @required String text}) {
    final snackbar = SnackBar(
      content: Text(text),
      elevation: 5,
      duration: Duration(seconds: 2),
    );
    Scaffold.of(context).hideCurrentSnackBar();
    Scaffold.of(context).showSnackBar(snackbar);
  }

  Widget PrizeLabel(
      {@required MediaQueryData mediaQuery, @required String name}) {
    return Container(
      width:
          mediaQuery.size.width * (containerWidthRatio - flyerCardWidthRatio) -
              20,
      child: Column(
        children: [
          Row(
            children: [
              FittedBox(
                fit: BoxFit.fill,
                child: Text(
                  'Get a chance to win:',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  name,
                  softWrap: true,
                  maxLines: 3,
                  style: TextStyle(fontSize: 15),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget ProductName(
      {@required MediaQueryData mediaQuery, @required String name}) {
    return Container(
      width: mediaQuery.size.width * 0.4,
      height: 70,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Buy a',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  child: SizedBox(
                    child: Text(
                      name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget PriceTag(
      {@required MediaQueryData mediaQuery, @required String price}) {
    return Container(
      height: 35,
      width: mediaQuery.size.width * 0.32,
      decoration: BoxDecoration(
        color: kPRIMARY_COLOR,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: FittedBox(
        fit: BoxFit.fill,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            price,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget HorizontalLine(MediaQueryData mediaQuery) {
    return Container(
      height: 1,
      width: mediaQuery.size.width * 0.65,
      color: Colors.black26,
    );
  }
}
