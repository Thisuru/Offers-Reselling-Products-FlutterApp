import 'package:flutter/material.dart';

class ImprintUpdated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Contact Form'),
        ),
        body: ParagraphFunc(),
      ),
    );
  }
}


class ParagraphFunc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width*0.8;

    return new Container (
      padding: const EdgeInsets.all(16.0),
      width: cWidth,
      child: new Column (
        children: <Widget>[
          new Text ("As a service provider, we are responsible for our own content on these pages in accordance with general laws in accordance with Section 7 (1) TMG. According to §§ 8 to 10 TMG, we as a service provider are not obliged to monitor transmitted or stored external information or to investigate circumstances that indicate illegal activity. Obligations to remove or block the use of information according to general laws remain unaffected. However, liability in this regard is only possible from the time we become aware of a specific legal violation. As soon as we become aware of such violations, we will remove this content immediately", textAlign: TextAlign.left),
//          new Text ("Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2", textAlign: TextAlign.left),
        ],
      ),
    );
  }
}
