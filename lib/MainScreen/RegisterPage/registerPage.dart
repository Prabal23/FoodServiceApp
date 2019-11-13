import 'package:flutter/material.dart';

import '../../main.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String email = "", pass = "", name = "", adderss = "";
  String loginEmail = "", loginPass = "";

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
                                onSaved: (val) => loginEmail = val,
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
                                onSaved: (val) => loginPass = val,
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
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/bikroy.png'),
                    ),
                    decoration: new BoxDecoration(
                      color: Colors.white, // border color
                      shape: BoxShape.circle,
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
    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(color: header),
        backgroundColor: Colors.white,
        title: Center(
          child: Container(
            child: Container(
              margin: EdgeInsets.only(top: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("Sign up",
                      style: TextStyle(fontSize: 17, color: Colors.black54)),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Colors.white,
                    border: Border.all(width: 0.2, color: Colors.grey)),
                child: TextFormField(
                  autofocus: false,
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    icon: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: const Icon(
                        Icons.supervisor_account,
                        color: Colors.black38,
                        size: 17,
                      ),
                    ),
                    hintText: 'Name',
                    hintStyle: TextStyle(fontSize: 14),
                    //labelText: 'Enter E-mail',
                    contentPadding: EdgeInsets.fromLTRB(0.0, 5.0, 20.0, 5.0),
                    border: InputBorder.none,
                  ),
                  validator: (val) => val.isEmpty ? 'Field is empty' : null,
                  onSaved: (val) => name = val,
                  //validator: _validateEmail,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Colors.white,
                    border: Border.all(width: 0.2, color: Colors.grey)),
                child: TextFormField(
                  autofocus: false,
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    icon: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: const Icon(
                        Icons.location_on,
                        color: Colors.black38,
                        size: 17,
                      ),
                    ),
                    hintText: 'Address',
                    hintStyle: TextStyle(fontSize: 14),
                    //labelText: 'Enter E-mail',
                    contentPadding: EdgeInsets.fromLTRB(0.0, 5.0, 20.0, 5.0),
                    border: InputBorder.none,
                  ),
                  validator: (val) => val.isEmpty ? 'Field is empty' : null,
                  onSaved: (val) => adderss = val,
                  //validator: _validateEmail,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Colors.white,
                    border: Border.all(width: 0.2, color: Colors.grey)),
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
                    contentPadding: EdgeInsets.fromLTRB(0.0, 5.0, 20.0, 5.0),
                    border: InputBorder.none,
                  ),
                  validator: (val) => val.isEmpty ? 'Field is empty' : null,
                  onSaved: (val) => email = val,
                  //validator: _validateEmail,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Colors.white,
                    border: Border.all(width: 0.2, color: Colors.grey)),
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
                    contentPadding: EdgeInsets.fromLTRB(0.0, 5.0, 20.0, 5.0),
                    border: InputBorder.none,
                  ),
                  validator: (val) => val.isEmpty ? 'Field is empty' : null,
                  onSaved: (val) => pass = val,
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
                          });
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(
                                left: 0, right: 0, top: 10, bottom: 0),
                            decoration: BoxDecoration(
                                color: header,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
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
                      "Already have an account?",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                          fontWeight: FontWeight.w300),
                    )),
                    GestureDetector(
                      onTap: () {
                        showDialogBox();
                      },
                      child: Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text(
                            "Sign in",
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
        ),
      ),
    );
  }
}
