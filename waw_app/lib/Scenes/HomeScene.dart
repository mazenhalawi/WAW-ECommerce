import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waw_app/Utility/Constants.dart';
import 'package:waw_app/Utility/wawapp_icons.dart';

class HomeScene extends StatefulWidget {
  static const SceneName = 'HomeScene';

  @override
  _HomeSceneState createState() => _HomeSceneState();
}

class _HomeSceneState extends State<HomeScene>
    with AutomaticKeepAliveClientMixin<HomeScene> {
  MediaQueryData mediaQuery;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (mediaQuery == null) {
      mediaQuery = MediaQuery.of(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueAccent,
        child: Center(
          child: Card(
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
                  width: mediaQuery.size.width * 0.75,
                  height: mediaQuery.size.width,
                ),
                //Upper Left Image - Product Image
                Positioned(
                  left: -30,
                  top: 30,
                  child: FlyerCard(),
                ),
                //Lower Right Image - Win Image
                Positioned(
                  bottom: 30,
                  right: -30,
                  child: FlyerCard(),
                ),
                //Horizontal Line
                Positioned(
                  top: mediaQuery.size.width / 2,
                  left: (mediaQuery.size.width * 0.10) / 2,
                  child: HorizontalLine(),
                ),
                //Add to Wish List Button
                Positioned(
                  top: mediaQuery.size.width / 2 - 20,
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
                  top: mediaQuery.size.width / 2 - 20,
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
                  top: mediaQuery.size.width / 2 - 50,
                  left: mediaQuery.size.width * 0.75 / 2 - 50,
                  child: CircularIndicator(),
                ),
                //Circle Sales Info
                Positioned(
                  top: mediaQuery.size.width / 2 - 40,
                  left: mediaQuery.size.width * 0.75 / 2 - 40,
                  child: SalesInfoCircle(),
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
                  child: Container(
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
                          'AED 3250.00',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget QuantityAdjuster() {
    return Container(
      width: 40,
      height: 100,
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
            Text('2'),
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

  Widget SalesInfoCircle() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            offset: Offset(-1, 1),
            color: Colors.black54,
            blurRadius: 4,
          )
        ],
      ),
      width: 80,
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(fit: BoxFit.scaleDown, child: Text('382')),
          FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'SOLD',
                style: TextStyle(fontSize: 10),
              )),
          FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'out of',
                style: TextStyle(fontSize: 12),
              )),
          FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                '975',
                style: TextStyle(fontSize: 12),
              )),
        ],
      ),
    );
  }

  Widget CircularIndicator() {
    return SizedBox(
      width: 100,
      height: 100,
      child: CircularProgressIndicator(
        backgroundColor: Colors.purpleAccent,
        valueColor: AlwaysStoppedAnimation<Color>(kPRIMARY_COLOR),
        strokeWidth: 8,
        value: 0.15,
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

  Widget HorizontalLine() {
    return Container(
      height: 1,
      width: mediaQuery.size.width * 0.65,
      color: Colors.black26,
    );
  }

  Widget FlyerCard() {
    return Card(
      elevation: 1,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        width: mediaQuery.size.width * 0.25,
        height: mediaQuery.size.width * 0.25,
        color: Colors.black12,
        child: Center(
          child: Icon(
            Icons.accessibility_new,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
