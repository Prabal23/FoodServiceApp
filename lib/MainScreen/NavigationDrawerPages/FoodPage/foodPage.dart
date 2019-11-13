import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:foodpanda_app/MainScreen/FilterPage/filterPage.dart';
import 'package:foodpanda_app/MainScreen/FoodDetailsPage/details.dart';
import 'package:foodpanda_app/main.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
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
    return Scaffold(
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
                      child: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? ListView.builder(
                              itemBuilder: (BuildContext context, int index) =>
                                  new Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Container(
                                  margin: EdgeInsets.only(
                                      bottom: 5, top: 5, left: 2.5, right: 2.5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
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
                                            padding: EdgeInsets.only(bottom: 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Center(
                                                  child: Container(
                                                    //color: Colors.red,

                                                    padding:
                                                        const EdgeInsets.all(
                                                            0.0),
                                                    margin:
                                                        EdgeInsets.only(top: 0),
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
                                                                fontSize: 16,
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
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              //Icon(Icons.label_important, size: 15, color: header,),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            0),
                                                                child: Text(
                                                                    index % 2 ==
                                                                            0
                                                                        ? "Thai, Chinese"
                                                                        : "Italian, Chinese, Thai",
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        color: Colors
                                                                            .black87)),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 8,
                                                                  left: 0),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
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
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          right:
                                                                              8,
                                                                          top:
                                                                              0,
                                                                          bottom:
                                                                              10),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: <
                                                                        Widget>[
                                                                      Icon(
                                                                        Icons
                                                                            .attach_money,
                                                                        size:
                                                                            13,
                                                                        color:
                                                                            header,
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          margin:
                                                                              EdgeInsets.only(left: 3),
                                                                          child: Text(
                                                                              index % 2 == 0 ? "Free Delivery" : "50 (Delivery Charge)",
                                                                              maxLines: 1,
                                                                              overflow: TextOverflow.ellipsis,
                                                                              style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold)),
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
                                                            children: <Widget>[
                                                              Container(
                                                                //color: Colors.red,
                                                                margin: EdgeInsets
                                                                    .only(
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
                                                                      size: 13,
                                                                      color:
                                                                          header,
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets.only(
                                                                          left:
                                                                              4),
                                                                      child: Text(
                                                                          index % 2 == 0
                                                                              ? "35 MIN"
                                                                              : "1 HR",
                                                                          style: TextStyle(
                                                                              color: Colors.grey[500],
                                                                              fontSize: 11)),
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
                                                                      size: 12,
                                                                    ),
                                                                    Container(
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                3),
                                                                        child: Text(
                                                                            "5.0",
                                                                            style:
                                                                                TextStyle(color: Colors.black54, fontSize: 12))),
                                                                    Container(
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                2),
                                                                        child: Text(
                                                                            "(30)",
                                                                            style:
                                                                                TextStyle(color: Colors.black54, fontSize: 12)))
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
                                            margin: EdgeInsets.only(top: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                    padding: EdgeInsets.all(5),
                                                    color: index % 2 == 0
                                                        ? header
                                                            .withOpacity(0.7)
                                                        : Colors.transparent,
                                                    child: Text(
                                                      index % 2 == 0
                                                          ? "20% OFF"
                                                          : "",
                                                      style: TextStyle(
                                                          color: Colors.white,
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
                          : GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio:
                                    (MediaQuery.of(context).size.width / 2) /
                                        (MediaQuery.of(context).size.height /
                                            2.5),
                              ),
                              itemBuilder: (BuildContext context, int index) =>
                                  new Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Container(
                                  margin: EdgeInsets.only(
                                      bottom: 5, top: 5, left: 2.5, right: 2.5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
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
                                            padding: EdgeInsets.only(bottom: 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Center(
                                                  child: Container(
                                                    //color: Colors.red,

                                                    padding:
                                                        const EdgeInsets.all(
                                                            0.0),
                                                    margin:
                                                        EdgeInsets.only(top: 0),
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
                                                                fontSize: 16,
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
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              //Icon(Icons.label_important, size: 15, color: header,),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            0),
                                                                child: Text(
                                                                    index % 2 ==
                                                                            0
                                                                        ? "Thai, Chinese"
                                                                        : "Italian, Chinese, Thai",
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        color: Colors
                                                                            .black87)),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 8,
                                                                  left: 0),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
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
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          right:
                                                                              8,
                                                                          top:
                                                                              0,
                                                                          bottom:
                                                                              10),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: <
                                                                        Widget>[
                                                                      Icon(
                                                                        Icons
                                                                            .attach_money,
                                                                        size:
                                                                            13,
                                                                        color:
                                                                            header,
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          margin:
                                                                              EdgeInsets.only(left: 3),
                                                                          child: Text(
                                                                              index % 2 == 0 ? "Free Delivery" : "50 (Delivery Charge)",
                                                                              maxLines: 1,
                                                                              overflow: TextOverflow.ellipsis,
                                                                              style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold)),
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
                                                            children: <Widget>[
                                                              Container(
                                                                //color: Colors.red,
                                                                margin: EdgeInsets
                                                                    .only(
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
                                                                      size: 13,
                                                                      color:
                                                                          header,
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets.only(
                                                                          left:
                                                                              4),
                                                                      child: Text(
                                                                          index % 2 == 0
                                                                              ? "35 MIN"
                                                                              : "1 HR",
                                                                          style: TextStyle(
                                                                              color: Colors.grey[500],
                                                                              fontSize: 11)),
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
                                                                      size: 12,
                                                                    ),
                                                                    Container(
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                3),
                                                                        child: Text(
                                                                            "5.0",
                                                                            style:
                                                                                TextStyle(color: Colors.black54, fontSize: 12))),
                                                                    Container(
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                2),
                                                                        child: Text(
                                                                            "(30)",
                                                                            style:
                                                                                TextStyle(color: Colors.black54, fontSize: 12)))
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
                                            margin: EdgeInsets.only(top: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                    padding: EdgeInsets.all(5),
                                                    color: index % 2 == 0
                                                        ? header
                                                            .withOpacity(0.7)
                                                        : Colors.transparent,
                                                    child: Text(
                                                      index % 2 == 0
                                                          ? "20% OFF"
                                                          : "",
                                                      style: TextStyle(
                                                          color: Colors.white,
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

  void filterPage() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new FilterDialog();
        },
        fullscreenDialog: true));
  }
}