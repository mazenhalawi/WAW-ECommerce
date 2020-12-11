import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waw_app/Models/Campaign.dart';
import 'package:waw_app/Utility/Constants.dart';
import 'package:waw_app/Utility/wawapp_icons.dart';

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
            child: FlyerCard(
                mediaQuery: mediaQuery, imageLink: campaign.productImageLink),
          ),
          //Lower Right Image - Win Image
          Positioned(
            bottom: 30,
            right: -30,
            child: FlyerCard(
                mediaQuery: mediaQuery, imageLink: campaign.prizeImageLink),
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
              onPressed: () {},
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
              onPressed: () {},
            ),
          ),
          //Circle Sales Percentage Indicator
          Positioned(
            top: mediaQuery.size.width / 1.8 - 50,
            left: mediaQuery.size.width * 0.75 / 2 - 50,
            child: CircularIndicator(completion: campaign.qtyPercentage),
          ),
          //Circle Sales Info
          Positioned(
            top: mediaQuery.size.width / 1.8 - 35,
            left: mediaQuery.size.width * 0.75 / 2 - 35,
            child: SalesInfoCircle(
                sold: campaign.qtySold, stock: campaign.qtyStock),
          ),
          //Quantity Adjuster
          Positioned(
            top: 90,
            right: -20,
            child: QuantityAdjuster(),
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

  Widget QuantityAdjuster() {
    final double width = 40;
    final double height = 125;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
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
                radius: 12,
                icon: Icon(
                  WAWApp.plus,
                  color: Colors.white,
                ),
                onPressed: () => print('adding an item')),
            SizedBox(
              width: width - 10,
              height: 20,
              child: FittedBox(
                child: Text(
                  '20',
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
              ),
            ),
            CircularButton(
                radius: 12,
                icon: Icon(
                  WAWApp.minus,
                  color: Colors.white,
                ),
                onPressed: () => print('removing an item')),
          ],
        ),
      ),
    );
  }

  Widget SalesInfoCircle({@required int sold = 0, @required int stock = 0}) {
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

  Widget CircularIndicator({double completion = 0}) {
    return SizedBox(
      width: 100,
      height: 100,
      child: CircularProgressIndicator(
        backgroundColor: Color.fromRGBO(227, 207, 235, 1.0),
        valueColor: AlwaysStoppedAnimation<Color>(kPRIMARY_COLOR),
        strokeWidth: 6,
        value: completion,
      ),
    );
  }

  Widget CircularButton(
      {@required double radius, Icon icon, Function onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: kPRIMARY_COLOR,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: IconButton(
            icon: icon,
            onPressed: onPressed,
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

  Widget FlyerCard(
      {@required MediaQueryData mediaQuery, @required String imageLink}) {
    return Card(
      elevation: 7,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        width: mediaQuery.size.width * flyerCardWidthRatio,
        height: mediaQuery.size.width * flyerCardWidthRatio,
        color: Colors.white,
        child: Image.network(
          imageLink,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
