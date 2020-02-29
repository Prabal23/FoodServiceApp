import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:foodpanda_app/MainScreen/OrderDetailsPage/order_details.dart';
import 'package:foodpanda_app/MainScreen/RegisterPage/registerPage.dart';
import 'package:foodpanda_app/main.dart';

class VoucherPage extends StatefulWidget {
  @override
  _VoucherPageState createState() => _VoucherPageState();
}

class _VoucherPageState extends State<VoucherPage> {
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
            body: new DefaultTabController(
              length: 2,
              child: new Scaffold(
                appBar: new AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  actions: <Widget>[],
                  title: new TabBar(
                    labelColor: header,
                    labelStyle: TextStyle(fontSize: 15),
                    tabs: [new Tab(text: "Recent"), new Tab(text: "Past")],
                    indicatorColor: header,
                    unselectedLabelColor: Colors.grey,
                  ),
                ),
                body: new TabBarView(
                  children: [
                    Container(
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
                                          itemBuilder: (BuildContext context,
                                                  int index) =>
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
                                                  // Navigator.push(
                                                  //   context,
                                                  //   MaterialPageRoute(
                                                  //       builder: (context) =>
                                                  //           OrderDetailsPage()),
                                                  // );
                                                },
                                                child: ListTile(
                                                  title: Stack(
                                                    children: <Widget>[
                                                      Container(
                                                        //width: 100,
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 10,
                                                                top: 10),
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
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: <
                                                                            Widget>[
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.of(context).size.width,
                                                                              child: Text(
                                                                                index % 2 == 0 ? "Bhasha21" : "Shadhinota_26",
                                                                                maxLines: 1,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                style: TextStyle(
                                                                                  fontSize: 16,
                                                                                  color: Colors.black,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets.only(
                                                                          left:
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: <
                                                                            Widget>[
                                                                          //Icon(Icons.label_important, size: 15, color: header,),
                                                                          Container(
                                                                            margin:
                                                                                EdgeInsets.only(left: 0),
                                                                            child: Text("Voucher Number : ",
                                                                                maxLines: 1,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                style: TextStyle(fontSize: 14, color: Colors.grey)),
                                                                          ),
                                                                          Container(
                                                                            margin:
                                                                                EdgeInsets.only(left: 0),
                                                                            child: Text(index % 2 == 0 ? "#09sd32j" : "#345kjd3",
                                                                                maxLines: 1,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                style: TextStyle(fontSize: 14, color: Colors.black54)),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets.only(
                                                                          right:
                                                                              0,
                                                                          top:
                                                                              5,
                                                                          bottom:
                                                                              10),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: <
                                                                            Widget>[
                                                                          Icon(
                                                                            Icons.monetization_on,
                                                                            size:
                                                                                13,
                                                                            color:
                                                                                header,
                                                                          ),
                                                                          Container(
                                                                            margin:
                                                                                EdgeInsets.only(left: 3),
                                                                            child: Text(index % 2 == 0 ? "Discount : 150/1000" : "Discount : 100/850",
                                                                                maxLines: 1,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                style: TextStyle(fontSize: 12, color: Colors.grey[700], fontWeight: FontWeight.bold)),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: <
                                                                            Widget>[
                                                                          Container(
                                                                            //color: Colors.red,
                                                                            margin: EdgeInsets.only(
                                                                                right: 8,
                                                                                top: 0,
                                                                                bottom: 0,
                                                                                left: 0),
                                                                            child:
                                                                                Row(
                                                                              children: <Widget>[
                                                                                Icon(
                                                                                  Icons.calendar_today,
                                                                                  size: 13,
                                                                                  color: header,
                                                                                ),
                                                                                Container(
                                                                                  margin: EdgeInsets.only(left: 4),
                                                                                  child: Text(index % 2 == 0 ? "Valid : 20/07/2019 12:00 PM" : "Valid : 28/07/2019 2:00 PM", style: TextStyle(color: Colors.grey[600], fontSize: 11)),
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
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          itemCount: 2,
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
                                          itemBuilder: (BuildContext context,
                                                  int index) =>
                                              new Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  bottom: 0,
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
                                                            OrderDetailsPage()),
                                                  );
                                                },
                                                child: GridTile(
                                                  child: Stack(
                                                    children: <Widget>[
                                                      Container(
                                                        //width: 100,
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 0,
                                                                top: 0,
                                                                left: 15,
                                                                right: 10),
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
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: <
                                                                            Widget>[
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.of(context).size.width,
                                                                              child: Text(
                                                                                index % 2 == 0 ? "Voucher Name" : "Voucher Name from List",
                                                                                maxLines: 1,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                style: TextStyle(
                                                                                  fontSize: 16,
                                                                                  color: Colors.black,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets.only(
                                                                          left:
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: <
                                                                            Widget>[
                                                                          //Icon(Icons.label_important, size: 15, color: header,),
                                                                          Container(
                                                                            margin:
                                                                                EdgeInsets.only(left: 0),
                                                                            child: Text("Voucher Number : ",
                                                                                maxLines: 1,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                style: TextStyle(fontSize: 14, color: Colors.grey)),
                                                                          ),
                                                                          Container(
                                                                            margin:
                                                                                EdgeInsets.only(left: 0),
                                                                            child: Text(index % 2 == 0 ? "#09sd32j" : "#345kjd3",
                                                                                maxLines: 1,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                style: TextStyle(fontSize: 14, color: Colors.black54)),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets.only(
                                                                          right:
                                                                              0,
                                                                          top:
                                                                              5,
                                                                          bottom:
                                                                              10),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: <
                                                                            Widget>[
                                                                          Icon(
                                                                            Icons.monetization_on,
                                                                            size:
                                                                                13,
                                                                            color:
                                                                                header,
                                                                          ),
                                                                          Container(
                                                                            margin:
                                                                                EdgeInsets.only(left: 3),
                                                                            child: Text(index % 2 == 0 ? "Discount : 150/1000" : "Discount : 100/850",
                                                                                maxLines: 1,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                style: TextStyle(fontSize: 12, color: Colors.grey[700], fontWeight: FontWeight.bold)),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: <
                                                                            Widget>[
                                                                          Container(
                                                                            //color: Colors.red,
                                                                            margin: EdgeInsets.only(
                                                                                right: 8,
                                                                                top: 0,
                                                                                bottom: 0,
                                                                                left: 0),
                                                                            child:
                                                                                Row(
                                                                              children: <Widget>[
                                                                                Icon(
                                                                                  Icons.calendar_today,
                                                                                  size: 13,
                                                                                  color: header,
                                                                                ),
                                                                                Container(
                                                                                  margin: EdgeInsets.only(left: 4),
                                                                                  child: Text(index % 2 == 0 ? "Valid : 20/07/2019 12:00 PM" : "Valid : 28/07/2019 2:00 PM", style: TextStyle(color: Colors.grey[600], fontSize: 11)),
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
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          itemCount: 5,
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
                                        width:
                                            MediaQuery.of(context).size.width,
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
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Container(
                                          margin: EdgeInsets.only(
                                              top: 0, bottom: 10),
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
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                    ),
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(bottom: 0),
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              //color: Colors.white,
                              // decoration: BoxDecoration(
                              //   boxShadow: [
                              //     BoxShadow(
                              //       blurRadius: 1.0,
                              //       color: Colors.black.withOpacity(.5),
                              //       //offset: Offset(6.0, 7.0),
                              //     ),
                              //   ],
                              //   //shape: BoxShape.rectangle,
                              //   //border: Border.all(),
                              //   color: sub_white,
                              // ),
                              child: Center(
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 145,
                                        width: 100,
                                        child: Center(
                                          child: Container(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Image.asset(
                                              'assets/coupon.png',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          child: Text("No vouchers yet!",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black54,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Container(
                                          margin: EdgeInsets.only(
                                              top: 0, bottom: 10),
                                          child: Text(
                                              "It seems you have no vouhers yet\nYou can refer a friend to get your first one.",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black38))),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            // body: Container(
            //   color: Colors.white,
            //   padding: EdgeInsets.only(bottom: 0),
            //   child: Column(
            //     children: <Widget>[
            //       Center(
            //         child: Container(
            //           margin: EdgeInsets.all(10), padding: EdgeInsets.all(10),
            //           //color: Colors.white,
            //           decoration: BoxDecoration(
            //             boxShadow: [
            //               BoxShadow(
            //                 blurRadius: 1.0,
            //                 color: Colors.black.withOpacity(.5),
            //                 //offset: Offset(6.0, 7.0),
            //               ),
            //             ],
            //             //shape: BoxShape.rectangle,
            //             //border: Border.all(),
            //             color: sub_white,
            //           ),
            //           child: Center(
            //             child: Container(
            //               child: Column(
            //                 children: <Widget>[
            //                   Container(
            //                     width: MediaQuery.of(context).size.width,
            //                     height: 180,
            //                     child: Center(
            //                       child: Container(
            //                         padding: const EdgeInsets.all(3.0),
            //                         child: Image.asset(
            //                           'assets/voucher.jpg',
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                   Container(
            //                       margin: EdgeInsets.only(top: 0, bottom: 10),
            //                       child: Text("No Vouchers Yet",
            //                           style: TextStyle(
            //                               fontSize: 20, color: Colors.black54))),
            //                   Container(
            //                       margin: EdgeInsets.only(top: 10, bottom: 10),
            //                       child: Text("It seems you have no vouhers yet. You Can refer a friend to get your first one.",
            //                       textAlign: TextAlign.center,
            //                           style: TextStyle(
            //                               fontSize: 14, color: Colors.grey)))
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
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
