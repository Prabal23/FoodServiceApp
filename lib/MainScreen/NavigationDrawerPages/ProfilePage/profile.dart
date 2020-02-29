import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodpanda_app/MainScreen/RegisterPage/registerPage.dart';
import 'package:intl/intl.dart';

import '../../../main.dart';

class ProfileViewPage extends StatefulWidget {
  @override
  _ProfileViewPageState createState() => new _ProfileViewPageState();
}

class _ProfileViewPageState extends State<ProfileViewPage> {
  int _current = 0;
  int _isBack = 0;
  String result = '';

  @override
  void initState() {
    isLoggedin
        ? Container()
        : WidgetsBinding.instance.addPostFrameCallback((_) async {
            await showDialogBox();
          });
    if (isLoggedin) {
      _current = 1;
    }
    super.initState();
  }

  Future<Null> showDialogBox() async {
    return showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            content: SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Container(
                    color: Colors.transparent,
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(top: 35),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(top: 25),
                                child: Text(
                                  "Sign in to your account",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Oswald',
                                      fontWeight: FontWeight.w400),
                                )),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 0.2, color: Colors.grey)),
                              child: TextFormField(
                                autofocus: false,
                                style: TextStyle(fontSize: 14),
                                decoration: InputDecoration(
                                  icon: Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: const Icon(
                                      Icons.email,
                                      color: Colors.black38,
                                      size: 17,
                                    ),
                                  ),
                                  hintText: 'Email',
                                  hintStyle: TextStyle(fontSize: 14),
                                  //labelText: 'Enter E-mail',
                                  contentPadding:
                                      EdgeInsets.fromLTRB(0.0, 5.0, 20.0, 5.0),
                                  border: InputBorder.none,
                                ),
                                validator: (val) =>
                                    val.isEmpty ? 'Field is empty' : null,
                                onSaved: (val) => result = val,
                                //validator: _validateEmail,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.only(top: 5),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 0.2, color: Colors.grey)),
                              child: TextFormField(
                                autofocus: false,
                                obscureText: true,
                                style: TextStyle(fontSize: 14),
                                decoration: InputDecoration(
                                  icon: Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: const Icon(
                                      Icons.lock,
                                      color: Colors.black38,
                                      size: 17,
                                    ),
                                  ),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(fontSize: 14),

                                  //labelText: 'Enter E-mail',
                                  contentPadding:
                                      EdgeInsets.fromLTRB(0.0, 5.0, 20.0, 5.0),
                                  border: InputBorder.none,
                                ),
                                validator: (val) =>
                                    val.isEmpty ? 'Field is empty' : null,
                                onSaved: (val) => result = val,
                                //validator: _validateEmail,
                              ),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          Navigator.of(context).pop();
                                          _current = 1;
                                        });
                                      },
                                      child: Container(
                                          padding: EdgeInsets.all(10),
                                          margin: EdgeInsets.only(
                                              left: 0,
                                              right: 0,
                                              top: 10,
                                              bottom: 0),
                                          decoration: BoxDecoration(
                                              color: header,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
                                          child: Text(
                                            "Submit",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontFamily: 'BebasNeue',
                                            ),
                                            textAlign: TextAlign.center,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                    left: 0, top: 15, bottom: 0),
                                child: Text(
                                  "Forget password?",
                                  style: TextStyle(
                                      color: header,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                child: Text(
                              "Don't have an account?",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300),
                            )),
                            GestureDetector(
                              onTap: () {
                                //Navigator.of(context).pop();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()),
                                );
                              },
                              child: Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                                        color: header,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                    padding: EdgeInsets.all(5.0),
                    child: Container(
                      decoration: new BoxDecoration(
                          color: Colors.white, // border color
                          shape: BoxShape.circle,
                          border: Border.all(color: header, width: 0.8)),
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Colors.white,
                        //backgroundImage: AssetImage('assets/meal1.png'),
                        child: Image.asset(
                          'assets/meal1.png',
                          fit: BoxFit.fill,
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                    decoration: new BoxDecoration(
                      color: Colors.white, // border color
                      shape: BoxShape.circle,
                      //border: Border.all(color: header, width: 0.8)
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return _current == 0
        ? Container()
        : Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                child: new Container(
                    padding: EdgeInsets.all(0.0),
                    //color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                padding: EdgeInsets.all(1.0),
                                child: CircleAvatar(
                                  radius: 30.0,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: isLoggedin
                                      ? AssetImage('assets/user.jpg')
                                      : AssetImage('assets/user.png'),
                                ),
                                decoration: new BoxDecoration(
                                  color: Colors.grey, // border color
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Hello,",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black38),
                                  ),
                                  Text(
                                    "John Smith",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 20),
                            height: 2,
                            child: Divider()),
                        Container(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.home,
                                  color: header,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(left: 8),
                                        child: Text(
                                          'Address',
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                          margin:
                                              EdgeInsets.only(left: 8, top: 3),
                                          child: Text(
                                            "New York, USA",
                                            style: TextStyle(
                                                color: Colors.black38,
                                                fontSize: 15),
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 0),
                            height: 2,
                            child: Divider()),
                        Container(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.phone,
                                  color: header,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(left: 8),
                                        child: Text(
                                          'Phone Number',
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                          margin:
                                              EdgeInsets.only(left: 8, top: 3),
                                          child: Text(
                                            "017XXXXXXXX",
                                            style: TextStyle(
                                                color: Colors.black38,
                                                fontSize: 15),
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 0),
                            height: 2,
                            child: Divider()),
                        Container(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.email,
                                  color: header,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(left: 8),
                                        child: Text(
                                          'Email',
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                          margin:
                                              EdgeInsets.only(left: 8, top: 3),
                                          child: Text(
                                            "john.smith@gmail.com",
                                            style: TextStyle(
                                                color: Colors.black38,
                                                fontSize: 15),
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ],
                    )),
              ),
            ),
          );
  }
}
