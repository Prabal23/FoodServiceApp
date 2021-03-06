import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:foodpanda_app/MainScreen/AddressAddEditPage/address_add_edit.dart';
import 'package:foodpanda_app/MainScreen/AddressEditPage/AddressEditPage.dart';
import 'package:foodpanda_app/MainScreen/OrderDetailsPage/order_details.dart';
import 'package:foodpanda_app/MainScreen/RegisterPage/registerPage.dart';
import 'package:foodpanda_app/main.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  bool internet = true;
  String result = '';
  int loc = 1, loc1 = 0;
  int _current = 0;
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
    internetCheck();
    super.initState();
  }

  void internetCheck() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      //print("Connected to Mobile Network");
      setState(() {
        internet = true;
      });
    } else if (connectivityResult == ConnectivityResult.wifi) {
      //print("Connected to WiFi");
      setState(() {
        internet = true;
      });
    } else {
      setState(() {
        internet = false;
      });
    }
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
            body: Container(
              padding: EdgeInsets.only(bottom: 0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: internet
                        ? Container(
                            margin: EdgeInsets.only(
                              left: 0,
                              right: 0,
                            ),
                            color: sub_white,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(left: 5, right: 5),
                            //height: MediaQuery.of(context).size.height,
                            child: OrientationBuilder(
                              builder: (context, orientation) {
                                return orientation == Orientation.portrait
                                    ? ListView.builder(
                                        itemBuilder:
                                            (BuildContext context, int index) =>
                                                new Padding(
                                          padding: const EdgeInsets.all(0.0),
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                bottom: 5,
                                                top: 5,
                                                left: 2.5,
                                                right: 2.5),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              //border: Border.all(width: 0.5, color: Colors.grey),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 1.0,
                                                  color: Colors.black
                                                      .withOpacity(.5),
                                                  //offset: Offset(6.0, 7.0),
                                                ),
                                              ],
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AddressAddEditDialog()),
                                                );
                                              },
                                              child: ListTile(
                                                title: Stack(
                                                  children: <Widget>[
                                                    Container(
                                                      //width: 100,
                                                      padding: EdgeInsets.only(
                                                          bottom: 10, top: 10),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: <Widget>[
                                                          Expanded(
                                                            child: Container(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: <
                                                                    Widget>[
                                                                  Container(
                                                                      //margin: EdgeInsets.only(top: 10),
                                                                      //padding: EdgeInsets.all(10),
                                                                      child:
                                                                          Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: <
                                                                        Widget>[
                                                                      Row(
                                                                        children: <
                                                                            Widget>[
                                                                          addressList[index]['type'] == 'Home'
                                                                              ? Icon(
                                                                                  Icons.home,
                                                                                  color: header,
                                                                                  size: 17,
                                                                                )
                                                                              : addressList[index]['type'] == 'Work'
                                                                                  ? Icon(
                                                                                      Icons.work,
                                                                                      color: header,
                                                                                      size: 17,
                                                                                    )
                                                                                  : Icon(
                                                                                      Icons.add_circle,
                                                                                      color: header,
                                                                                      size: 17,
                                                                                    ),
                                                                          SizedBox(
                                                                            width:
                                                                                5,
                                                                          ),
                                                                          Text(
                                                                            addressList[index]['type'],
                                                                            style:
                                                                                TextStyle(color: Colors.black45, fontSize: 15),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                22.5,
                                                                            top:
                                                                                6),
                                                                        child:
                                                                            Text(
                                                                          "House/Plot: " +
                                                                              addressList[index]['house'] +
                                                                              "\nStreet/Road: " +
                                                                              addressList[index]['road'] +
                                                                              "\nArea: " +
                                                                              addressList[index]['area'] +
                                                                              "\nBlock/Sector: " +
                                                                              addressList[index]['block'] +
                                                                              "\nFloor/Flat: " +
                                                                              addressList[index]['flat'],
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 12),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  )),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: <
                                                                  Widget>[
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              AddressEditDialog(addressList[index], index)),
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    margin: EdgeInsets.only(
                                                                        left: 5,
                                                                        right:
                                                                            0,
                                                                        top: 0),
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(5),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(5.0)),
                                                                    ),
                                                                    child: Row(
                                                                      children: <
                                                                          Widget>[
                                                                        Icon(
                                                                          Icons
                                                                              .mode_edit,
                                                                          color:
                                                                              header,
                                                                          size:
                                                                              18,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      addressList
                                                                          .removeAt(
                                                                              index);
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    margin: EdgeInsets.only(
                                                                        left: 5,
                                                                        right:
                                                                            0,
                                                                        top: 0),
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(5),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(5.0)),
                                                                    ),
                                                                    child: Row(
                                                                      children: <
                                                                          Widget>[
                                                                        Icon(
                                                                          Icons
                                                                              .delete,
                                                                          color:
                                                                              header,
                                                                          size:
                                                                              18,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        itemCount: addressList.length,
                                      )
                                    : GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio:
                                              (MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2) /
                                                  (MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      2.5),
                                        ),
                                        //scrollDirection: Axis.horizontal,
                                        itemBuilder:
                                            (BuildContext context, int index) =>
                                                new Padding(
                                          padding: const EdgeInsets.all(0.0),
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                bottom: 5,
                                                top: 5,
                                                left: 2.5,
                                                right: 2.5),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              //border: Border.all(width: 0.5, color: Colors.grey),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 1.0,
                                                  color: Colors.black
                                                      .withOpacity(.5),
                                                  //offset: Offset(6.0, 7.0),
                                                ),
                                              ],
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AddressAddEditDialog()),
                                                );
                                              },
                                              child: ListTile(
                                                title: Stack(
                                                  children: <Widget>[
                                                    Container(
                                                      //width: 100,
                                                      padding: EdgeInsets.only(
                                                          bottom: 10, top: 10),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: <Widget>[
                                                          Expanded(
                                                            child: Container(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: <
                                                                    Widget>[
                                                                  Container(
                                                                      //margin: EdgeInsets.only(top: 10),
                                                                      //padding: EdgeInsets.all(10),
                                                                      child:
                                                                          Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: <
                                                                        Widget>[
                                                                      Row(
                                                                        children: <
                                                                            Widget>[
                                                                          addressList[index]['type'] == 'Home'
                                                                              ? Icon(
                                                                                  Icons.home,
                                                                                  color: header,
                                                                                  size: 17,
                                                                                )
                                                                              : addressList[index]['type'] == 'Work'
                                                                                  ? Icon(
                                                                                      Icons.work,
                                                                                      color: header,
                                                                                      size: 17,
                                                                                    )
                                                                                  : Icon(
                                                                                      Icons.add_circle,
                                                                                      color: header,
                                                                                      size: 17,
                                                                                    ),
                                                                          SizedBox(
                                                                            width:
                                                                                5,
                                                                          ),
                                                                          Text(
                                                                            addressList[index]['type'],
                                                                            style:
                                                                                TextStyle(color: Colors.black45, fontSize: 15),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                22.5,
                                                                            top:
                                                                                6),
                                                                        child:
                                                                            Text(
                                                                          "House/Plot: " +
                                                                              addressList[index]['house'] +
                                                                              "\nStreet/Road: " +
                                                                              addressList[index]['road'] +
                                                                              "\nArea: " +
                                                                              addressList[index]['area'] +
                                                                              "\nBlock/Sector: " +
                                                                              addressList[index]['block'] +
                                                                              "\nFloor/Flat: " +
                                                                              addressList[index]['flat'],
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 12),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  )),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: <
                                                                  Widget>[
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              AddressAddEditDialog()),
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    margin: EdgeInsets.only(
                                                                        left: 5,
                                                                        right:
                                                                            0,
                                                                        top: 0),
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(5),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(5.0)),
                                                                    ),
                                                                    child: Row(
                                                                      children: <
                                                                          Widget>[
                                                                        Icon(
                                                                          Icons
                                                                              .mode_edit,
                                                                          color:
                                                                              header,
                                                                          size:
                                                                              18,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {},
                                                                  child:
                                                                      Container(
                                                                    margin: EdgeInsets.only(
                                                                        left: 5,
                                                                        right:
                                                                            0,
                                                                        top: 0),
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(5),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(5.0)),
                                                                    ),
                                                                    child: Row(
                                                                      children: <
                                                                          Widget>[
                                                                        Icon(
                                                                          Icons
                                                                              .delete,
                                                                          color:
                                                                              header,
                                                                          size:
                                                                              18,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        itemCount: addressList.length,
                                      );
                              },
                            ))
                        : SingleChildScrollView(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      //height: 180,
                                      child: Center(
                                        child: Container(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Image.asset(
                                            'assets/no_net.jpg',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child: Text("No network!",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold))),
                                    Container(
                                        margin:
                                            EdgeInsets.only(top: 0, bottom: 10),
                                        child: Text(
                                            "No internet connection\nCheck the connection of the network",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black38))),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: header,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.refresh,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "Retry",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                  )
                ],
              ),
            ),
          );
  }

  void placeFinder() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: Center(
            child: Stack(children: <Widget>[
              Column(
                children: <Widget>[
                  // Container(
                  //   //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                  //   padding: EdgeInsets.all(1.0),
                  //   child: CircleAvatar(
                  //     radius: 20.0,
                  //     backgroundColor: Colors.transparent,
                  //     backgroundImage: AssetImage('assets/foodpanda_bd.jpg'),
                  //   ),
                  //   decoration: new BoxDecoration(
                  //     color: Colors.grey, // border color
                  //     shape: BoxShape.circle,
                  //   ),
                  // ),
                  // Container(
                  //     margin: EdgeInsets.only(top: 10),
                  //     //padding: EdgeInsets.all(10),
                  //     child: Text(
                  //       "Select Location",
                  //       maxLines: 2,
                  //       overflow: TextOverflow.ellipsis,
                  //       textAlign: TextAlign.center,
                  //       style: TextStyle(
                  //         color: header,
                  //         fontSize: 18,
                  //       ),
                  //     )),
                  //Divider(),
                  Container(
                    //margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              loc = 1;
                              loc1 = 0;
                            });
                            Navigator.of(context).pop();
                          },
                          child: Container(
                              margin: EdgeInsets.only(top: 10),
                              //padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.my_location,
                                        color: header,
                                        size: 17,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Current Location",
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  (loc == 1 && loc1 == 0)
                                      ? Container(
                                          margin: EdgeInsets.only(
                                              left: 22.5, top: 6),
                                          child: Text(
                                            "Modina Market, Sylhet",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12),
                                          ),
                                        )
                                      : Container(),
                                ],
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              loc = 1;
                              loc1 = 0;
                            });
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            //margin: EdgeInsets.only(left: 0, right: 5),
                            child: Container(
                              //margin: EdgeInsets.only(right: 5),
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  color: (loc == 1 && loc1 == 0)
                                      ? Colors.white
                                      : Colors.white),
                              child: Icon(Icons.done,
                                  size: 18,
                                  color: (loc == 1 && loc1 == 0)
                                      ? header
                                      : Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Container(margin: EdgeInsets.only(top: 10), child: Divider()),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              loc1 = 1;
                              loc = 0;
                            });
                            Navigator.of(context).pop();
                          },
                          child: Container(
                              //margin: EdgeInsets.only(top: 10),
                              //padding: EdgeInsets.all(10),
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.home,
                                    color: header,
                                    size: 17,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Home",
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 15),
                                  ),
                                ],
                              ),
                              (loc1 == 1 && loc == 0)
                                  ? Container(
                                      margin:
                                          EdgeInsets.only(left: 22.5, top: 6),
                                      child: Text(
                                        "Kastoghar, Sylhet",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 12),
                                      ),
                                    )
                                  : Container(),
                            ],
                          )),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              loc1 = 1;
                              loc = 0;
                            });
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            //margin: EdgeInsets.only(left: 0, right: 5),
                            child: Container(
                              //margin: EdgeInsets.only(right: 5),
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  color: (loc1 == 1 && loc == 0)
                                      ? Colors.white
                                      : Colors.white),
                              child: Icon(Icons.done,
                                  size: 18,
                                  color: (loc1 == 1 && loc == 0)
                                      ? header
                                      : Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Divider(color: Colors.black26)),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  EdgeInsets.only(left: 0, right: 5, top: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  color: header,
                                  border: Border.all(
                                      width: 0.2, color: Colors.grey)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.cancel,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text("Cancel",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14)))
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  EdgeInsets.only(left: 5, right: 0, top: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  color: header,
                                  border: Border.all(
                                      width: 0.2, color: Colors.grey)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text("Add",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14)))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: <Widget>[
              //     GestureDetector(
              //       onTap: () {
              //         Navigator.of(context).pop();
              //       },
              //       child: Container(
              //           //padding: EdgeInsets.all(5),
              //           child: Icon(
              //         Icons.cancel,
              //         color: Colors.grey[400],
              //       )),
              //     ),
              //   ],
              // )
            ]),
          ),
        );
      },
    );
  }
}
