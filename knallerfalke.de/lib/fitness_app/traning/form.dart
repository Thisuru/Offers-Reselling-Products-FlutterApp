import 'package:flutter/material.dart';
import 'package:validators/validators.dart' as validator;
import 'model.dart';
import 'result.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';



class FormScreen extends StatelessWidget {
  final double topBarOpacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
//          title: Text('Contact Form'),
          title: new Text('Contact Form',style: TextStyle(fontFamily: 'Roboto', fontSize: 22 + 6 - 6 * topBarOpacity,fontWeight: FontWeight.bold),),
          textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.black,
            displayColor: Colors.black,
          ),
          backgroundColor: Colors.white,
          brightness: Brightness.light,
        ),
        body: TestForm(),
      ),
    );
  }
}

class TestForm extends StatefulWidget {
  @override
  _TestFormState createState() => _TestFormState();
}


//http Post implementation
class Post {
  final String name;
  final String email;
  final String message;

  Post({this.name, this.email, this.message});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      name: json['name'],
      email: json['email'],
      message: json['message'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = name;
    map["email"] = email;
    map["message"] = message;
    return map;
  }
}

Future<String> createPost(String url, String name, {Map body}) async {
  return http.post(url, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    print("response.body.toString()");
    print(response.body);
    print(response.body.toString());
    if(response.body.toString()=="success"){
      Fluttertoast.showToast(
          msg: "Deine Nachricht wurde gesendet",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 5,
          backgroundColor: Colors.white70,
          textColor: Colors.black,
          fontSize: 16.0
      );
    }else {
      Fluttertoast.showToast(
          msg: "Sorry " + name + ", da hat etwas nicht funktioniert. Kontaktiere uns gerne Ã¼ber Facebook oder per E-Mail an knallerfalke@knallerfalke.de",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 5,
          backgroundColor: Colors.white70,
          textColor: Colors.red,
          fontSize: 16.0
      );
    }


    return "";
  });
}
//http post ends here


class _TestFormState extends State<TestForm> {
  final _formKey = GlobalKey<FormState>();
  Model model = Model();


  static final CREATE_POST_URL = 'https://www.knallerfalke.de/api/sendemail';
  TextEditingController nameControler = new TextEditingController();
  TextEditingController emailControler = new TextEditingController();
  TextEditingController messageControler = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
     child: Padding(
       padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[

          MyTextFormField(
            hintText: 'First Name',
            controller: nameControler,
            minLines: 1,
            validator: (String value) {
              if (value.isEmpty) {
                return 'Enter your first name';
              }
              return null;
            },
            onSaved: (String value) {
              model.firstName = value;
            },
          ),

          MyTextFormField(
            hintText: 'Email',
            controller: emailControler,
            minLines: 1,
            isEmail: true,
            validator: (String value) {
              if (!validator.isEmail(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            onSaved: (String value) {
              model.email = value;
            },
          ),

          MyTextFormField(
            hintText: 'Message',
            controller: messageControler,
            minLines: 7,
            validator: (String value) {
              if (value.isEmpty) {
                return 'Enter the Message';
              }
              return null;
            },
            onSaved: (String value) {
              model.message = value;
            },
          ),


          ButtonTheme(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
            padding: const EdgeInsets.all(10),
            child: RaisedButton(
              color: Colors.white,
              onPressed: () async {
                Post newPost = new Post(
                    name: nameControler.text, email: emailControler.text, message: messageControler.text);
                dynamic p = await createPost(CREATE_POST_URL,
                    nameControler.text,
                    body: newPost.toMap());
              },
              child: Text("Button", style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                  fontFamily: "WorkSansLight"
              )),
            ),
          ),


//          RaisedButton(
//            color: Colors.blueAccent,
////            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
//            shape: StadiumBorder(),
//            textTheme: ButtonTextTheme.accent,
//            onPressed: () async {
//              Post newPost = new Post(
//                  name: nameControler.text, email: emailControler.text, message: messageControler.text);
//              dynamic p = await createPost(CREATE_POST_URL,
//                  nameControler.text,
//                  body: newPost.toMap());
////              print(p.name);
////              print(p.email);
////              print(p.message);
//            },
//            child: Text(
//              'Send',
//              style: TextStyle(
//                color: Colors.blue,
//                fontSize: 20.0,
//                fontFamily: "WorkSansLight"
//              ),
//            ),
//          )




        ],
      ),
    ),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isEmail;
  final int minLines;

  MyTextFormField({
    this.hintText,
    this.validator,
    this.onSaved,
    this.isEmail = false,
    this.minLines,

    TextEditingController controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        elevation: 20.0,
        shadowColor:  Color(0xffA22447).withOpacity(.15),
        child: TextFormField(
          minLines: minLines,
          autocorrect: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15.0),
            hintText: hintText,
          ),
          validator: validator,
          onSaved: onSaved,
          keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.multiline,
          maxLines: null,
        ),
      ),
    );
  }
}

