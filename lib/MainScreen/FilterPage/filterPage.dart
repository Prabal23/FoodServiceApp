import 'package:flutter/material.dart';

import '../../main.dart';

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
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        price = 1;
                                      });
                                    },
                                    child: Container(
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
                                          Container(
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
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        price = 2;
                                      });
                                    },
                                    child: Container(
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
                                          Container(
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
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        price = 3;
                                      });
                                    },
                                    child: Container(
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
                                          Container(
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
                                        ],
                                      ),
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
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        offer = 1;
                                      });
                                    },
                                    child: Container(
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
                                          Container(
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
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        offer = 2;
                                      });
                                    },
                                    child: Container(
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
                                          Container(
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
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        offer = 3;
                                      });
                                    },
                                    child: Container(
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
                                          Container(
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
                                        ],
                                      ),
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
