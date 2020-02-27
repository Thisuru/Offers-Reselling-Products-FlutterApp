import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'package:knallerfalke.de/fitness_app/models/tabIcon_data.dart';
import 'package:knallerfalke.de/fitness_app/my_diary/my_diary_screen.dart';
import 'package:knallerfalke.de/fitness_app/traning/training_screen.dart';
import 'package:flutter/material.dart';
import 'package:knallerfalke.de/fitness_app/ui_view/body_measurement.dart';
import 'package:knallerfalke.de/fitness_app/ui_view/title_view.dart';
import 'package:knallerfalke.de/model/offer.dart';
import 'bottom_navigation_view/bottom_bar_view.dart';
import 'fintness_app_theme.dart';
import 'my_diary/meals_list_view.dart';
import 'offer.dart';
import 'package:after_init/after_init.dart';



class FitnessAppHomeScreen extends StatefulWidget {
  @override
  _FitnessAppHomeScreenState createState() => _FitnessAppHomeScreenState();
}

class _FitnessAppHomeScreenState extends State<FitnessAppHomeScreen>
    with TickerProviderStateMixin, AfterInitMixin<FitnessAppHomeScreen>  {
  AnimationController animationController;



  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: FintnessAppTheme.background,
  );


  @override
  void initState() {


    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;


    tabBody = MyDiaryScreen(animationController: animationController,);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);

//    final offersData = Offer.of(context);
//    const int count = 9;
//
//    offersData.offers.add(
//      TitleView(
//        titleTxt: 'Featured',
//        subTxt: '',
//        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//            parent: animationController,
//            curve:
//            Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
//        animationController: animationController,
//      ),
//    );
//
//    offersData.offers.add(
//      MealsListView(
//        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
//            CurvedAnimation(
//                parent: animationController,
//                curve: Interval((1 / count) * 3, 1.0,
//                    curve: Curves.fastOutSlowIn))),
//        mainScreenAnimationController: animationController,
//      ),
//    );

//    initializeWebSocket();



//    final offersData = Offer.of(context);
//    const int count = 9;

//    offersData.offers.add(
//      TitleView(
//        titleTxt: 'Featured',
//        subTxt: '',
//        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//            parent: animationController,
//            curve:
//            Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
//        animationController: animationController,
//      ),
//    );
//
//    offersData.offers.add(
//      MealsListView(
//        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
//            CurvedAnimation(
//                parent: animationController,
//                curve: Interval((1 / count) * 3, 1.0,
//                    curve: Curves.fastOutSlowIn))),
//        mainScreenAnimationController: animationController,
//      ),
//    );

//    offersData.offers.add(
//      TitleView(
//        titleTxt: 'Offers',
//        subTxt: '',
//        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//            parent: animationController,
//            curve:
//            Interval((1 / count) * 4, 1.0, curve: Curves.fastOutSlowIn))),
//        animationController: animationController,
//      ),
//    );
//
//    offersData.offers.add(
//      BodyMeasurementView(
//        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//            parent: animationController,
//            curve:
//            Interval((1 / count) * 5, 1.0, curve: Curves.fastOutSlowIn))),
//        animationController: animationController,
//      ),
//    );
//    //Newly Added Code
//    offersData.offers.add(
//      TitleView(
//        titleTxt: '',
//        subTxt: '',
//        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//            parent: animationController,
//            curve:
//            Interval((1 / count) * 4, 1.0, curve: Curves.fastOutSlowIn))),
//        animationController: animationController,
//      ),
//    );
//    offersData.offers.add(
//      BodyMeasurementView(
//        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//            parent: animationController,
//            curve:
//            Interval((1 / count) * 5, 1.0, curve: Curves.fastOutSlowIn))),
//        animationController: animationController,
//      ),//Weather measurement
//    );
//
//    offersData.offers.add(
//      TitleView(
//        titleTxt: '',
//        subTxt: '',
//        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//            parent: animationController,
//            curve:
//            Interval((1 / count) * 4, 1.0, curve: Curves.fastOutSlowIn))),
//        animationController: animationController,
//      ),
//    );
//    offersData.offers.add(
//      BodyMeasurementView(
//        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//            parent: animationController,
//            curve:
//            Interval((1 / count) * 5, 1.0, curve: Curves.fastOutSlowIn))),
//        animationController: animationController,
//      ),//Weather measurement
//    );

    tabBody = MyDiaryScreen(animationController: animationController,);

    return Container(
      color: FintnessAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[

                  tabBody,
//                  RaisedButton(
//                    onPressed: () {
//                      print("removing items from inherited widget");
//                      final offersData = Offer.of(context);
//                      offersData.offers.removeLast();
////                      setState(() {
////                        print("Click from parentt");
////                      });
//                    },
//                    child: Text("parent raised"),
//                  ),
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = MyDiaryScreen(animationController: animationController,);
                });
              });
            } else if (index == 1) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {

                  tabBody = MyApp ();
//                      TrainingScreen(animationController: animationController);
                });
              });
            }
          },
        ),
      ],
    );
  }

  @override
  void didInitState() {
    // TODO: implement didInitState
  }
}
