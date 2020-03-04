import 'package:knallerfalke.de/fitness_app/ui_view/body_measurement.dart';
import 'package:knallerfalke.de/fitness_app/ui_view/title_view.dart';
import 'package:knallerfalke.de/fitness_app/fintness_app_theme.dart';
import 'package:knallerfalke.de/fitness_app/my_diary/meals_list_view.dart';
import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;


import '../offer.dart';


class MyDiaryScreen extends StatefulWidget {
  const MyDiaryScreen({Key key, this.animationController}) : super(key: key);

  final AnimationController animationController;
  @override
  MyDiaryScreenState createState() => MyDiaryScreenState();
}


class MyDiaryScreenState extends State<MyDiaryScreen>
    with TickerProviderStateMixin {

  IO.Socket nsocket;
  List<Widget> offers;
  AnimationController animationController;

  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;


  void initializeWebSocket1() async {

//    super.initState();
//    http://192.168.43.1:5005
    print("nsocket ");
    print(nsocket);
    nsocket = IO.io('http://195.128.102.219:5005', <String, dynamic>{
      'transports': ['websocket'],
      'extraHeaders': {'Upgrade': 'websocket'}
    });
    print("-------------After---------");
    print(nsocket);
    nsocket.connect();
    print('tesrt');
    nsocket.on('event', (data) => print("received evt "+data));
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

        nsocket.disconnect();
      });
    });

    nsocket.on("connect_error", (data) => print(data));



  }

  @override
  void initState() {

//    addAllListData();
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
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                                right: 8,
                              ),
                              child: Row(
                                children: <Widget>[
                                ],
                              ),
                            ),
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
