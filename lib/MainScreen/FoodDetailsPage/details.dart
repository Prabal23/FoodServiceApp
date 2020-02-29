import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:foodpanda_app/MainScreen/NavigationDrawerPages/CartPage/cartPage.dart';
import 'package:foodpanda_app/MainScreen/ReviewRestaurantPage/reviewRestaurantPage.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../main.dart';

class DetailsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DetailsPageState();
  }
}

class DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  TextEditingController _reviewController = TextEditingController();
  Animation<double> animation;
  AnimationController controller;
  bool _isLoggedIn = false;
  String _debugLabelString = "", review = '', _ratingStatus = '';
  bool _requireConsent = false;
  CarouselSlider carouselSlider;
  int _current = 0, active = 0, infoCross = 0, num = 0;
  double tk = 0.0;
  List imgList = ["assets/burger.jpg"];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  void initState() {
    active = _current + 1;
    super.initState();
  }

  int _rating = 0;

  void rate(int rating) {
    //Other actions based on rating such as api calls.
    setState(() {
      _rating = rating;
    });

    if (rating == 1) {
      _ratingStatus = "Poor";
    }
    if (rating == 2) {
      _ratingStatus = "Average";
    }
    if (rating == 3) {
      _ratingStatus = "Good";
    }
    if (rating == 4) {
      _ratingStatus = "Very Good";
    }
    if (rating == 5) {
      _ratingStatus = "Excellent";
    }
  }

  List reviewList = [
    {
      'name': 'Pranto',
      'rating': 4.5,
      'review':
          'Very good service. Nice environment and quality food. Overall satisfied.',
      'time': 'Jan 23, 2019',
    },
    {
      'name': 'Bijoya',
      'rating': 5.0,
      'review':
          'Nice environment and quality food. Very good service. I loved it',
      'time': 'Jan 30, 2019',
    },
    {
      'name': 'Rahi',
      'rating': 4.8,
      'review': 'Everything was perfect.',
      'time': 'Feb 2, 2020',
    },
    {
      'name': 'Good quality but quantity was limited. Need to increase.',
      'rating': 3.5,
      'review': 'review',
      'time': 'Feb 13, 2020',
    },
    {
      'name': 'Laxmi',
      'rating': 3.0,
      'review': 'Very good place but food was not up to the mark.',
      'time': 'Feb 26, 2020',
    },
    {
      'name': 'Amran',
      'rating': 5.0,
      'review': 'Sera khani. Khub vala lagse.',
      'time': 'Feb 27, 2020',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: header),
        backgroundColor: Colors.white,
        title: Center(
          child: Container(
            child: Container(
              margin: EdgeInsets.only(top: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Restaurant Details",
                      style: TextStyle(fontSize: 17, color: Colors.black54)),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          infoCross++;
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.all(5),
                          child: infoCross % 2 == 0
                              ? Icon(
                                  Icons.info_outline,
                                  color: header,
                                )
                              : Icon(
                                  Icons.cancel,
                                  color: header,
                                )))
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            color: sub_white,
            //height: MediaQuery.of(context).size.height,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      //border: Border.all(width: 0.5, color: Colors.grey),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 1.0,
                          color: Colors.black.withOpacity(.5),
                          //offset: Offset(6.0, 7.0),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          //width: 100,
                          padding: EdgeInsets.only(bottom: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                //color: Colors.red,
                                padding: const EdgeInsets.all(0.0),
                                margin: EdgeInsets.only(top: 0),
                                child: Image.asset(
                                  'assets/burger.jpg',
                                  height: 100,
                                  width: 120,
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
                                  alignment: Alignment.topCenter,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          "Panshi Restaurant",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          // Icon(
                                          //   Icons.location_on,
                                          //   color: header,
                                          //   size: 12,
                                          // ),
                                          Container(
                                            margin: EdgeInsets.only(left: 0),
                                            child: Text(
                                              "Zindabazar, Sylhet",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black54),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.star,
                                              color: header,
                                              size: 13,
                                            ),
                                            Container(
                                                margin:
                                                    EdgeInsets.only(left: 3),
                                                child: Text("5.0",
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13))),
                                            Container(
                                                margin:
                                                    EdgeInsets.only(left: 2),
                                                child: Text("(30)",
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13)))
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 6),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.label_important,
                                              color: header,
                                              size: 12,
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 3),
                                              child: Text(
                                                "20% Discount",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black45),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Container(
                                      //   margin: EdgeInsets.only(top: 6),
                                      //   child: Row(
                                      //     mainAxisAlignment:
                                      //         MainAxisAlignment.spaceBetween,
                                      //     children: <Widget>[
                                      //       Container(
                                      //         child: Row(
                                      //           children: <Widget>[
                                      //             Icon(
                                      //               Icons.timer,
                                      //               color: header,
                                      //               size: 13,
                                      //             ),
                                      //             Container(
                                      //                 margin: EdgeInsets.only(
                                      //                     left: 3),
                                      //                 child: Text("11:00 AM",
                                      //                     style: TextStyle(
                                      //                         color: Colors
                                      //                             .black45,
                                      //                         fontSize: 12))),
                                      //             Container(
                                      //                 margin: EdgeInsets.only(
                                      //                     left: 3),
                                      //                 child: Text(" - ",
                                      //                     style: TextStyle(
                                      //                         color: Colors
                                      //                             .black45,
                                      //                         fontSize: 12))),
                                      //             Container(
                                      //                 margin: EdgeInsets.only(
                                      //                     left: 2),
                                      //                 child: Text("10:30 PM",
                                      //                     style: TextStyle(
                                      //                         color: Colors
                                      //                             .black45,
                                      //                         fontSize: 12))),
                                      //             Container(
                                      //               margin:
                                      //                   EdgeInsets.only(top: 0),
                                      //               child: Row(
                                      //                 mainAxisAlignment:
                                      //                     MainAxisAlignment
                                      //                         .spaceBetween,
                                      //                 children: <Widget>[
                                      //                   Container(
                                      //                     child: Row(
                                      //                       children: <Widget>[
                                      //                         // Icon(
                                      //                         //   Icons.done,
                                      //                         //   color: header,
                                      //                         //   size: 13,
                                      //                         // ),
                                      //                         Container(
                                      //                             margin: EdgeInsets
                                      //                                 .only(
                                      //                                     left:
                                      //                                         3),
                                      //                             child: Text(
                                      //                                 "(OPEN)",
                                      //                                 style: TextStyle(
                                      //                                     color:
                                      //                                         header,
                                      //                                     fontSize:
                                      //                                         12))),
                                      //                       ],
                                      //                     ),
                                      //                   ),
                                      //                 ],
                                      //               ),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.all(5),
                                  color: Colors.transparent,
                                  child: Text(
                                    "",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  // Stack(
                  //   children: <Widget>[
                  //     Container(
                  //         height: 190,
                  //         child: Container(
                  //           margin: EdgeInsets.only(left: 0, right: 0, top: 0),
                  //           width: MediaQuery.of(context).size.width,
                  //           decoration: BoxDecoration(
                  //               borderRadius:
                  //                   BorderRadius.all(Radius.circular(5.0)),
                  //               color: Colors.white,
                  //               border:
                  //                   Border.all(width: 0.2, color: Colors.grey)),
                  //           child: Image.asset(
                  //             "assets/roll.jpg",
                  //             fit: BoxFit.fill,
                  //           ),
                  //         )),
                  //     Container(
                  //       height: 190,
                  //       width: MediaQuery.of(context).size.width,
                  //       margin: EdgeInsets.only(left: 0, right: 0, top: 0),
                  //       decoration: BoxDecoration(
                  //           borderRadius:
                  //               BorderRadius.all(Radius.circular(5.0)),
                  //           color: Colors.black.withOpacity(.5),
                  //           border: Border.all(width: 0.2, color: Colors.grey)),
                  //     ),
                  //     Container(
                  //         alignment: Alignment.center,
                  //         //color: Colors.red,
                  //         height: 190,
                  //         width: MediaQuery.of(context).size.width,
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: <Widget>[
                  //             Container(
                  //               margin: EdgeInsets.only(left: 20, right: 20),
                  //               child: Text("Free Delivery",
                  //                   textAlign: TextAlign.center,
                  //                   overflow: TextOverflow.ellipsis,
                  //                   maxLines: 2,
                  //                   style: TextStyle(
                  //                       color: Colors.white,
                  //                       fontSize: 17,
                  //                       fontWeight: FontWeight.bold)),
                  //             ),
                  //             GestureDetector(
                  //               onTap: () {
                  //                 dateTimePick();
                  //               },
                  //               child: Container(
                  //                   width: 160,
                  //                   margin: EdgeInsets.only(top: 10),
                  //                   padding: EdgeInsets.all(10),
                  //                   decoration: BoxDecoration(
                  //                       borderRadius: BorderRadius.all(
                  //                           Radius.circular(5.0)),
                  //                       color: Colors.black.withOpacity(.3),
                  //                       border: Border.all(
                  //                           width: 0.5, color: Colors.white)),
                  //                   child: Row(
                  //                     mainAxisAlignment:
                  //                         MainAxisAlignment.center,
                  //                     children: <Widget>[
                  //                       Text(
                  //                         "Delivery 45 min",
                  //                         style: TextStyle(
                  //                             color: Colors.white,
                  //                             fontSize: 13),
                  //                       ),
                  //                       Icon(Icons.arrow_drop_down,
                  //                           size: 25, color: Colors.white)
                  //                     ],
                  //                   )),
                  //             ),
                  //             Container(
                  //               margin: EdgeInsets.all(10),
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 children: <Widget>[
                  //                   Icon(
                  //                     Icons.label_important,
                  //                     color: Colors.white,
                  //                     size: 15,
                  //                   ),
                  //                   Container(
                  //                       margin: EdgeInsets.only(left: 3),
                  //                       child: Text("20%",
                  //                           style: TextStyle(
                  //                               color: Colors.white,
                  //                               fontSize: 15))),
                  //                   Container(
                  //                       margin: EdgeInsets.only(left: 2),
                  //                       child: Text(" Discount",
                  //                           style: TextStyle(
                  //                               color: Colors.white,
                  //                               fontSize: 15)))
                  //                 ],
                  //               ),
                  //             ),
                  //           ],
                  //         ))
                  //   ],
                  // ),
                  SizedBox(
                    height: 0,
                  ),
                  // Container(
                  //     width: 50,
                  //     child: Divider(
                  //       color: mainheader,
                  //     )),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                        top: 0, left: 10, right: 10, bottom: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.white,
                      border: Border.all(width: 0.2, color: Colors.grey),
                      // boxShadow: [
                      //   BoxShadow(
                      //     blurRadius: 1.0,
                      //     color: Colors.black.withOpacity(.5),
                      //     //offset: Offset(6.0, 7.0),
                      //   ),
                      // ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    //margin: EdgeInsets.only(left: 3),
                                    child: Text(
                                      "Service Available",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black45,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  SizedBox(width: 3),
                                  Icon(
                                    Icons.done,
                                    color: header,
                                    size: 17,
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          // Icon(
                                          //   Icons.timer,
                                          //   color: header,
                                          //   size: 13,
                                          // ),
                                          Container(
                                              margin: EdgeInsets.only(left: 0),
                                              child: Text("Open : ",
                                                  style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 11))),
                                          Container(
                                              margin: EdgeInsets.only(left: 0),
                                              child: Text("11:00 AM",
                                                  style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 11))),
                                          Container(
                                              margin: EdgeInsets.only(left: 3),
                                              child: Text(" - ",
                                                  style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 11))),
                                          Container(
                                              margin: EdgeInsets.only(left: 2),
                                              child: Text("10:30 PM",
                                                  style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 11))),
                                          // Container(
                                          //   margin: EdgeInsets.only(top: 0),
                                          //   child: Row(
                                          //     mainAxisAlignment:
                                          //         MainAxisAlignment
                                          //             .spaceBetween,
                                          //     children: <Widget>[
                                          //       Container(
                                          //         child: Row(
                                          //           children: <Widget>[
                                          //             // Icon(
                                          //             //   Icons.done,
                                          //             //   color: header,
                                          //             //   size: 13,
                                          //             // ),
                                          //             Container(
                                          //                 margin:
                                          //                     EdgeInsets.only(
                                          //                         left: 3),
                                          //                 child: Text("(OPEN)",
                                          //                     style: TextStyle(
                                          //                         color: header,
                                          //                         fontSize:
                                          //                             12))),
                                          //           ],
                                          //         ),
                                          //       ),
                                          //     ],
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Row(
                              //   children: <Widget>[
                              //     Icon(
                              //       Icons.label_important,
                              //       color: header,
                              //       size: 12,
                              //     ),
                              //     Container(
                              //       margin: EdgeInsets.only(left: 3),
                              //       child: Text(
                              //         "20% Discount",
                              //         style: TextStyle(
                              //             fontSize: 12, color: Colors.black45),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dateTimePick();
                          },
                          child: Container(
                              //width: 160,
                              margin: EdgeInsets.only(top: 0),
                              padding: EdgeInsets.only(
                                  left: 10, top: 5, right: 5, bottom: 5),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  //color: header.withOpacity(.1),
                                  border:
                                      Border.all(width: 0.5, color: header)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Delivery 35 min",
                                    style:
                                        TextStyle(color: header, fontSize: 13),
                                  ),
                                  Icon(Icons.arrow_drop_down,
                                      size: 25, color: header)
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   margin:
                  //       EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 10),
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.all(Radius.circular(0.0)),
                  //       color: Colors.white,
                  //       border: Border.all(width: 0.2, color: Colors.grey)),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: <Widget>[
                  //       Container(
                  //         padding: EdgeInsets.only(left: 15, top: 15),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: <Widget>[
                  //             Text(
                  //               "Recent Orders",
                  //               style: TextStyle(
                  //                   fontSize: 17, color: Colors.black),
                  //               textAlign: TextAlign.center,
                  //             ),
                  //             Container(
                  //                 margin: EdgeInsets.only(right: 10),
                  //                 child: Text(
                  //                   "4 Orders",
                  //                   style: TextStyle(
                  //                       color: Colors.black54, fontSize: 11),
                  //                 ))
                  //           ],
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         height: 10,
                  //       ),
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: <Widget>[
                  //           Expanded(
                  //             child: Container(
                  //               margin: EdgeInsets.only(left: 0, right: 0),
                  //               //color: sub_white,
                  //               width: MediaQuery.of(context).size.width / 1,
                  //               //padding: EdgeInsets.only(left: 10),
                  //               height: 230,
                  //               child: new ListView.builder(
                  //                 scrollDirection: Axis.horizontal,
                  //                 itemBuilder: (BuildContext context,
                  //                         int index) =>
                  //                     new Container(
                  //                       //color: Colors.white,
                  //                       margin: EdgeInsets.only(
                  //                           left: 10, right: 5, bottom: 15),
                  //                       padding: EdgeInsets.all(10),
                  //                       decoration: BoxDecoration(
                  //                         borderRadius: BorderRadius.all(
                  //                             Radius.circular(10.0)),
                  //                         color: Colors.white,
                  //                         border: Border.all(
                  //                             width: 0.3, color: Colors.grey),
                  //                         // boxShadow: [
                  //                         //   BoxShadow(
                  //                         //     blurRadius: 0.5,
                  //                         //     color: Colors.black.withOpacity(.5),
                  //                         //     //offset: Offset(6.0, 7.0),
                  //                         //   ),
                  //                         // ],
                  //                       ),
                  //                       child: GestureDetector(
                  //                         onTap: () {
                  //                           Navigator.push(
                  //                             context,
                  //                             MaterialPageRoute(
                  //                                 builder: (context) =>
                  //                                     DetailsPage()),
                  //                           );
                  //                         },
                  //                         child: Container(
                  //                           //padding: EdgeInsets.only(left: 20),
                  //                           width: 100,
                  //                           child: Column(
                  //                             children: <Widget>[
                  //                               Container(
                  //                                   height: 100,
                  //                                   child: Image.asset(
                  //                                       'assets/roll.jpg')),
                  //                               Text(
                  //                                 "Product Name",
                  //                                 style: TextStyle(
                  //                                     fontSize: 14,
                  //                                     color: Colors.black87),
                  //                                 textAlign: TextAlign.center,
                  //                               ),
                  //                               Container(
                  //                                 margin:
                  //                                     EdgeInsets.only(top: 5),
                  //                                 child: Row(
                  //                                   mainAxisAlignment:
                  //                                       MainAxisAlignment
                  //                                           .center,
                  //                                   children: <Widget>[
                  //                                     Row(
                  //                                       children: <Widget>[
                  //                                         Icon(
                  //                                           Icons.attach_money,
                  //                                           color:
                  //                                               Colors.black87,
                  //                                           size: 17,
                  //                                         ),
                  //                                         Text(
                  //                                           "20.25",
                  //                                           style: TextStyle(
                  //                                               fontSize: 15,
                  //                                               color: Colors
                  //                                                   .black87,
                  //                                               fontWeight:
                  //                                                   FontWeight
                  //                                                       .bold),
                  //                                         ),
                  //                                       ],
                  //                                     ),
                  //                                   ],
                  //                                 ),
                  //                               ),
                  //                               Container(
                  //                                 margin:
                  //                                     EdgeInsets.only(top: 5),
                  //                                 child: Row(
                  //                                   mainAxisAlignment:
                  //                                       MainAxisAlignment
                  //                                           .center,
                  //                                   children: <Widget>[
                  //                                     Text(
                  //                                       "23/07/19  12 PM",
                  //                                       style: TextStyle(
                  //                                           fontSize: 11,
                  //                                           color: Colors.grey),
                  //                                     ),
                  //                                   ],
                  //                                 ),
                  //                               ),
                  //                               Container(
                  //                                 child: Row(
                  //                                   mainAxisAlignment:
                  //                                       MainAxisAlignment
                  //                                           .center,
                  //                                   children: <Widget>[
                  //                                     GestureDetector(
                  //                                       onTap: () {},
                  //                                       child: Container(
                  //                                         margin:
                  //                                             EdgeInsets.only(
                  //                                                 left: 0,
                  //                                                 right: 0,
                  //                                                 top: 10),
                  //                                         padding:
                  //                                             EdgeInsets.all(5),
                  //                                         decoration: BoxDecoration(
                  //                                             borderRadius: BorderRadius
                  //                                                 .all(Radius
                  //                                                     .circular(
                  //                                                         5.0)),
                  //                                             color: header,
                  //                                             border: Border.all(
                  //                                                 width: 0.2,
                  //                                                 color: Colors
                  //                                                     .grey)),
                  //                                         child: Row(
                  //                                           children: <Widget>[
                  //                                             Container(
                  //                                                 margin: EdgeInsets
                  //                                                     .only(
                  //                                                         left:
                  //                                                             5),
                  //                                                 child: Text(
                  //                                                     "Reorder",
                  //                                                     style: TextStyle(
                  //                                                         color: Colors
                  //                                                             .white,
                  //                                                         fontSize:
                  //                                                             11))),
                  //                                             Icon(
                  //                                               Icons
                  //                                                   .arrow_right,
                  //                                               color: Colors
                  //                                                   .white,
                  //                                               size: 15,
                  //                                             ),
                  //                                           ],
                  //                                         ),
                  //                                       ),
                  //                                     ),
                  //                                   ],
                  //                                 ),
                  //                               ),
                  //                             ],
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     ),
                  //                 itemCount: 4,
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       )
                  //     ],
                  //   ),
                  // ),
                  //  Container(
                  //     height: 1,
                  //     width: 50,
                  //     child: Divider(
                  //       color: header,
                  //     )),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    //height: MediaQuery.of(context).size.height,
                    margin:
                        EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
                    padding: EdgeInsets.only(top: 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(0.0)),
                        color: Colors.white,
                        border: Border.all(width: 0.2, color: Colors.grey)),
                    child: infoCross % 2 == 0
                        ? DefaultTabController(
                            length: 5,
                            child: new Scaffold(
                              appBar: new AppBar(
                                automaticallyImplyLeading: false,
                                backgroundColor: Colors.white,
                                actions: <Widget>[],
                                title: new TabBar(
                                  isScrollable: true,
                                  labelColor: Colors.black,
                                  labelStyle: TextStyle(fontSize: 15),
                                  tabs: [
                                    new Tab(text: "Fast Food"),
                                    new Tab(text: "Biriyani"),
                                    new Tab(text: "Beverage"),
                                    new Tab(text: "Starter"),
                                    new Tab(text: "Chawmein")
                                  ],
                                  indicatorColor: header,
                                  unselectedLabelColor: Colors.grey,
                                ),
                              ),
                              body: TabBarView(
                                children: [
                                  OrientationBuilder(
                                    builder: (context, orientation) {
                                      return orientation ==
                                              Orientation.landscape
                                          ? ListView.builder(
                                              itemBuilder:
                                                  (BuildContext context,
                                                          int index) =>
                                                      new Padding(
                                                padding:
                                                    const EdgeInsets.all(0.0),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      num++;
                                                      if (index == 0) {
                                                        totalPrice += 150.0;
                                                        cartList.add({
                                                          'image':
                                                              'assets/burger.jpg',
                                                          'name': 'Burger',
                                                          'price': 150,
                                                          'quantity': 1
                                                        });
                                                      } else {
                                                        totalPrice += 120.0;
                                                        cartList.add({
                                                          'image':
                                                              'assets/pizza.jpg',
                                                          'name': 'Pizza',
                                                          'price': 120,
                                                          'quantity': 1
                                                        });
                                                      }
                                                    });
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: 5,
                                                        top: 5,
                                                        left: 10,
                                                        right: 10),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
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
                                                              children: <
                                                                  Widget>[
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        Column(
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
                                                                              CrossAxisAlignment.start,
                                                                          children: <
                                                                              Widget>[
                                                                            Row(
                                                                              children: <Widget>[
                                                                                Text(
                                                                                  index % 2 == 0 ? "Burger" : "Pizza",
                                                                                  style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Container(
                                                                              margin: EdgeInsets.only(top: 6),
                                                                              child: Text(
                                                                                index % 2 == 0 ? "Extra Cheese, Deep fried chicken pieces" : "Vegitable, chicken pieces, extra cheese",
                                                                                style: TextStyle(color: Colors.black54, fontSize: 12),
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
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                5,
                                                                            right:
                                                                                0,
                                                                            top:
                                                                                0),
                                                                        padding:
                                                                            EdgeInsets.all(5),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.all(Radius.circular(5.0)),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          children: <
                                                                              Widget>[
                                                                            Icon(
                                                                              Icons.attach_money,
                                                                              color: header,
                                                                              size: 18,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        index % 2 ==
                                                                                0
                                                                            ? "150"
                                                                            : "120",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                Colors.black),
                                                                      )
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
                                              itemBuilder:
                                                  (BuildContext context,
                                                          int index) =>
                                                      new Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      num++;
                                                      if (index == 0) {
                                                        totalPrice += 150.0;
                                                        cartList.add({
                                                          'image':
                                                              'assets/burger.jpg',
                                                          'name': 'Burger',
                                                          'price': 150,
                                                          'quantity': 1
                                                        });
                                                      } else {
                                                        totalPrice += 120.0;
                                                        cartList.add({
                                                          'image':
                                                              'assets/pizza.jpg',
                                                          'name': 'Pizza',
                                                          'price': 120,
                                                          'quantity': 1
                                                        });
                                                      }
                                                    });
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: 0,
                                                        top: 5,
                                                        left: 2.5,
                                                        right: 2.5),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
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
                                                    child: GridTile(
                                                      child: Stack(
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
                                                              children: <
                                                                  Widget>[
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        Column(
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
                                                                              CrossAxisAlignment.start,
                                                                          children: <
                                                                              Widget>[
                                                                            Row(
                                                                              children: <Widget>[
                                                                                Text(
                                                                                  index % 2 == 0 ? "Burger" : "Pizza",
                                                                                  style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Container(
                                                                              margin: EdgeInsets.only(top: 6),
                                                                              child: Text(
                                                                                index % 2 == 0 ? "Extra Cheese, Deep fried chicken pieces" : "Vegitable, chicken pieces, extra cheese",
                                                                                style: TextStyle(color: Colors.black54, fontSize: 12),
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
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                5,
                                                                            right:
                                                                                0,
                                                                            top:
                                                                                0),
                                                                        padding:
                                                                            EdgeInsets.all(5),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.all(Radius.circular(5.0)),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          children: <
                                                                              Widget>[
                                                                            Icon(
                                                                              Icons.attach_money,
                                                                              color: header,
                                                                              size: 18,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        index ==
                                                                                0
                                                                            ? "150"
                                                                            : "120",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                Colors.black),
                                                                      )
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
                                              itemCount: 2,
                                            );
                                    },
                                  ),
                                  OrientationBuilder(
                                    builder: (context, orientation) {
                                      return orientation ==
                                              Orientation.landscape
                                          ? ListView.builder(
                                              itemBuilder:
                                                  (BuildContext context,
                                                          int index) =>
                                                      new Padding(
                                                padding:
                                                    const EdgeInsets.all(0.0),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      num++;
                                                      if (index == 0) {
                                                        totalPrice += 170.0;
                                                        cartList.add({
                                                          'image':
                                                              'assets/biriyani.jpg',
                                                          'name':
                                                              'Chicken Biriyani',
                                                          'price': 170,
                                                          'quantity': 1
                                                        });
                                                      } else {
                                                        totalPrice += 135.0;
                                                        cartList.add({
                                                          'image':
                                                              'assets/biriyani2.jpg',
                                                          'name':
                                                              'Kashmiri Biriyani',
                                                          'price': 135,
                                                          'quantity': 1
                                                        });
                                                      }
                                                    });
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: 5,
                                                        top: 5,
                                                        left: 10,
                                                        right: 10),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
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
                                                              children: <
                                                                  Widget>[
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        Column(
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
                                                                              CrossAxisAlignment.start,
                                                                          children: <
                                                                              Widget>[
                                                                            Row(
                                                                              children: <Widget>[
                                                                                Text(
                                                                                  index % 2 == 0 ? "Chicken Biriyani" : "kashmiri Biriyani",
                                                                                  style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Container(
                                                                              margin: EdgeInsets.only(top: 6),
                                                                              child: Text(
                                                                                index % 2 == 0 ? "Chicken 2 pieces, Egg 1 piece, Salad" : "Chicken 2 pieces, Egg 1/2 piece, Salad",
                                                                                style: TextStyle(color: Colors.black54, fontSize: 12),
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
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                5,
                                                                            right:
                                                                                0,
                                                                            top:
                                                                                0),
                                                                        padding:
                                                                            EdgeInsets.all(5),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.all(Radius.circular(5.0)),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          children: <
                                                                              Widget>[
                                                                            Icon(
                                                                              Icons.attach_money,
                                                                              color: header,
                                                                              size: 18,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        index % 2 ==
                                                                                0
                                                                            ? "170"
                                                                            : "135",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                Colors.black),
                                                                      )
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
                                              itemBuilder:
                                                  (BuildContext context,
                                                          int index) =>
                                                      new Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      num++;
                                                      if (index == 0) {
                                                        totalPrice += 170.0;
                                                        cartList.add({
                                                          'image':
                                                              'assets/biriyani.jpg',
                                                          'name':
                                                              'Chicken Biriyani',
                                                          'price': 170,
                                                          'quantity': 1
                                                        });
                                                      } else {
                                                        totalPrice += 135.0;
                                                        cartList.add({
                                                          'image':
                                                              'assets/biriyani2.jpg',
                                                          'name':
                                                              'Kashmiri Biriyani',
                                                          'price': 135,
                                                          'quantity': 1
                                                        });
                                                      }
                                                    });
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: 0,
                                                        top: 5,
                                                        left: 2.5,
                                                        right: 2.5),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
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
                                                    child: GridTile(
                                                      child: Stack(
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
                                                              children: <
                                                                  Widget>[
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        Column(
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
                                                                              CrossAxisAlignment.start,
                                                                          children: <
                                                                              Widget>[
                                                                            Row(
                                                                              children: <Widget>[
                                                                                Text(
                                                                                  index % 2 == 0 ? "Chicken Biriyani" : "kashmiri Biriyani",
                                                                                  style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Container(
                                                                              margin: EdgeInsets.only(top: 6),
                                                                              child: Text(
                                                                                index % 2 == 0 ? "Chicken 2 pieces, Egg 1 piece, Salad" : "Chicken 2 pieces, Egg 1/2 piece, Salad",
                                                                                style: TextStyle(color: Colors.black54, fontSize: 12),
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
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                5,
                                                                            right:
                                                                                0,
                                                                            top:
                                                                                0),
                                                                        padding:
                                                                            EdgeInsets.all(5),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.all(Radius.circular(5.0)),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          children: <
                                                                              Widget>[
                                                                            Icon(
                                                                              Icons.attach_money,
                                                                              color: header,
                                                                              size: 18,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        index % 2 ==
                                                                                0
                                                                            ? "170"
                                                                            : "135",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                Colors.black),
                                                                      )
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
                                              itemCount: 2,
                                            );
                                    },
                                  ),
                                  Center(
                                      child: Container(
                                          child: Text("No Food Available"))),
                                  Center(
                                      child: Container(
                                          child: Text("No Food Available"))),
                                  Center(
                                      child: Container(
                                          child: Text("no Food Available")))
                                ],
                              ),
                            ),
                          )
                        : DefaultTabController(
                            length: 3,
                            child: new Scaffold(
                              appBar: new AppBar(
                                automaticallyImplyLeading: false,
                                backgroundColor: Colors.white,
                                actions: <Widget>[],
                                title: new TabBar(
                                  //isScrollable: true,
                                  labelColor: Colors.black,
                                  labelStyle: TextStyle(fontSize: 15),
                                  tabs: [
                                    new Tab(text: "About"),
                                    new Tab(text: "Gallery"),
                                    new Tab(text: "Review")
                                  ],
                                  indicatorColor: header,
                                  unselectedLabelColor: Colors.grey,
                                ),
                              ),
                              body: TabBarView(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(10),
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
                                    child: SingleChildScrollView(
                                      physics: BouncingScrollPhysics(),
                                      child: Container(
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  padding: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      border: Border.all(
                                                          width: 0.5,
                                                          color: header)),
                                                  height: 45,
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    child: Image.asset(
                                                      'assets/meal1.png',
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 10,
                                                                    bottom: 3),
                                                            child: Text(
                                                                "Panshi Restaurant",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    color: Colors
                                                                        .black))),
                                                        Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 0,
                                                                    bottom: 10),
                                                            child: Text(
                                                                "Bangladeshi",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    color: Colors
                                                                        .black45))),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Divider(),
                                            Container(
                                              //width: 100,
                                              padding: EdgeInsets.only(
                                                  bottom: 0, top: 5),
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
                                                        children: <Widget>[
                                                          Container(
                                                              //margin: EdgeInsets.only(top: 10),
                                                              //padding: EdgeInsets.all(10),
                                                              child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              Container(
                                                                child: Row(
                                                                  children: <
                                                                      Widget>[
                                                                    Icon(
                                                                      Icons
                                                                          .timer,
                                                                      color:
                                                                          header,
                                                                      size: 17,
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets.only(
                                                                          left:
                                                                              5),
                                                                      child:
                                                                          Text(
                                                                        "Time",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize: 15),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 4,
                                                                        left:
                                                                            22.5),
                                                                child: Text(
                                                                  "11:00 AM - 10:30 PM",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54,
                                                                      fontSize:
                                                                          12),
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
                                                      children: <Widget>[
                                                        Container(
                                                          //width: MediaQuery.of(context).size.width,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 0,
                                                                  right: 5,
                                                                  top: 0),
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          5.0)),
                                                              color:
                                                                  Colors.white,
                                                              border: Border.all(
                                                                  width: 0.2,
                                                                  color: Colors
                                                                      .white)),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: <Widget>[
                                                              Icon(
                                                                Icons.done,
                                                                color: header,
                                                                size: 12,
                                                              ),
                                                              Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              5),
                                                                  child: Text(
                                                                      "Open",
                                                                      style: TextStyle(
                                                                          color:
                                                                              header,
                                                                          fontSize:
                                                                              12)))
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(),
                                            Container(
                                              //width: 100,
                                              padding: EdgeInsets.only(
                                                  bottom: 0, top: 5),
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
                                                        children: <Widget>[
                                                          Container(
                                                              //margin: EdgeInsets.only(top: 10),
                                                              //padding: EdgeInsets.all(10),
                                                              child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              Container(
                                                                child: Row(
                                                                  children: <
                                                                      Widget>[
                                                                    Icon(
                                                                      Icons
                                                                          .location_on,
                                                                      color:
                                                                          header,
                                                                      size: 17,
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets.only(
                                                                          left:
                                                                              5),
                                                                      child:
                                                                          Text(
                                                                        "Location",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize: 15),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 4,
                                                                        left:
                                                                            22.5),
                                                                child: Text(
                                                                  "Sylhet",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54,
                                                                      fontSize:
                                                                          12),
                                                                ),
                                                              ),
                                                            ],
                                                          )),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(),
                                            Container(
                                              //width: 100,
                                              padding: EdgeInsets.only(
                                                  bottom: 0, top: 5),
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
                                                        children: <Widget>[
                                                          Container(
                                                              //margin: EdgeInsets.only(top: 10),
                                                              //padding: EdgeInsets.all(10),
                                                              child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              Container(
                                                                child: Row(
                                                                  children: <
                                                                      Widget>[
                                                                    Icon(
                                                                      Icons
                                                                          .phone,
                                                                      color:
                                                                          header,
                                                                      size: 17,
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets.only(
                                                                          left:
                                                                              5),
                                                                      child:
                                                                          Text(
                                                                        "Contact no.",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize: 15),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 4,
                                                                        left:
                                                                            22.5),
                                                                child: Text(
                                                                  "017XXXXXXXX",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54,
                                                                      fontSize:
                                                                          12),
                                                                ),
                                                              ),
                                                            ],
                                                          )),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(),
                                            Container(
                                              //width: 100,
                                              padding: EdgeInsets.only(
                                                  bottom: 0, top: 5),
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
                                                        children: <Widget>[
                                                          Container(
                                                              //margin: EdgeInsets.only(top: 10),
                                                              //padding: EdgeInsets.all(10),
                                                              child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              Container(
                                                                child: Row(
                                                                  children: <
                                                                      Widget>[
                                                                    Icon(
                                                                      Icons
                                                                          .email,
                                                                      color:
                                                                          header,
                                                                      size: 17,
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets.only(
                                                                          left:
                                                                              5),
                                                                      child:
                                                                          Text(
                                                                        "E-mail",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize: 15),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 4,
                                                                        left:
                                                                            22.5),
                                                                child: Text(
                                                                  "panshires1@gmail.com",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54,
                                                                      fontSize:
                                                                          12),
                                                                ),
                                                              ),
                                                            ],
                                                          )),
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
                                  Center(
                                      child: Container(
                                          child: GridView.builder(
                                    physics: BouncingScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: (MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2) /
                                          (MediaQuery.of(context).size.height /
                                              4.5),
                                    ),
                                    //scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext context, int index) =>
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
                                              Radius.circular(5)),
                                          border: Border.all(
                                              width: 0.5, color: Colors.grey),
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //       builder: (context) =>
                                            //           DetailsPage()),
                                            // );
                                          },
                                          child: GridTile(
                                            child: Container(
                                              //width: 100,
                                              padding: EdgeInsets.only(
                                                  right: 5, left: 5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  Center(
                                                    child: Container(
                                                      //color: Colors.red,

                                                      padding:
                                                          const EdgeInsets.all(
                                                              0.0),
                                                      margin: EdgeInsets.only(
                                                          top: 0),
                                                      child: Image.asset(
                                                        index == 0
                                                            ? 'assets/burger.jpg'
                                                            : index == 1
                                                                ? 'assets/roll.jpg'
                                                                : index == 2
                                                                    ? 'assets/pizza.jpg'
                                                                    : 'assets/sandwich.jpg',
                                                        //height: 100,
                                                        width: 140,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    itemCount: 4,
                                  ))),
                                  Row(
                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      // Container(
                                      //   width: MediaQuery.of(context).size.width / 6,
                                      //   child: Container(
                                      //     //padding: EdgeInsets.only(left: 20),
                                      //     width: 100,
                                      //     child: Column(
                                      //       children: <Widget>[
                                      //         Container(
                                      //           height: 55,
                                      //         ),
                                      //         Text(
                                      //           "Name",
                                      //           style: TextStyle(
                                      //               fontSize: 13, color: Colors.black38),
                                      //           textAlign: TextAlign.center,
                                      //         ),
                                      //         Container(
                                      //           margin: EdgeInsets.only(top: 10),
                                      //           child: Text(
                                      //             "Rating",
                                      //             style: TextStyle(
                                      //                 fontSize: 13, color: Colors.black38),
                                      //             textAlign: TextAlign.center,
                                      //           ),
                                      //         ),
                                      //       ],
                                      //     ),
                                      //   ),
                                      // ),
                                      Container(
                                        child: Expanded(
                                          child: Column(
                                            children: <Widget>[
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ReataurantReviewPage()));
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      right: 10,
                                                      top: 20,
                                                      bottom: 15),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: <Widget>[
                                                      Icon(Icons.edit,
                                                          color: header,
                                                          size: 15),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 5),
                                                        child: Text(
                                                          "Write a review",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              color: header,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      left: 0, right: 0),
                                                  //color: sub_white,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      1,
                                                  padding:
                                                      EdgeInsets.only(left: 2),
                                                  //height: 250,
                                                  child: new ListView.builder(
                                                    physics:
                                                        BouncingScrollPhysics(),
                                                    //scrollDirection: Axis.horizontal,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                                int index) =>
                                                            new Container(
                                                      //color: Colors.white,
                                                      margin: EdgeInsets.all(5),
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          1.0)),
                                                          color: Colors.white,
                                                          border: Border.all(
                                                              width: 0.2,
                                                              color:
                                                                  Colors.grey)),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        DetailsPage()),
                                                          );
                                                        },
                                                        child: Container(
                                                          //padding: EdgeInsets.only(left: 20),
                                                          width: 100,
                                                          child: Center(
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                Container(
                                                                  //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              1.0),
                                                                  child:
                                                                      CircleAvatar(
                                                                    radius:
                                                                        25.0,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    backgroundImage:
                                                                        AssetImage(
                                                                            'assets/user.png'),
                                                                  ),
                                                                  decoration:
                                                                      new BoxDecoration(
                                                                    color: Colors
                                                                        .grey, // border color
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Expanded(
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: <
                                                                        Widget>[
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: <
                                                                            Widget>[
                                                                          Expanded(
                                                                            child:
                                                                                Text(
                                                                              "${reviewList[index]['name']}",
                                                                              overflow: TextOverflow.ellipsis,
                                                                              style: TextStyle(fontSize: 13, color: Colors.black54, fontWeight: FontWeight.bold),
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            "${reviewList[index]['time']}",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 11,
                                                                              color: Colors.grey,
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                5),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: <
                                                                              Widget>[
                                                                            Container(
                                                                              child: SmoothStarRating(
                                                                                allowHalfRating: false,
                                                                                rating: reviewList[index]['rating'],
                                                                                size: 15,
                                                                                starCount: 5,
                                                                                spacing: 1.0,
                                                                                color: header,
                                                                                //borderColor: Colors.teal[400],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                5),
                                                                        child:
                                                                            Text(
                                                                          "${reviewList[index]['review']}",
                                                                          style: TextStyle(
                                                                              fontSize: 13,
                                                                              color: Colors.black38),
                                                                          textAlign:
                                                                              TextAlign.justify,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          maxLines:
                                                                              1,
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
                                                    itemCount:
                                                        reviewList.length,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartPage(1)));
        },
        child: Container(
          height: num == 0 && totalPrice == 0.0 ? 0 : 50,
          width: MediaQuery.of(context).size.width,
          color: header,
          child: Container(
            margin: EdgeInsets.only(right: 20, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text("${cartList.length}",
                        style: TextStyle(color: Colors.black, fontSize: 13))),
                Expanded(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Checkout",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center),
                        Icon(Icons.keyboard_arrow_right,
                            size: 15, color: Colors.white),
                      ],
                    ),
                  ),
                ),
                Container(
                    child: Row(
                  children: <Widget>[
                    Icon(Icons.attach_money, size: 15, color: Colors.white),
                    Text(
                      "$totalPrice",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void dateTimePick() {
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
                    margin: EdgeInsets.only(top: 10),
                    //margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                              //padding: EdgeInsets.all(10),
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.calendar_today,
                                    color: header,
                                    size: 17,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Delivery Date",
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 15),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 22.5, top: 6),
                                child: Text(
                                  "Today",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                              ),
                            ],
                          )),
                        ),
                        GestureDetector(
                          onTap: () {
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
                                  color: Colors.white),
                              child: Icon(Icons.arrow_right,
                                  size: 25, color: header),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    //margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                              //padding: EdgeInsets.all(10),
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.timer,
                                    color: header,
                                    size: 17,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Delivery Time",
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 15),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 22.5, top: 6),
                                child: Text(
                                  "ASAP",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                              ),
                            ],
                          )),
                        ),
                        GestureDetector(
                          onTap: () {
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
                                  color: Colors.white),
                              child: Icon(Icons.arrow_right,
                                  size: 25, color: header),
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
                                    Icons.done,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text("Select",
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
