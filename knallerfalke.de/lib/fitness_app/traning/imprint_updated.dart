import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:url_launcher/url_launcher.dart';



class ImprintUpdated extends StatelessWidget {
  final double topBarOpacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: new Text('Contact Form',style: TextStyle(fontFamily: 'Roboto', fontSize: 22 + 6 - 6 * topBarOpacity,fontWeight: FontWeight.bold),),
          textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.black,
            displayColor: Colors.black,
          ),
          backgroundColor: Colors.white,
          brightness: Brightness.light,
        ),
        body: SingleChildScrollView(
          child: ParagraphFunc(),
        ),
      ),
    );
  }
}


class ParagraphFunc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width*0.8;

    return new Container (

        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Center(
            child: RichText(
              text: TextSpan(

                  text: 'Imprint:\n\n',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),

                  children: <TextSpan>[

                    TextSpan(
                        text: 'According to § 5 TMG',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
//                            decoration: TextDecoration.underline
                        )
                    ),
                    TextSpan(
                        text: ' \n\nMoritz Fenske\nAlbert-Einstein Str. 12\n23617 Stockelsdorf',
                        style: TextStyle(
                          color: Colors.black54,
                            fontSize: 15,
//                            fontWeight: FontWeight.bold
                        )
                    ),

                    TextSpan(
                        text: '\n\nContact:',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
//                            decoration: TextDecoration.underline
                        )
                    ),

                    TextSpan(
                        text: ' \n\nTelephone: +49 160 758 91 39\nEmail: knallerfalke@knallerfalke.de',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
//                            fontWeight: FontWeight.bold
                        )
                    ),

                    TextSpan(
                        text: '\n\nDispute settlement',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
//                            decoration: TextDecoration.underline
                        )
                    ),

                    TextSpan(
                        text: ' \n\nThe European Commission provides a platform for online dispute resolution (OS):',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
//                            fontWeight: FontWeight.bold
                        )
                    ),

                    TextSpan(text: ' https://ec.europa.eu/consumers/odr ',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // open desired screen
                            launch('https://ec.europa.eu/consumers/odr');
                          }
                    ),

                    TextSpan(
                        text: ' You can find our email address in the imprint above.We are not willing or obliged to participate in dispute resolution proceedings before a consumer arbitration board. ',
                        style: TextStyle(color: Colors.black54,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)
                    ),

                    TextSpan(
                        text: '\n\nLiability for content',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
//                            decoration: TextDecoration.underline
                        )
                    ),

                    TextSpan(
                        text: ' \n\nAs a service provider, we are responsible for our own content on these pages in accordance with general laws in accordance with Section 7 (1) TMG. According to §§ 8 to 10 TMG, we as a service provider are not obliged to monitor transmitted or stored third-party information or to investigate circumstances that indicate illegal activity. Obligations to remove or block the use of information according to general laws remain unaffected. However, liability in this regard is only possible from the time we become aware of a specific legal violation. As soon as we become aware of such violations, we will remove this content immediately.',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
//                            fontWeight: FontWeight.bold
                        )
                    ),

                    TextSpan(
                        text: '\n\nLiability for links',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
//                            decoration: TextDecoration.underline
                        )
                    ),

                    TextSpan(
                        text: ' \n\nOur offer contains links to external websites of third parties, the content of which we have no influence on. For this reason, we cannot accept any liability for this external content. The respective provider or operator of the pages is always responsible for the content of the linked pages. The linked pages were checked for possible legal violations at the time the link was created. No illegal content was discernible at the time the link was created. A permanent control of the content of the linked pages is not reasonable without concrete evidence of an infringement. As soon as we become aware of legal violations, we will remove such links immediately',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
//                            fontWeight: FontWeight.bold
                        )
                    ),

                    TextSpan(
                        text: '\n\ncopyright',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
//                            decoration: TextDecoration.underline
                        )
                    ),

                    TextSpan(
                        text: ' \n\nThe content and works on these pages created by the site operator are subject to German copyright law. Duplication, editing, distribution and any kind of use outside the limits of copyright law require the written consent of the respective author or creator. Downloads and copies of this page are only permitted for private, non-commercial use. As far as the content on this page was not created by the operator, the copyrights of third parties are observed. In particular contents of third parties are marked as such. Should you nevertheless become aware of a copyright infringement, please let us know. As soon as we become aware of legal violations, we will remove such content immediately',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
//                            fontWeight: FontWeight.bold
                        )
                    ),

                    TextSpan(
                        text: '\n\nadvertising',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
//                            decoration: TextDecoration.underline
                        )
                    ),

                    TextSpan(
                        text: ' \n\nMoritz Fenske is a participant in the Amazon partner program, which was designed to provide a medium for websites that can be used to earn fees by placing partner links to Amazon.de\n\n',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
//                            fontWeight: FontWeight.bold
                        )
                    ),

                  ]

              ),
            )
        )

    );
  }
}
