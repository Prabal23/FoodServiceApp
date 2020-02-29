import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:foodpanda_app/MainScreen/ReviewDriverPage/reviewDriverPage.dart';
import 'package:foodpanda_app/main.dart';
import 'package:intl/intl.dart';

class OrderDetailsPage extends StatefulWidget {
  @override
  _OrderDetailsPageState createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  bool internet = true;
  String result = '', runningDate = '';
  int loc = 1, loc1 = 0;
  @override
  void initState() {
    internetCheck();
    var now = new DateTime.now();
    runningDate = new DateFormat("dd-MM-yyyy").format(now);
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
    return Scaffold(
      //drawer: drawer,
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
                  Text("Order Details",
                      style: TextStyle(fontSize: 17, color: Colors.black54)),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: sub_white,
          padding: EdgeInsets.only(bottom: 0),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 5),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Colors.white,
                    border: Border.all(width: 0.2, color: Colors.grey)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Order Information",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5, right: 5, bottom: 5),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 5, bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                    //color: Colors.grey[200],
                                    //padding: EdgeInsets.all(20),
                                    child: Text(
                                  "Status",
                                  style: TextStyle(color: Colors.grey),
                                )),
                                Container(
                                    child: Row(
                                  children: <Widget>[
                                    Icon(Icons.done, size: 15, color: header),
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        "Delivered",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(color: header),
                                      ),
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15, bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                    //color: Colors.grey[200],
                                    //padding: EdgeInsets.all(20),
                                    child: Text(
                                  "Order Number",
                                  style: TextStyle(color: Colors.grey),
                                )),
                                Container(
                                    child: Row(
                                  children: <Widget>[
                                    Text(
                                      "#0f5qd8",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 5),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Colors.white,
                    border: Border.all(width: 0.2, color: Colors.grey)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Order Pricing",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5, right: 5, bottom: 5),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 15, bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                    //color: Colors.grey[200],
                                    //padding: EdgeInsets.all(20),
                                    child: Text(
                                  "Food Price",
                                  style: TextStyle(color: Colors.grey),
                                )),
                                Container(
                                    child: Row(
                                  children: <Widget>[
                                    Icon(Icons.attach_money,
                                        size: 15, color: Colors.black54),
                                    Text(
                                      "95.00",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15, bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                    //color: Colors.grey[200],
                                    //padding: EdgeInsets.all(20),
                                    child: Text(
                                  "No. of items",
                                  style: TextStyle(color: Colors.grey),
                                )),
                                Container(
                                    child: Text(
                                  "4",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(color: Colors.black54),
                                ))
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15, bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                    //color: Colors.grey[200],
                                    //padding: EdgeInsets.all(20),
                                    child: Text(
                                  "Total Price",
                                  style: TextStyle(color: Colors.grey),
                                )),
                                Container(
                                    child: Row(
                                  children: <Widget>[
                                    Icon(Icons.attach_money,
                                        size: 15, color: Colors.black54),
                                    Text(
                                      "280.00",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15, bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                    //color: Colors.grey[200],
                                    //padding: EdgeInsets.all(20),
                                    child: Text(
                                  "Discount",
                                  style: TextStyle(color: Colors.grey),
                                )),
                                Container(
                                    child: Row(
                                  children: <Widget>[
                                    Icon(Icons.remove, size: 15, color: header),
                                    Icon(Icons.attach_money,
                                        size: 15, color: header),
                                    Text(
                                      "150.00",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(color: header),
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5, bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                    //color: Colors.grey[200],
                                    //padding: EdgeInsets.all(20),
                                    child: Text(
                                  "Total Paid",
                                  style: TextStyle(color: Colors.grey),
                                )),
                                Container(
                                    child: Row(
                                  children: <Widget>[
                                    Icon(Icons.attach_money,
                                        size: 15, color: Colors.black),
                                    Text(
                                      "130.00",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 5),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: Colors.white,
                      border: Border.all(width: 0.2, color: Colors.grey)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Delivered To",
                        style: TextStyle(fontSize: 17, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5, right: 5, bottom: 5),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 5, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      //color: Colors.grey[200],
                                      //padding: EdgeInsets.all(20),
                                      child: Text(
                                    "John Smith",
                                    style: TextStyle(color: Colors.black54),
                                  )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 0, right: 5, bottom: 5),
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(top: 5, bottom: 5),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.location_on,
                                            color: header, size: 16),
                                        Container(
                                            margin: EdgeInsets.only(left: 5),
                                            child: Text(
                                              "New York, USA",
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10, right: 5, bottom: 3),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 5, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      //color: Colors.grey[200],
                                      //padding: EdgeInsets.all(20),
                                      child: Text(
                                    "Delivery Date",
                                    style: TextStyle(color: Colors.black54),
                                  )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 0, right: 5, bottom: 5),
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(top: 5, bottom: 5),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.calendar_today,
                                            color: header, size: 16),
                                        Container(
                                            margin: EdgeInsets.only(left: 5),
                                            child: Text(
                                              runningDate,
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 5),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: Colors.white,
                      border: Border.all(width: 0.2, color: Colors.grey)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Delivered By",
                        style: TextStyle(fontSize: 17, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5, right: 5, bottom: 5),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 5, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      //color: Colors.grey[200],
                                      //padding: EdgeInsets.all(20),
                                      child: Text(
                                    "Mr. XYZ",
                                    style: TextStyle(color: Colors.black54),
                                  )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 0, right: 5, bottom: 5),
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(top: 5, bottom: 5),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.phone,
                                            color: header, size: 16),
                                        Container(
                                            margin: EdgeInsets.only(left: 5),
                                            child: Text(
                                              "017XXXXXXXX",
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            )),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DriverReviewPage()));
                                    },
                                    child: Container(
                                        padding: EdgeInsets.only(
                                            left: 5, top: 5, bottom: 5),
                                        margin: EdgeInsets.only(left: 5),
                                        child: Text(
                                          "Review",
                                          style: TextStyle(color: header),
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),

              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   margin:
              //       EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 5),
              //   padding: EdgeInsets.all(15),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.all(Radius.circular(5.0)),
              //       color: Colors.white,
              //       border: Border.all(width: 0.2, color: Colors.grey)),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: <Widget>[
              //       Text(
              //         "Payment Details",
              //         style: TextStyle(fontSize: 17, color: Colors.black),
              //         textAlign: TextAlign.center,
              //       ),
              //       SizedBox(
              //         height: 10,
              //       ),
              //       Container(
              //         padding: EdgeInsets.only(top: 5, right: 5, bottom: 5),
              //         width: MediaQuery.of(context).size.width,
              //         child: Column(
              //           children: <Widget>[
              //             Container(
              //               padding:
              //                   EdgeInsets.only(top: 0, right: 5, bottom: 5),
              //               width: MediaQuery.of(context).size.width,
              //               child: Column(
              //                 children: <Widget>[
              //                   Container(
              //                     margin: EdgeInsets.only(top: 5, bottom: 5),
              //                     child: Row(
              //                       mainAxisAlignment:
              //                           MainAxisAlignment.spaceBetween,
              //                       children: <Widget>[
              //                         Container(
              //                             //color: Colors.grey[200],
              //                             //padding: EdgeInsets.all(20),
              //                             child: Text(
              //                           "Cash on delivery",
              //                           style: TextStyle(color: Colors.grey),
              //                         )),
              //                       ],
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             Container(
              //               padding:
              //                   EdgeInsets.only(top: 0, right: 5, bottom: 5),
              //               width: MediaQuery.of(context).size.width,
              //               child: Center(
              //                 child: Column(
              //                   children: <Widget>[
              //                     Row(
              //                       mainAxisAlignment:
              //                           MainAxisAlignment.spaceBetween,
              //                       children: <Widget>[
              //                         Container(
              //                           margin: EdgeInsets.only(
              //                               top: 5, bottom: 5),
              //                           child: Row(
              //                             children: <Widget>[
              //                               Icon(Icons.location_on,
              //                                   color: Colors.grey, size: 16),
              //                               Container(
              //                                   margin:
              //                                       EdgeInsets.only(left: 5),
              //                                   child: Text(
              //                                     "Modina Market",
              //                                     style: TextStyle(
              //                                         color: Colors.grey),
              //                                   )),
              //                             ],
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: header,
                      border: Border.all(width: 0.2, color: Colors.grey)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text("Reorder",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14))),
                      Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                        size: 22,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
