import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:foodpanda_app/address.dart';
import 'package:foodpanda_app/main.dart';
import 'package:foodpanda_app/orderlist.dart';
import 'package:foodpanda_app/profile.dart';
import 'package:foodpanda_app/vouchers.dart';

import 'details.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool internet = true, isFocused = false;
  String result = '';
  int loc = 1, loc1 = 0;
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
                // Container(
                //     margin: EdgeInsets.only(top: 15),
                //     child: Divider(color: Colors.grey)),
                Container(
                  margin: EdgeInsets.only(right: 20, top: 20),
                  decoration: BoxDecoration(
                      color: header.withOpacity(0.1),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(100),
                          bottomRight: Radius.circular(100))),
                  child: new ListTile(
                      leading: new Icon(Icons.home, color: header),
                      title: new Text(
                        'Home',
                        style: TextStyle(color: header),
                      ),
                      onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()),
                            )
                          }),
                ),
                new ListTile(
                    leading: new Icon(Icons.account_box),
                    title: new Text('Profile'),
                    onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileViewPage()),
                          )
                        }),
                new ListTile(
                    leading: new Icon(Icons.list),
                    title: new Text('Orders'),
                    trailing: Container(
                        margin: EdgeInsets.only(right: 15),
                        child: new Text(
                          "5",
                          style: TextStyle(color: header),
                        )),
                    onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderListPage()),
                          )
                        }),
                new ListTile(
                    leading: new Icon(Icons.location_on),
                    title: new Text('Addresses'),
                    trailing: Container(
                        margin: EdgeInsets.only(right: 15),
                        child: new Text(
                          "2",
                          style: TextStyle(color: header),
                        )),
                    onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddressPage()),
                          )
                        }),
                new ListTile(
                    leading: new Icon(Icons.book),
                    title: new Text('Vouchers'),
                    trailing: Container(
                        margin: EdgeInsets.only(right: 15),
                        child: new Text(
                          "1",
                          style: TextStyle(color: header),
                        )),
                    onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VoucherPage()),
                          )
                        }),
                Divider(color: Colors.grey),
                new ListTile(
                  leading: new Icon(Icons.settings),
                  title: new Text('Settings'),
                  onTap: () => {},
                ),
                new ListTile(
                  leading: new Icon(Icons.security),
                  title: new Text('Terms and Condition'),
                  onTap: () => {},
                ),
                new ListTile(
                  leading: new Icon(Icons.settings_power),
                  title: new Text('Logout'),
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
      appBar: AppBar(
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
                      style: TextStyle(fontSize: 17, color: Colors.black54)),
                  GestureDetector(
                    onTap: () {
                      placeFinder();
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 5, bottom: 5, right: 5),
                      child: Text("Modina Market",
                          style: TextStyle(fontSize: 17, color: header)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 0),
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(10),
                //color: Colors.white,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10.0,
                      color: Colors.black.withOpacity(.5),
                      //offset: Offset(6.0, 7.0),
                    ),
                  ],
                  //shape: BoxShape.rectangle,
                  //border: Border.all(),
                  color: Colors.white,
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: Icon(
                              Icons.search,
                              color: header,
                            )),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isFocused = true;
                                print("data");
                                print(isFocused);
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              //margin: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0.0)),
                                //color: Colors.grey[100],
                                // border:
                                //     Border.all(width: 0.2, color: Colors.grey)
                              ),
                              child: TextFormField(
                                autofocus: false,
                                decoration: InputDecoration(
                                  // icon: Container(
                                  //   margin: EdgeInsets.only(left: 10),
                                  //   child: const Icon(
                                  //     Icons.search,
                                  //     color: Colors.black38,
                                  //   ),
                                  // ),
                                  hintText: 'Search Restaurant or Cuisine...',
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
                          ),
                        ),

                        // Container(
                        //     height: 20,
                        //     margin: EdgeInsets.only(right: 10),
                        //     child: VerticalDivider(
                        //       color: Colors.grey,
                        //     )),
                        GestureDetector(
                          onTap: () {
                            filterPage();
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 5, left: 10),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.filter_list,
                                  color: header,
                                  size: 25,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            Container(
              height: 1,
              child: Divider(
                color: Colors.white,
              ),
            ),
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
                          return (orientation == Orientation.portrait)
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
                                            color: Colors.black.withOpacity(.5),
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
                                                    DetailsPage()),
                                          );
                                        },
                                        child: ListTile(
                                          title: Stack(
                                            children: <Widget>[
                                              Container(
                                                //width: 100,
                                                padding:
                                                    EdgeInsets.only(bottom: 0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: <Widget>[
                                                    Center(
                                                      child: Container(
                                                        //color: Colors.red,

                                                        padding:
                                                            const EdgeInsets
                                                                .all(0.0),
                                                        margin: EdgeInsets.only(
                                                            top: 0),
                                                        child: Image.asset(
                                                          index % 2 == 0
                                                              ? 'assets/burger.jpg'
                                                              : 'assets/roll.jpg',
                                                          height: 100,
                                                          width: 120,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 100,
                                                      child: VerticalDivider(
                                                        //indent: 2.0,
                                                        color: Colors.grey[300],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Container(
                                                              child: Text(
                                                                index % 2 == 0
                                                                    ? "Restaurant Name"
                                                                    : "Restaurant Name from list",
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    color: Colors
                                                                        .black87,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 0),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: <
                                                                    Widget>[
                                                                  //Icon(Icons.label_important, size: 15, color: header,),
                                                                  Container(
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                            left:
                                                                                0),
                                                                    child: Text(
                                                                        index % 2 == 0
                                                                            ? "Thai, Chinese"
                                                                            : "Italian, Chinese, Thai",
                                                                        maxLines:
                                                                            1,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13,
                                                                            color:
                                                                                Colors.black87)),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 8,
                                                                      left: 0),
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: <
                                                                    Widget>[
                                                                  // Container(
                                                                  //   child: Row(
                                                                  //     children: <Widget>[
                                                                  //       Icon(
                                                                  //         Icons.star,
                                                                  //         color: golden,
                                                                  //         size: 12,
                                                                  //       ),
                                                                  //       Icon(
                                                                  //         Icons.star,
                                                                  //         color: golden,
                                                                  //         size: 12,
                                                                  //       ),
                                                                  //       Icon(
                                                                  //         Icons.star,
                                                                  //         color: golden,
                                                                  //         size: 12,
                                                                  //       ),
                                                                  //       Icon(
                                                                  //         Icons.star,
                                                                  //         color: golden,
                                                                  //         size: 12,
                                                                  //       ),
                                                                  //       Icon(
                                                                  //         Icons.star,
                                                                  //         color: golden,
                                                                  //         size: 12,
                                                                  //       ),
                                                                  //     ],
                                                                  //   ),
                                                                  // ),
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      margin: EdgeInsets.only(
                                                                          right:
                                                                              8,
                                                                          top:
                                                                              0,
                                                                          bottom:
                                                                              10),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: <
                                                                            Widget>[
                                                                          Icon(
                                                                            Icons.attach_money,
                                                                            size:
                                                                                13,
                                                                            color:
                                                                                header,
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              margin: EdgeInsets.only(left: 3),
                                                                              child: Text(index % 2 == 0 ? "Free Delivery" : "50 (Delivery Charge)", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold)),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: <
                                                                    Widget>[
                                                                  Container(
                                                                    //color: Colors.red,
                                                                    margin: EdgeInsets.only(
                                                                        right:
                                                                            8,
                                                                        top: 0,
                                                                        bottom:
                                                                            0,
                                                                        left:
                                                                            0),
                                                                    child: Row(
                                                                      children: <
                                                                          Widget>[
                                                                        Icon(
                                                                          Icons
                                                                              .timer,
                                                                          size:
                                                                              13,
                                                                          color:
                                                                              header,
                                                                        ),
                                                                        Container(
                                                                          margin:
                                                                              EdgeInsets.only(left: 4),
                                                                          child: Text(
                                                                              index % 2 == 0 ? "35 MIN" : "1 HR",
                                                                              style: TextStyle(color: Colors.grey[500], fontSize: 11)),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    child: Row(
                                                                      children: <
                                                                          Widget>[
                                                                        Icon(
                                                                          Icons
                                                                              .star,
                                                                          color:
                                                                              header,
                                                                          size:
                                                                              12,
                                                                        ),
                                                                        Container(
                                                                            margin:
                                                                                EdgeInsets.only(left: 3),
                                                                            child: Text("5.0", style: TextStyle(color: Colors.black54, fontSize: 12))),
                                                                        Container(
                                                                            margin:
                                                                                EdgeInsets.only(left: 2),
                                                                            child: Text("(30)", style: TextStyle(color: Colors.black54, fontSize: 12)))
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                        padding:
                                                            EdgeInsets.all(5),
                                                        color: index % 2 == 0
                                                            ? header
                                                                .withOpacity(
                                                                    0.7)
                                                            : Colors
                                                                .transparent,
                                                        child: Text(
                                                          index % 2 == 0
                                                              ? "20% OFF"
                                                              : "",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14),
                                                        )),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  itemCount: 20,
                                )
                              : ListView.builder(
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
                                            color: Colors.black.withOpacity(.5),
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
                                                    DetailsPage()),
                                          );
                                        },
                                        child: ListTile(
                                          title: Stack(
                                            children: <Widget>[
                                              Container(
                                                //width: 100,
                                                padding:
                                                    EdgeInsets.only(bottom: 0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: <Widget>[
                                                    Center(
                                                      child: Container(
                                                        //color: Colors.red,

                                                        padding:
                                                            const EdgeInsets
                                                                .all(0.0),
                                                        margin: EdgeInsets.only(
                                                            top: 0),
                                                        child: Image.asset(
                                                          index % 2 == 0
                                                              ? 'assets/burger.jpg'
                                                              : 'assets/roll.jpg',
                                                          height: 100,
                                                          width: 120,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 100,
                                                      child: VerticalDivider(
                                                        //indent: 2.0,
                                                        color: Colors.grey[300],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Container(
                                                              child: Text(
                                                                index % 2 == 0
                                                                    ? "Restaurant Name"
                                                                    : "Restaurant Name from list",
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    color: Colors
                                                                        .black87,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 0),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: <
                                                                    Widget>[
                                                                  //Icon(Icons.label_important, size: 15, color: header,),
                                                                  Container(
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                            left:
                                                                                0),
                                                                    child: Text(
                                                                        index % 2 == 0
                                                                            ? "Thai, Chinese"
                                                                            : "Italian, Chinese, Thai",
                                                                        maxLines:
                                                                            1,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13,
                                                                            color:
                                                                                Colors.black87)),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 8,
                                                                      left: 0),
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: <
                                                                    Widget>[
                                                                  // Container(
                                                                  //   child: Row(
                                                                  //     children: <Widget>[
                                                                  //       Icon(
                                                                  //         Icons.star,
                                                                  //         color: golden,
                                                                  //         size: 12,
                                                                  //       ),
                                                                  //       Icon(
                                                                  //         Icons.star,
                                                                  //         color: golden,
                                                                  //         size: 12,
                                                                  //       ),
                                                                  //       Icon(
                                                                  //         Icons.star,
                                                                  //         color: golden,
                                                                  //         size: 12,
                                                                  //       ),
                                                                  //       Icon(
                                                                  //         Icons.star,
                                                                  //         color: golden,
                                                                  //         size: 12,
                                                                  //       ),
                                                                  //       Icon(
                                                                  //         Icons.star,
                                                                  //         color: golden,
                                                                  //         size: 12,
                                                                  //       ),
                                                                  //     ],
                                                                  //   ),
                                                                  // ),
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      margin: EdgeInsets.only(
                                                                          right:
                                                                              8,
                                                                          top:
                                                                              0,
                                                                          bottom:
                                                                              10),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: <
                                                                            Widget>[
                                                                          Icon(
                                                                            Icons.attach_money,
                                                                            size:
                                                                                13,
                                                                            color:
                                                                                header,
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              margin: EdgeInsets.only(left: 3),
                                                                              child: Text(index % 2 == 0 ? "Free Delivery" : "50 (Delivery Charge)", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold)),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: <
                                                                    Widget>[
                                                                  Container(
                                                                    //color: Colors.red,
                                                                    margin: EdgeInsets.only(
                                                                        right:
                                                                            8,
                                                                        top: 0,
                                                                        bottom:
                                                                            0,
                                                                        left:
                                                                            0),
                                                                    child: Row(
                                                                      children: <
                                                                          Widget>[
                                                                        Icon(
                                                                          Icons
                                                                              .timer,
                                                                          size:
                                                                              13,
                                                                          color:
                                                                              header,
                                                                        ),
                                                                        Container(
                                                                          margin:
                                                                              EdgeInsets.only(left: 4),
                                                                          child: Text(
                                                                              index % 2 == 0 ? "35 MIN" : "1 HR",
                                                                              style: TextStyle(color: Colors.grey[500], fontSize: 11)),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    child: Row(
                                                                      children: <
                                                                          Widget>[
                                                                        Icon(
                                                                          Icons
                                                                              .star,
                                                                          color:
                                                                              header,
                                                                          size:
                                                                              12,
                                                                        ),
                                                                        Container(
                                                                            margin:
                                                                                EdgeInsets.only(left: 3),
                                                                            child: Text("5.0", style: TextStyle(color: Colors.black54, fontSize: 12))),
                                                                        Container(
                                                                            margin:
                                                                                EdgeInsets.only(left: 2),
                                                                            child: Text("(30)", style: TextStyle(color: Colors.black54, fontSize: 12)))
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                        padding:
                                                            EdgeInsets.all(5),
                                                        color: index % 2 == 0
                                                            ? header
                                                                .withOpacity(
                                                                    0.7)
                                                            : Colors
                                                                .transparent,
                                                        child: Text(
                                                          index % 2 == 0
                                                              ? "20% OFF"
                                                              : "",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14),
                                                        )),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  itemCount: 20,
                                );
                        },
                      ))
                  : Container(
                      margin: EdgeInsets.all(10), padding: EdgeInsets.all(10),
                      //color: Colors.white,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1.0,
                            color: Colors.black.withOpacity(.5),
                            //offset: Offset(6.0, 7.0),
                          ),
                        ],
                        //shape: BoxShape.rectangle,
                        //border: Border.all(),
                        color: Colors.white,
                      ),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 180,
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
                                margin: EdgeInsets.only(top: 10, bottom: 10),
                                child: Text("No Internet Connection!",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black54)))
                          ],
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
}

class FilterDialog extends StatefulWidget {
  @override
  _FilterDialogState createState() => new _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  int price = 0;
  int offer = 0;
  String result = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //backgroundColor: Colors.black,
      appBar: new AppBar(
        iconTheme: IconThemeData(color: header),
        backgroundColor: Colors.white,
        title: Center(
          child: Container(
            child: Container(
              margin: EdgeInsets.only(top: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Filter",
                      style: TextStyle(fontSize: 17, color: Colors.black54)),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.done,
                            color: header,
                            size: 18,
                          ),
                          Container(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                "Done",
                                style: TextStyle(color: header, fontSize: 17),
                              )),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
      //body: new Text("It's a Dialog!"),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            new Container(
                padding: EdgeInsets.all(0.0),
                //color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Container(height: 2, child: Divider()),
                    Expanded(
                      child: Container(
                        child: ListView(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.5, color: Colors.grey[400]),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  color: Colors.white),
                              padding: EdgeInsets.only(
                                  top: 10, left: 10, right: 10, bottom: 10),
                              margin: EdgeInsets.only(
                                  top: 10, left: 10, right: 10, bottom: 10),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      // Icon(
                                      //   Icons.home,
                                      //   color: header,
                                      //   size: 17,
                                      // ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Price",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 17),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    //padding: EdgeInsets.only(left:10),
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                            //margin: EdgeInsets.only(top: 10),
                                            //padding: EdgeInsets.all(10),
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 5, top: 6),
                                              child: Text(
                                                "Lower",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        )),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              price = 1;
                                            });
                                          },
                                          child: Container(
                                            //margin: EdgeInsets.only(left: 0, right: 5),
                                            child: Container(
                                              //margin: EdgeInsets.only(right: 5),
                                              padding: EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color: Colors.grey[400]),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5.0)),
                                                  color: Colors.white),
                                              child: Icon(Icons.done,
                                                  size: 16,
                                                  color: price == 1
                                                      ? header
                                                      : Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    //padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                            //margin: EdgeInsets.only(top: 10),
                                            //padding: EdgeInsets.all(10),
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 5, top: 6),
                                              child: Text(
                                                "Medium",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        )),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              price = 2;
                                            });
                                          },
                                          child: Container(
                                            //margin: EdgeInsets.only(left: 0, right: 5),
                                            child: Container(
                                              //margin: EdgeInsets.only(right: 5),
                                              padding: EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color: Colors.grey[400]),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5.0)),
                                                  color: Colors.white),
                                              child: Icon(Icons.done,
                                                  size: 16,
                                                  color: price == 2
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
                                    //padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                            //margin: EdgeInsets.only(top: 10),
                                            //padding: EdgeInsets.all(10),
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 5, top: 6),
                                              child: Text(
                                                "Higher",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        )),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              price = 3;
                                            });
                                          },
                                          child: Container(
                                            //margin: EdgeInsets.only(left: 0, right: 5),
                                            child: Container(
                                              //margin: EdgeInsets.only(right: 5),
                                              padding: EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color: Colors.grey[400]),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5.0)),
                                                  color: Colors.white),
                                              child: Icon(Icons.done,
                                                  size: 16,
                                                  color: price == 3
                                                      ? header
                                                      : Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //Divider(),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.5, color: Colors.grey[400]),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  color: Colors.white),
                              padding: EdgeInsets.only(
                                  top: 10, left: 10, right: 10, bottom: 10),
                              margin: EdgeInsets.only(
                                  top: 10, left: 10, right: 10, bottom: 10),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      // Icon(
                                      //   Icons.home,
                                      //   color: header,
                                      //   size: 17,
                                      // ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Offers",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 17),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                            //margin: EdgeInsets.only(top: 10),
                                            //padding: EdgeInsets.all(10),
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 5, top: 6),
                                              child: Text(
                                                "Free Delivery",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        )),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              offer = 1;
                                            });
                                          },
                                          child: Container(
                                            //margin: EdgeInsets.only(left: 0, right: 5),
                                            child: Container(
                                              //margin: EdgeInsets.only(right: 5),
                                              padding: EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color: Colors.grey[400]),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5.0)),
                                                  color: Colors.white),
                                              child: Icon(Icons.done,
                                                  size: 16,
                                                  color: offer == 1
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
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                            //margin: EdgeInsets.only(top: 10),
                                            //padding: EdgeInsets.all(10),
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 5, top: 6),
                                              child: Text(
                                                "Offers",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        )),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              offer = 2;
                                            });
                                          },
                                          child: Container(
                                            //margin: EdgeInsets.only(left: 0, right: 5),
                                            child: Container(
                                              //margin: EdgeInsets.only(right: 5),
                                              padding: EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color: Colors.grey[400]),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5.0)),
                                                  color: Colors.white),
                                              child: Icon(Icons.done,
                                                  size: 16,
                                                  color: offer == 2
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
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                            //margin: EdgeInsets.only(top: 10),
                                            //padding: EdgeInsets.all(10),
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 5, top: 6),
                                              child: Text(
                                                "Cash on Delivery",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        )),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              offer = 3;
                                            });
                                          },
                                          child: Container(
                                            //margin: EdgeInsets.only(left: 0, right: 5),
                                            child: Container(
                                              //margin: EdgeInsets.only(right: 5),
                                              padding: EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color: Colors.grey[400]),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5.0)),
                                                  color: Colors.white),
                                              child: Icon(Icons.done,
                                                  size: 16,
                                                  color: offer == 3
                                                      ? header
                                                      : Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.5, color: Colors.grey[400]),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  color: Colors.white),
                              padding: EdgeInsets.only(
                                  top: 10, left: 10, right: 10, bottom: 10),
                              margin: EdgeInsets.only(
                                  top: 10, left: 10, right: 10, bottom: 10),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      // Icon(
                                      //   Icons.home,
                                      //   color: header,
                                      //   size: 17,
                                      // ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Cuisine Category",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 17),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              // loc1 = 1;
                                              // loc = 0;
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                              //margin: EdgeInsets.only(top: 10),
                                              //padding: EdgeInsets.all(10),
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 5, top: 6),
                                                child: Text(
                                                  "Bengali",
                                                  style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            ],
                                          )),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              // loc1 = 1;
                                              // loc = 0;
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                              //margin: EdgeInsets.only(left: 0, right: 5),
                                              child: Icon(
                                            Icons.chevron_right,
                                            color: Colors.grey,
                                            size: 20,
                                          )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              // loc1 = 1;
                                              // loc = 0;
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                              //margin: EdgeInsets.only(top: 10),
                                              //padding: EdgeInsets.all(10),
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 5, top: 6),
                                                child: Text(
                                                  "Thai",
                                                  style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            ],
                                          )),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              // loc1 = 1;
                                              // loc = 0;
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                              //margin: EdgeInsets.only(left: 0, right: 5),
                                              child: Icon(
                                            Icons.chevron_right,
                                            color: Colors.grey,
                                            size: 20,
                                          )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              // loc1 = 1;
                                              // loc = 0;
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                              //margin: EdgeInsets.only(top: 10),
                                              //padding: EdgeInsets.all(10),
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 5, top: 6),
                                                child: Text(
                                                  "Chinese",
                                                  style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            ],
                                          )),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              // loc1 = 1;
                                              // loc = 0;
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                              //margin: EdgeInsets.only(left: 0, right: 5),
                                              child: Icon(
                                            Icons.chevron_right,
                                            color: Colors.grey,
                                            size: 20,
                                          )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              // loc1 = 1;
                                              // loc = 0;
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                              //margin: EdgeInsets.only(top: 10),
                                              //padding: EdgeInsets.all(10),
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 5, top: 6),
                                                child: Text(
                                                  "Fast Food",
                                                  style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            ],
                                          )),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              // loc1 = 1;
                                              // loc = 0;
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                              //margin: EdgeInsets.only(left: 0, right: 5),
                                              child: Icon(
                                            Icons.chevron_right,
                                            color: Colors.grey,
                                            size: 20,
                                          )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              // loc1 = 1;
                                              // loc = 0;
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                              //margin: EdgeInsets.only(top: 10),
                                              //padding: EdgeInsets.all(10),
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 5, top: 6),
                                                child: Text(
                                                  "Grilled Chicken",
                                                  style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            ],
                                          )),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              // loc1 = 1;
                                              // loc = 0;
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                              //margin: EdgeInsets.only(left: 0, right: 5),
                                              child: Icon(
                                            Icons.chevron_right,
                                            color: Colors.grey,
                                            size: 20,
                                          )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              // loc1 = 1;
                                              // loc = 0;
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                              //margin: EdgeInsets.only(top: 10),
                                              //padding: EdgeInsets.all(10),
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 5, top: 6),
                                                child: Text(
                                                  "Biriyani",
                                                  style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            ],
                                          )),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              // loc1 = 1;
                                              // loc = 0;
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                              //margin: EdgeInsets.only(left: 0, right: 5),
                                              child: Icon(
                                            Icons.chevron_right,
                                            color: Colors.grey,
                                            size: 20,
                                          )),
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
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void selection(int num) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(num == 1 ? "Price" : num == 2 ? "Date" : "User"),
          content: num == 1
              ? Container(
                  child: ListView(
                    children: <Widget>[
                      ListTile(
                        title: Container(
                            child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 8),
                              child: Text(
                                'Lower to Higher',
                                style: TextStyle(color: Colors.black54),
                              ),
                            ),
                          ],
                        )),
                        trailing: Icon(Icons.chevron_right),
                      ),
                      Divider(),
                      ListTile(
                        title: Container(
                            child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 8),
                              child: Text(
                                'Higher to Lower',
                                style: TextStyle(color: Colors.black54),
                              ),
                            ),
                          ],
                        )),
                        trailing: Icon(Icons.chevron_right),
                      ),
                    ],
                  ),
                )
              : num == 2
                  ? Container(
                      child: ListView(
                        children: <Widget>[
                          ListTile(
                            title: Container(
                                child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  child: Text(
                                    'Old at first',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ),
                              ],
                            )),
                            trailing: Icon(Icons.chevron_right),
                          ),
                          Divider(),
                          ListTile(
                            title: Container(
                                child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  child: Text(
                                    'New at first',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ),
                              ],
                            )),
                            trailing: Icon(Icons.chevron_right),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      child: ListView(
                        children: <Widget>[
                          ListTile(
                            title: Container(
                                child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  child: Text(
                                    'All User',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ),
                              ],
                            )),
                            trailing: Icon(Icons.chevron_right),
                          ),
                          Divider(),
                          ListTile(
                            title: Container(
                                child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  child: Text(
                                    'Only Members',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ),
                              ],
                            )),
                            trailing: Icon(Icons.chevron_right),
                          ),
                        ],
                      ),
                    ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text(
                "Close",
                style: TextStyle(color: header),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
