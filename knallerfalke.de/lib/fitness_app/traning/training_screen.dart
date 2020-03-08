// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class MyApp extends StatelessWidget {


  final double topBarOpacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
//        title: const Text('BlogView'),
//        title: Text('BlogView',style: TextStyle(fontFamily: 'Roboto')),
        title: new Text('Blog View',style: TextStyle(fontFamily: 'Roboto', fontSize: 22 + 6 - 6 * topBarOpacity,fontWeight: FontWeight.bold),),
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

