import 'dart:io';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:knallerfalke.de/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'navigation_home_screen.dart';
import 'package:knallerfalke.de/fitness_app/fitness_app_home_screen.dart';

import 'fitness_app/offer.dart';
import 'model/offer.dart';

//import 'package:adhara_socket_io/adhara_socket_io.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {

  final FirebaseAnalytics analytics = FirebaseAnalytics();

  void onLogin() {
    analytics.logLogin();
    // analytics.logEvent(name: 'login');
  }


  @override
  Widget build(BuildContext context) {

    onLogin();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return  Offer(
      offers: <Widget>[],
      child :  MaterialApp(
        title: 'Offers | Reselling Products',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: AppTheme.textTheme,
          platform: TargetPlatform.iOS,
        ),
//      home: NavigationHomeScreen(),
        home: FitnessAppHomeScreen(),
      )
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
