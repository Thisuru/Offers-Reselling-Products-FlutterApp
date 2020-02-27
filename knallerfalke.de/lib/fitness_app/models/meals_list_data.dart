//import 'package:adhara_socket_io/adhara_socket_io.dart';
//
//Future<String>  createOrderMessage() async {
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
//}



class MealsListData {

  MealsListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.meals,
    this.kacl = '',
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  List<String> meals;
  String kacl;

  static List<MealsListData> tabIconsList = <MealsListData>[
    MealsListData(
      imagePath: 'assets/fitness_app/breakfast.png',
      titleTxt: 'Amazon',
      kacl: '',
      meals: <String>['Time of Day', '8.33 am', ''],
      startColor: '#FA7D82',
      endColor: '#FFB295',
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/lunch.png',
      titleTxt: 'Saturn',
      kacl: '',
      meals: <String>['Time of Day', '1:03 am', ''],
      startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/snack.png',
      titleTxt: 'Mindfctory',
      kacl: '',
      meals: <String>['Time of Day', '3.45 pm'],
      startColor: '#FE95B6',
      endColor: '#FF5287',
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/dinner.png',
      titleTxt: 'Amazon',
      kacl: '',
      meals: <String>['Time of Day', '1:26 pm'],
      startColor: '#6F72CA',
      endColor: '#1E1466',
    ),
  ];
}
