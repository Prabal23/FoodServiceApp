import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:foodpanda_app/MainScreen/HomePage/homepage.dart';
import 'dart:async';
import 'package:foodpanda_app/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: Container(
        padding: EdgeInsets.all(0.0),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.transparent,
              //backgroundImage: ExactAssetImage('assets/logo.png'),
              minRadius: 60,
              maxRadius: 60,
              //radius: 68.0,
              child: Image.asset('assets/meal1.png'),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(child: logo),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Food",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold)),
                    Container(
                      padding:
                          EdgeInsets.only(top: 5, bottom: 5, right: 5, left: 3),
                      child: Text("Service",
                          style: TextStyle(
                              fontSize: 20,
                              color: header,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
