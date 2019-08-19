import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:foodpanda_app/homepage.dart';
import 'dart:async';
import 'package:foodpanda_app/main.dart';
//import 'package:login_page/login_page.dart';

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
    // controller =
    //     AnimationController(duration: const Duration(seconds: 0), vsync: this);
    // animation = Tween<double>(begin: 0, end: 250).animate(controller)
    //   ..addListener(() {
    //     setState(() {
    //       loadData();
    //       // The state that has changed here is the animation object’s value.
    //     });
    //   });
    // controller.forward();
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
              child: Image.asset('assets/foodpanda_bd.jpg'),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: header,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                    //height: animation.value,
                    //width: animation.value,
                    child: logo),
                    
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Food Panda", style: TextStyle(color: Colors.white, fontSize: 20)),
                  ],
                ),
                // SizedBox(height: 15),
                // new CircularProgressIndicator(
                //   valueColor:
                //       AlwaysStoppedAnimation<Color>(Colors.white70),
                // ),
                // SizedBox(height: 20),
              ],
            ),
          ),
        ),

        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/logo.png'),
        //     fit: BoxFit.cover
        //   ) ,
        // ),
        // child: Center(
        //   child: CircularProgressIndicator(
        //     valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
        //   ),
        // ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }
}
