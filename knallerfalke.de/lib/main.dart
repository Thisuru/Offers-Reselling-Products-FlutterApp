import 'dart:io';
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

      //Socket Start Here
//  SocketIOManager manager = SocketIOManager();
//
//  SocketIO socket = await manager.createInstance(SocketOptions(
//      'http://192.168.43.1:5000',
////      'http://10.0.2.2:5000',
//      nameSpace: '/test',
//      enableLogging: true,
//      transports: [Transports.POLLING]
//  ));
//
//  socket.onConnect((data) {
//    print("onConnected");
//    socket.emit("message", ["Request from flutter"]);
//
////    print(data);
//  });
//
//  socket.on("message", (data) {
////    print("Received message from Backend");
//    print(data);
//
//  });
//
//  socket.connect();
              //Socket Ends here

//  IO.Socket socket = IO.io('http://10.0.2.2:5000/', <String, dynamic>{
//    'transports': ['websocket'],
//    'extraHeaders': {'foo': 'bar'} // optional
//  });


}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
