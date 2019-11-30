import 'package:flutter/material.dart';
import 'package:foodpanda_app/MainScreen/FoodDetailsPage/details.dart';

import '../../main.dart';

class LandscapeFoodCard extends StatefulWidget {
  final index;
  LandscapeFoodCard(this.index);
  @override
  _LandscapeFoodCardState createState() => _LandscapeFoodCardState();
}

class _LandscapeFoodCardState extends State<LandscapeFoodCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailsPage()),
          );
        },
        child: ListTile(
          title: Stack(
            children: <Widget>[
              Container(
                //width: 100,
                padding: EdgeInsets.only(bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Center(
                      child: Container(
                        //color: Colors.red,

                        padding: const EdgeInsets.all(0.0),
                        margin: EdgeInsets.only(top: 0),
                        child: Image.asset(
                          widget.index % 2 == 0
                              ? 'assets/burger.jpg'
                              : 'assets/roll.jpg',
                          height: 100,
                          width: 120,
                          fit: BoxFit.cover,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Text(
                                widget.index % 2 == 0
                                    ? "Restaurant Name"
                                    : "Restaurant Name from list",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  //Icon(Icons.label_important, size: 15, color: header,),
                                  Container(
                                    margin: EdgeInsets.only(left: 0),
                                    child: Text(
                                        widget.index % 2 == 0
                                            ? "Thai, Chinese"
                                            : "Italian, Chinese, Thai",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black87)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8, left: 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          right: 8, top: 0, bottom: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.attach_money,
                                            size: 13,
                                            color: header,
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 3),
                                              child: Text(
                                                  widget.index % 2 == 0
                                                      ? "Free Delivery"
                                                      : "50 (Delivery Charge)",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold)),
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
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    //color: Colors.red,
                                    margin: EdgeInsets.only(
                                        right: 8, top: 0, bottom: 0, left: 0),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.timer,
                                          size: 13,
                                          color: header,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 4),
                                          child: Text(
                                              widget.index % 2 == 0
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
                                      children: <Widget>[
                                        Icon(
                                          Icons.star,
                                          color: header,
                                          size: 12,
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(left: 3),
                                            child: Text("5.0",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 12))),
                                        Container(
                                            margin: EdgeInsets.only(left: 2),
                                            child: Text("(30)",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 12)))
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
                margin: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(5),
                        color: widget.index % 2 == 0
                            ? header.withOpacity(0.7)
                            : Colors.transparent,
                        child: Text(
                          widget.index % 2 == 0 ? "20% OFF" : "",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
