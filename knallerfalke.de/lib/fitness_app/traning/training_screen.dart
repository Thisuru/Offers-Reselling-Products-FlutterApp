// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class MyApp extends StatelessWidget {

//  Animation<double> topBarAnimation;
//  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

//  @override
//  void initState() {
//    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
////        CurvedAnimation(
////            parent: widget.animationController,
////            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
////    addAllListData();
//
//    scrollController.addListener(() {
//      if (scrollController.offset >= 24) {
//        if (topBarOpacity != 1.0) {
//          setState(() {
//            topBarOpacity = 1.0;
//          });
//        }
//      } else if (scrollController.offset <= 24 &&
//          scrollController.offset >= 0) {
//        if (topBarOpacity != scrollController.offset / 24) {
//          setState(() {
//            topBarOpacity = scrollController.offset / 24;
//          });
//        }
//      } else if (scrollController.offset <= 0) {
//        if (topBarOpacity != 0.0) {
//          setState(() {
//            topBarOpacity = 0.0;
//          });
//        }
//      }
//    });
//    super.initState();
//  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
//        title: const Text('BlogView'),
//        title: Text('BlogView',style: TextStyle(fontFamily: 'Roboto')),
        title: new Text('BlogView',style: TextStyle(fontFamily: 'Roboto', fontSize: 22 + 6 - 6 * topBarOpacity,fontWeight: FontWeight.bold),),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),
        backgroundColor: Colors.white,
        brightness: Brightness.light,

      ),
      body: Center(
          child: WebView(
            initialUrl: 'https://www.knallerfalke.de/blog.html',
            javascriptMode: JavascriptMode.unrestricted,
          )
      )
    );

  }
}

