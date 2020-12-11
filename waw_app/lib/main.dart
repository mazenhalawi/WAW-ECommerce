import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waw_app/Blocs/WishlistBloc.dart';
import 'package:waw_app/Managers/NavManager.dart';

import 'Blocs/CartBloc.dart';
import 'Blocs/HomeBloc.dart';
import 'Scenes/LoginScene.dart';
import 'Utility/Constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      title: 'WAW Ecommerce',
      theme: ThemeData(
        primarySwatch: kPRIMARY_COLOR,
        accentColor: kACCENT_COLOR,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          fontFamily: kDEFAULT_FONT,
          color: Colors.black54,
          letterSpacing: 0.5,
        )),
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
            buttonColor: kPRIMARY_COLOR,
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: Colors.white,
                  secondary: Colors.black54,
                ),
            textTheme: ButtonTextTheme.accent),
        textTheme: Theme.of(context).textTheme.copyWith(
              headline3: TextStyle(
                color: kPRIMARY_COLOR,
                fontSize: 32,
                fontWeight: FontWeight.w700,
                wordSpacing: 0,
                fontFamily: kDEFAULT_FONT,
              ),
              headline5: TextStyle(
                color: kPRIMARY_COLOR,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: kDEFAULT_FONT,
              ),
              bodyText2: TextStyle(
                color: Colors.black38,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                wordSpacing: 0.5,
              ),
              button: TextStyle(
                color: Colors.black54,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
      ),
      initialRoute: LoginScene.SceneName,
      routes: NavManager.getRoutes,
    );
    return MultiProvider(
      providers: [
        Provider(create: (_) => CartBloc()),
        ChangeNotifierProvider(create: (_) => HomeBloc()),
        Provider(create: (_) => WishlistBloc())
      ],
      child: app,
    );
  }
}
