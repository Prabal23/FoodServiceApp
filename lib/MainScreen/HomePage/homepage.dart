import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:foodpanda_app/MainScreen/AddressAddEditPage/address_add_edit.dart';
import 'package:foodpanda_app/MainScreen/FilterPage/filterPage.dart';
import 'package:foodpanda_app/MainScreen/NavigationDrawerPages/AddressPage/address.dart';
import 'package:foodpanda_app/MainScreen/NavigationDrawerPages/CartPage/cartPage.dart';
import 'package:foodpanda_app/MainScreen/NavigationDrawerPages/FoodPage/foodPage.dart';
import 'package:foodpanda_app/MainScreen/NavigationDrawerPages/OrderListPage/orderlist.dart';
import 'package:foodpanda_app/MainScreen/NavigationDrawerPages/ProfilePage/profile.dart';
import 'package:foodpanda_app/MainScreen/NavigationDrawerPages/SettingsPage/settingsPage.dart';
import 'package:foodpanda_app/MainScreen/NavigationDrawerPages/TermsConPage/termsConPage.dart';
import 'package:foodpanda_app/MainScreen/NavigationDrawerPages/VoucherPage/vouchers.dart';
import 'package:foodpanda_app/MainScreen/ProfileEditPage/profileEditPage.dart';
import 'package:foodpanda_app/main.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool internet = true, isFocused = false;
  String result = '';
  int loc = 1, loc1 = 0;
  int currentIndex = selectedPage;
  final pageOptions = [
    FoodPage(),
    ProfileViewPage(),
    OrderListPage(),
    AddressPage(),
    VoucherPage(),
    SettingsPage(),
    TermsConPage(),
    CartPage(0),
  ];

  @override
  void initState() {
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

  @override
  Widget build(BuildContext context) {
    Drawer drawer = new Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          //color: Colors.red,
                          margin: EdgeInsets.only(left: 10, right: 0, top: 0),
                          padding: EdgeInsets.only(right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                padding: EdgeInsets.all(1.0),
                                child: CircleAvatar(
                                  radius: 30.0,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage:
                                      AssetImage('assets/user.png'),
                                ),
                                decoration: new BoxDecoration(
                                  color: Colors.grey, // border color
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Hello,",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black38),
                                    ),
                                    Text(
                                      "John Smith",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Container(
                      //     margin: EdgeInsets.only(right: 15),
                      //     child: Icon(Icons.chevron_right)),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Divider(color: Colors.grey[300])),
                Container(
                  margin: EdgeInsets.only(right: 20, top: 0),
                  decoration: currentIndex == 0
                      ? BoxDecoration(
                          color: header.withOpacity(0.1),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(100),
                              bottomRight: Radius.circular(100)))
                      : BoxDecoration(),
                  child: new ListTile(
                      leading: new Icon(Icons.home,
                          color: currentIndex == 0 ? header : Colors.black54),
                      title: new Text(
                        'Home',
                        style: TextStyle(
                            color: currentIndex == 0 ? header : Colors.black54),
                      ),
                      onTap: () => {
                            Navigator.pop(context),
                            setState(() {
                              currentIndex = 0;
                              selectedPage = 0;
                            })
                          }),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20, top: 0),
                  decoration: currentIndex == 1
                      ? BoxDecoration(
                          color: header.withOpacity(0.1),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(100),
                              bottomRight: Radius.circular(100)))
                      : BoxDecoration(),
                  child: new ListTile(
                      leading: new Icon(
                        Icons.account_box,
                        color: currentIndex == 1 ? header : Colors.black54,
                      ),
                      title: new Text(
                        'Profile',
                        style: TextStyle(
                            color: currentIndex == 1 ? header : Colors.black54),
                      ),
                      onTap: () => {
                            Navigator.pop(context),
                            setState(() {
                              currentIndex = 1;
                              selectedPage = 1;
                            })
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => ProfileViewPage()),
                            // )
                          }),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20, top: 0),
                  decoration: currentIndex == 7
                      ? BoxDecoration(
                          color: header.withOpacity(0.1),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(100),
                              bottomRight: Radius.circular(100)))
                      : BoxDecoration(),
                  child: new ListTile(
                      leading: new Icon(
                        Icons.shopping_cart,
                        color: currentIndex == 7 ? header : Colors.black54,
                      ),
                      title: new Text(
                        'Cart',
                        style: TextStyle(
                            color: currentIndex == 7 ? header : Colors.black54),
                      ),
                      trailing: Container(
                          child: new Text(
                        "8",
                        style: TextStyle(color: header),
                      )),
                      onTap: () => {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => OrderListPage()),
                            // )
                            Navigator.pop(context),
                            setState(() {
                              currentIndex = 7;
                              selectedPage = 7;
                            })
                          }),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20, top: 0),
                  decoration: currentIndex == 2
                      ? BoxDecoration(
                          color: header.withOpacity(0.1),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(100),
                              bottomRight: Radius.circular(100)))
                      : BoxDecoration(),
                  child: new ListTile(
                      leading: new Icon(
                        Icons.list,
                        color: currentIndex == 2 ? header : Colors.black54,
                      ),
                      title: new Text(
                        'Orders',
                        style: TextStyle(
                            color: currentIndex == 2 ? header : Colors.black54),
                      ),
                      trailing: Container(
                          child: new Text(
                        "5",
                        style: TextStyle(color: header),
                      )),
                      onTap: () => {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => OrderListPage()),
                            // )
                            Navigator.pop(context),
                            setState(() {
                              currentIndex = 2;
                              selectedPage = 2;
                            })
                          }),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20, top: 0),
                  decoration: currentIndex == 3
                      ? BoxDecoration(
                          color: header.withOpacity(0.1),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(100),
                              bottomRight: Radius.circular(100)))
                      : BoxDecoration(),
                  child: new ListTile(
                      leading: new Icon(
                        Icons.location_on,
                        color: currentIndex == 3 ? header : Colors.black54,
                      ),
                      title: new Text(
                        'Addresses',
                        style: TextStyle(
                            color: currentIndex == 3 ? header : Colors.black54),
                      ),
                      trailing: Container(
                          child: new Text(
                        "2",
                        style: TextStyle(color: header),
                      )),
                      onTap: () => {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => AddressPage()),
                            // )
                            Navigator.pop(context),
                            setState(() {
                              currentIndex = 3;
                              selectedPage = 3;
                            })
                          }),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20, top: 0),
                  decoration: currentIndex == 4
                      ? BoxDecoration(
                          color: header.withOpacity(0.1),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(100),
                              bottomRight: Radius.circular(100)))
                      : BoxDecoration(),
                  child: new ListTile(
                      leading: new Icon(
                        Icons.book,
                        color: currentIndex == 4 ? header : Colors.black54,
                      ),
                      title: new Text(
                        'Vouchers',
                        style: TextStyle(
                            color: currentIndex == 4 ? header : Colors.black54),
                      ),
                      trailing: Container(
                          child: new Text(
                        "1",
                        style: TextStyle(color: header),
                      )),
                      onTap: () => {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => VoucherPage()),
                            // )
                            Navigator.pop(context),
                            setState(() {
                              currentIndex = 4;
                              selectedPage = 4;
                            })
                          }),
                ),
                Divider(color: Colors.grey),
                Container(
                  margin: EdgeInsets.only(right: 20, top: 0),
                  decoration: currentIndex == 5
                      ? BoxDecoration(
                          color: header.withOpacity(0.1),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(100),
                              bottomRight: Radius.circular(100)))
                      : BoxDecoration(),
                  child: new ListTile(
                    leading: new Icon(
                      Icons.settings,
                      color: currentIndex == 5 ? header : Colors.black54,
                    ),
                    title: new Text(
                      'Settings',
                      style: TextStyle(
                          color: currentIndex == 5 ? header : Colors.black54),
                    ),
                    onTap: () => {
                      Navigator.pop(context),
                      setState(() {
                        currentIndex = 5;
                        selectedPage = 5;
                      })
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20, top: 0),
                  decoration: currentIndex == 6
                      ? BoxDecoration(
                          color: header.withOpacity(0.1),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(100),
                              bottomRight: Radius.circular(100)))
                      : BoxDecoration(),
                  child: new ListTile(
                    leading: new Icon(
                      Icons.security,
                      color: currentIndex == 6 ? header : Colors.black54,
                    ),
                    title: new Text(
                      'Terms and Condition',
                      style: TextStyle(
                          color: currentIndex == 6 ? header : Colors.black54),
                    ),
                    onTap: () => {
                      Navigator.pop(context),
                      setState(() {
                        currentIndex = 6;
                        selectedPage = 6;
                      })
                    },
                  ),
                ),
                new ListTile(
                  leading:
                      new Icon(Icons.settings_power, color: Colors.black54),
                  title: new Text('Logout',
                      style: TextStyle(color: Colors.black54)),
                  onTap: () => {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
    return Scaffold(
      drawer: drawer,
      appBar: currentIndex == 0
          ? AppBar(
              iconTheme: IconThemeData(color: header),
              //automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              title: Center(
                child: Container(
                  child: Container(
                    margin: EdgeInsets.only(top: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Deliver To : ",
                            style:
                                TextStyle(fontSize: 17, color: Colors.black54)),
                        GestureDetector(
                          onTap: () {
                            placeFinder();
                          },
                          child: Container(
                            padding:
                                EdgeInsets.only(top: 5, bottom: 5, right: 5),
                            child: Text("Modina Market",
                                style: TextStyle(fontSize: 17, color: header)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : currentIndex == 1
              ? AppBar(
                  iconTheme: IconThemeData(color: header),
                  //automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  title: Center(
                    child: Container(
                      child: Container(
                        margin: EdgeInsets.only(top: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Profile",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black54)),
                            GestureDetector(
                                onTap: () {
                                  editProfile();
                                },
                                child: Container(
                                    padding: EdgeInsets.all(5),
                                    child: Icon(
                                      Icons.edit,
                                      color: header,
                                    )))
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : currentIndex == 2
                  ? AppBar(
                      iconTheme: IconThemeData(color: header),
                      //automaticallyImplyLeading: false,
                      backgroundColor: Colors.white,
                      title: Center(
                        child: Container(
                          child: Container(
                            margin: EdgeInsets.only(top: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text("My Orders",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.black54)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : currentIndex == 3
                      ? AppBar(
                          iconTheme: IconThemeData(color: header),
                          //automaticallyImplyLeading: false,
                          backgroundColor: Colors.white,
                          title: Center(
                            child: Container(
                              child: Container(
                                margin: EdgeInsets.only(top: 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("My Addresses",
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.black54)),
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AddressAddEditDialog()),
                                          );
                                        },
                                        child: Container(
                                            padding: EdgeInsets.all(5),
                                            child: Icon(
                                              Icons.add_circle_outline,
                                              color: header,
                                            )))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : currentIndex == 4
                          ? AppBar(
                              iconTheme: IconThemeData(color: header),
                              //automaticallyImplyLeading: false,
                              backgroundColor: Colors.white,
                              title: Center(
                                child: Container(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text("Vouchers",
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black54)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : currentIndex == 5
                              ? AppBar(
                                  iconTheme: IconThemeData(color: header),
                                  //automaticallyImplyLeading: false,
                                  backgroundColor: Colors.white,
                                  title: Center(
                                    child: Container(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text("Settings",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    color: Colors.black54)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : currentIndex == 6
                                  ? AppBar(
                                      iconTheme: IconThemeData(color: header),
                                      //automaticallyImplyLeading: false,
                                      backgroundColor: Colors.white,
                                      title: Center(
                                        child: Container(
                                          child: Container(
                                            margin: EdgeInsets.only(top: 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text("Terms & conditions",
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.black54)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : AppBar(
                                      iconTheme: IconThemeData(color: header),
                                      //automaticallyImplyLeading: false,
                                      backgroundColor: Colors.white,
                                      title: Center(
                                        child: Container(
                                          child: Container(
                                            margin: EdgeInsets.only(top: 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text("Cart",
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.black54)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
      body: pageOptions[currentIndex],
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddressPage()),
                              );
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

  void filterPage() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new FilterDialog();
        },
        fullscreenDialog: true));
  }

  void editProfile() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new ProfileEditDialog();
        },
        fullscreenDialog: true));
  }
}
