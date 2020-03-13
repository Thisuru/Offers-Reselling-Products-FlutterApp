import 'package:knallerfalke.de/fitness_app/models/tabIcon_data.dart';
import 'package:knallerfalke.de/fitness_app/my_diary/my_diary_screen.dart';
import 'package:knallerfalke.de/fitness_app/traning/contact_screen.dart';
import 'package:knallerfalke.de/fitness_app/traning/form.dart';
import 'package:knallerfalke.de/fitness_app/traning/imprint.dart';
import 'package:knallerfalke.de/fitness_app/traning/imprint_updated.dart';
import 'package:knallerfalke.de/fitness_app/traning/training_screen.dart';
import 'package:flutter/material.dart';
import 'bottom_navigation_view/bottom_bar_view.dart';
import 'fintness_app_theme.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class FitnessAppHomeScreen extends StatefulWidget {
  @override
  _FitnessAppHomeScreenState createState() => _FitnessAppHomeScreenState();
}

class _FitnessAppHomeScreenState extends State<FitnessAppHomeScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;
  int componentIndex = 0;

  Widget tabBody = Container(
    color: FintnessAppTheme.background,
  );

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;

    print("....................nsocket.......................");

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = MyDiaryScreen(
      animationController: animationController,
    );

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    tabBody = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  IndexedStack(
                    index: componentIndex,
                    children: <Widget>[
                      MyDiaryScreen(
                        animationController: animationController,
                      ),
                      MyApp(),
                      ImprintUpdated(),
//                      Imprint(),
//                      ContactScreen()
                      FormScreen(),
                    ],
                  ),
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
            setState(() {
              componentIndex = index;
            });

//            if (index == 0) {
//              animationController.reverse().then<dynamic>((data) {
//                if (!mounted) {
//                  return;
//                }
//
//                setState(() {
//
//                  print("Again selected MyDiaryScreen");
//
//                  tabBody = MyDiaryScreen(
//                    animationController: animationController,
//                  );
//                });
//              });
//            } else if (index == 1) {
//              animationController.reverse().then<dynamic>((data) {
//                if (!mounted) {
//                  return;
//                }
//                setState(() {
//                  print("selected myapp blog");
//                  tabBody = MyApp();
////                      TrainingScreen(animationController: animationController);
//                });
//              });
//            } else if (index == 2) {
//              animationController.reverse().then<dynamic>((data) {
//                if (!mounted) {
//                  return;
//                }
//                setState(() {
//                  print("selected Imprint");
////                  tabBody = Imprint();
//                  tabBody = Imprint();
////                      TrainingScreen(animationController: animationController);
//                });
//              });
//            } else if (index == 3) {
//              animationController.reverse().then<dynamic>((data) {
//                if (!mounted) {
//                  return;
//                }
//                setState(() {
//                  print("selected ContactScreen");
//                  tabBody = ContactScreen();
////                      TrainingScreen(animationController: animationController);
//                });
//              });
//            }
          },
        ),
      ],
    );
  }
}
