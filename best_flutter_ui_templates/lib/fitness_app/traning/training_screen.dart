// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: const Text('Flutter WebView example'),
//        backgroundColor: new Color(0xffffff),
//
//      ),
      body: Center(
          child: WebView(
            initialUrl: 'https://knallerfalke.de',
            javascriptMode: JavascriptMode.unrestricted,
          )
      )
    );

  }
}

