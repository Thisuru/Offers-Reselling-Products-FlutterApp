import 'package:adhara_socket_io/manager.dart';
import 'package:adhara_socket_io/options.dart';
import 'package:adhara_socket_io/socket.dart';
import 'package:knallerfalke.de/fitness_app/ui_view/body_measurement.dart';
import 'package:knallerfalke.de/fitness_app/ui_view/title_view.dart';
import 'package:knallerfalke.de/fitness_app/fintness_app_theme.dart';
import 'package:knallerfalke.de/fitness_app/my_diary/meals_list_view.dart';
import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;


import '../offer.dart';


class MyDiaryScreen extends StatefulWidget {
  final AnimationController animationController;

  const MyDiaryScreen({Key key, this.animationController}) : super(key: key);

  @override
  MyDiaryScreenState createState() => MyDiaryScreenState();
}


class MyDiaryScreenState extends State<MyDiaryScreen>
    with TickerProviderStateMixin {

  SocketIO socket;
  IO.Socket nsocket;
  List<Widget> offers;
  AnimationController animationController;

  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  void initializeWebSocket() async {
    print("initializeWebSocket....");
    SocketIOManager manager = SocketIOManager();

    socket = await manager.createInstance(
        SocketOptions(
            'http://192.168.43.1:5000',
//            'ws://echo.websocket.org',
//      'http://10.0.2.2:5000',
//            nameSpace: '/test',
            enableLogging: true,
            transports: [Transports.POLLING])
    );

    socket.onConnect((data) {
      print("onConnected");
//      socket.emit("message", ["Request from flutter"]);

//    print(data);
    });

    socket.on("message", (data) {
      print("Received message from Backend");
      print(data);

      setState(() {
        const int count = 9;

        print("future fired");

//        for (var i = 0; i < data.length; i++){
//
//          offers.add(
//            TitleView(
//              titleTxt: data[i],
//              subTxt: '',
//              animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//                  parent: widget.animationController,
//                  curve:
//                  Interval((1 / count) * 4, 1.0, curve: Curves.fastOutSlowIn))),
//              animationController: widget.animationController,
//            ),
//          );
//
//          offers.add(
//            BodyMeasurementView(
//              word: data[i],
//              main_title: data[i],
//              animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//                  parent: widget.animationController,
//                  curve:
//                  Interval((1 / count) * 5, 1.0, curve: Curves.fastOutSlowIn))),
//              animationController: widget.animationController,
//            ),
//          );
//
//        }



        //Newly Added Code
//        offers.add(
//          TitleView(
//            titleTxt: '',
//            subTxt: '',
//            animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//                parent: widget.animationController,
//                curve:
//                Interval((1 / count) * 4, 1.0, curve: Curves.fastOutSlowIn))),
//            animationController: widget.animationController,
//          ),
//        );
//        offers.add(
//          BodyMeasurementView(
//            word: 'textRR56',
//            animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//                parent: widget.animationController,
//                curve:
//                Interval((1 / count) * 5, 1.0, curve: Curves.fastOutSlowIn))),
//            animationController: widget.animationController,
//          ),//Weather measurement
//        );
//
//        offers.add(
//          TitleView(
//            titleTxt: '',
//            subTxt: '',
//            animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//                parent: widget.animationController,
//                curve:
//                Interval((1 / count) * 4, 1.0, curve: Curves.fastOutSlowIn))),
//            animationController: widget.animationController,
//          ),
//        );
//        offers.add(
//          BodyMeasurementView(
//            word: 'textRRaa',
//            animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//                parent: widget.animationController,
//                curve:
//                Interval((1 / count) * 5, 1.0, curve: Curves.fastOutSlowIn))),
//            animationController: widget.animationController,
//          ),//Weather measurement
//        );

      });


//      print(offersData.offers);



    });

    socket.connect();
  }

  void initializeWebSocket1() async {

    super.initState();
//    http://192.168.43.1:5005
    nsocket = IO.io('http://195.128.102.219:5005', <String, dynamic>{
      'transports': ['websocket'],
      'extraHeaders': {'Upgrade': 'websocket'}
    });
    nsocket.connect();
    print('test');
    nsocket.on('disconnect', (_) => print('disconnectwsed'));
    nsocket.on("connect", (_) {
      print('Connected');
      nsocket.emit('message', 'test');
    });
    nsocket.on("message", (data) {
      print('fromServer $data');
      print(data.runtimeType);
      setState(() {
        const int count = 9;

        print("future fired");

        for (var i = 0; i < data.length; i++){


          print(data[i]['vhrzeit']);



          offers.add(
            TitleView(
              titleTxt: '',
              subTxt: '',
              animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                  parent: widget.animationController,
                  curve:
                  Interval((1 / count) * 4, 1.0, curve: Curves.fastOutSlowIn))),
              animationController: widget.animationController,
            ),
          );

          offers.add(
            BodyMeasurementView(
              word: '',
              mainTitle: data[i]['shop'],
              dateTime: data[i]['vhrzeit'],
              url: data[i]['zum_angebot_link'],
              animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                  parent: widget.animationController,
                  curve:
                  Interval((1 / count) * 5, 1.0, curve: Curves.fastOutSlowIn))),
              animationController: widget.animationController,
            ),
          );

        }
      });
    });

    nsocket.on("connect_error", (data) => print(data));



  }

  @override
  void initState() {

    addAllListData();
    offers = <Widget>[];

    print("initializeWebSocket called");
    initializeWebSocket1();

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
  }

  void addAllListData() {
    const int count = 9;

//    listViews.add(
//      TitleView(
//        titleTxt: 'Mediterranean diet',
//        subTxt: 'Details',
//        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//            parent: widget.animationController,
//            curve:
//                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
//        animationController: widget.animationController,
//      ),
//    );
//    listViews.add(
//      MediterranesnDietView(
//        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//            parent: widget.animationController,
//            curve:
//                Interval((1 / count) * 1, 1.0, curve: Curves.fastOutSlowIn))),
//        animationController: widget.animationController,
//      ),
//    );
//    listViews.add(
//      TitleView(
//        titleTxt: 'Featured',
//        subTxt: '',
//        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//            parent: widget.animationController,
//            curve:
//                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
//        animationController: widget.animationController,
//      ),
//    );
//
//    listViews.add(
//      MealsListView(
//        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
//            CurvedAnimation(
//                parent: widget.animationController,
//                curve: Interval((1 / count) * 3, 1.0,
//                    curve: Curves.fastOutSlowIn))),
//        mainScreenAnimationController: widget.animationController,
//      ),
//    );

//    listViews.add(
//      TitleView(
//        titleTxt: 'Hits',
//        subTxt: 'Best Deals',
//        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//            parent: widget.animationController,
//            curve:
//            Interval((1 / count) * 6, 1.0, curve: Curves.fastOutSlowIn))),
//        animationController: widget.animationController,
//      ),
//    );
//
//    listViews.add(
//      WaterView(
//        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
//            CurvedAnimation(
//                parent: widget.animationController,
//                curve: Interval((1 / count) * 7, 1.0,
//                    curve: Curves.fastOutSlowIn))),
//        mainScreenAnimationController: widget.animationController,
//      ),
//    );

//    listViews.add(
//      TitleView(
//        titleTxt: 'Offers',
//        subTxt: '',
//        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//            parent: widget.animationController,
//            curve:
//                Interval((1 / count) * 4, 1.0, curve: Curves.fastOutSlowIn))),
//        animationController: widget.animationController,
//      ),
//    );
//
//    listViews.add(
//      BodyMeasurementView(
//        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//            parent: widget.animationController,
//            curve:
//                Interval((1 / count) * 5, 1.0, curve: Curves.fastOutSlowIn))),
//        animationController: widget.animationController,
//      ),
//    );
//    //Newly Added Code
//    listViews.add(
//      TitleView(
//        titleTxt: '',
//        subTxt: '',
//        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//            parent: widget.animationController,
//            curve:
//            Interval((1 / count) * 4, 1.0, curve: Curves.fastOutSlowIn))),
//        animationController: widget.animationController,
//      ),
//    );
//    listViews.add(
//      BodyMeasurementView(R
//        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//            parent: widget.animationController,
//            curve:
//            Interval((1 / count) * 5, 1.0, curve: Curves.fastOutSlowIn))),
//        animationController: widget.animationController,
//      ),//Weather measurement
//    );
//
//    listViews.add(
//      TitleView(
//        titleTxt: '',
//        subTxt: '',
//        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//            parent: widget.animationController,
//            curve:
//            Interval((1 / count) * 4, 1.0, curve: Curves.fastOutSlowIn))),
//        animationController: widget.animationController,
//      ),
//    );
//    listViews.add(
//      BodyMeasurementView(
//        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//            parent: widget.animationController,
//            curve:
//            Interval((1 / count) * 5, 1.0, curve: Curves.fastOutSlowIn))),
//        animationController: widget.animationController,
//      ),//Weather measurement
//    );
    //Newly Added Code

    //Prepare Text with glass
//    listViews.add(
//      GlassView(
//          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
//              CurvedAnimation(
//                  parent: widget.animationController,
//                  curve: Interval((1 / count) * 8, 1.0,
//                      curve: Curves.fastOutSlowIn))),
//          animationController: widget.animationController),
//    );
//    //Prepare Text with glass

  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }


  @override
  Widget build(BuildContext context) {

    print(widget.animationController);
    Animation<double> topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);

    final offersData = Offer.of(context);
    const int count = 9;

    offersData.offers.add(
      TitleView(
        titleTxt: 'Featured',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: animationController,
            curve:
            Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: animationController,
      ),
    );

    offersData.offers.add(
      MealsListView(
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: animationController,
                curve: Interval((1 / count) * 3, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: animationController,
      ),
    );

    return Container(
      color: FintnessAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainListViewUI(offers),
            getAppBarUI(topBarAnimation),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            ),
          ],
        ),
      ),
    );
  }

  Widget getMainListViewUI(List<Widget> offers) {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  24,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: offers.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              widget.animationController.forward();
              return offers[index];
            },
          );
        }
      },
    );
  }

  Widget getAppBarUI(Animation<double> topBarAnimation) {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController,
          builder: (BuildContext context, Widget child) {
            return FadeTransition(
              opacity: topBarAnimation,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation.value), 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FintnessAppTheme.white.withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: FintnessAppTheme.grey
                              .withOpacity(0.4 * topBarOpacity),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16 - 8.0 * topBarOpacity,
                            bottom: 12 - 8.0 * topBarOpacity),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Offers & Products ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: FintnessAppTheme.fontName,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22 + 6 - 6 * topBarOpacity,
                                    letterSpacing: 1.2,
                                    color: FintnessAppTheme.darkerText,
                                  ),
                                ),
                              ),
                            ),
//                            SizedBox(
//                              height: 38,
//                              width: 38,
//                              child: InkWell(
//                                highlightColor: Colors.transparent,
//                                borderRadius: const BorderRadius.all(
//                                    Radius.circular(32.0)),
//                                onTap: () {},
//                                child: Center(
//                                  child: Icon(
//                                    Icons.keyboard_arrow_left,
//                                    color: FintnessAppTheme.grey,
//                                  ),
//                                ),
//                              ),
//                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                                right: 8,
                              ),
                              child: Row(
                                children: <Widget>[
//                                  Padding(
//                                    padding: const EdgeInsets.only(right: 8),
//                                    child: Icon(
//                                      Icons.calendar_today,
//                                      color: FintnessAppTheme.grey,
//                                      size: 18,
//                                    ),
//                                  ),
//                                  Text(
//                                    '15 May',
//                                    textAlign: TextAlign.left,
//                                    style: TextStyle(
//                                      fontFamily: FintnessAppTheme.fontName,
//                                      fontWeight: FontWeight.normal,
//                                      fontSize: 18,
//                                      letterSpacing: -0.2,
//                                      color: FintnessAppTheme.darkerText,
//                                    ),
//                                  ),
                                ],
                              ),
                            ),
//                            SizedBox(
//                              height: 38,
//                              width: 38,
//                              child: InkWell(
//                                highlightColor: Colors.transparent,
//                                borderRadius: const BorderRadius.all(
//                                    Radius.circular(32.0)),
//                                onTap: () {},
//                                child: Center(
//                                  child: Icon(
//                                    Icons.keyboard_arrow_right,
//                                    color: FintnessAppTheme.grey,
//                                  ),
//                                ),
//                              ),
//                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
