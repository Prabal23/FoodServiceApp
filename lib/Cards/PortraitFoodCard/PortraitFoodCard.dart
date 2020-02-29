import 'package:flutter/material.dart';
import 'package:foodpanda_app/MainScreen/FoodDetailsPage/details.dart';

import '../../main.dart';

class PortraitFoodCard extends StatefulWidget {
  final foodList;
  PortraitFoodCard(this.foodList);
  @override
  _PortraitFoodCardState createState() => _PortraitFoodCardState();
}

class _PortraitFoodCardState extends State<PortraitFoodCard> {
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
                          widget.foodList['image'],
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
                                widget.foodList['name'],
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
                                    child: Text(widget.foodList['type'],
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
                                                  widget
                                                      .foodList['deliveryType'],
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
                                          child: Text(widget.foodList['time'],
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
                                            child: Text(
                                                widget.foodList['rating'],
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 12))),
                                        Container(
                                            margin: EdgeInsets.only(left: 2),
                                            child: Text(
                                                "(${widget.foodList['people']})",
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
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(5),
                        color: widget.foodList['discout'] != ''
                            ? header.withOpacity(0.7)
                            : Colors.transparent,
                        child: Text(
                          widget.foodList['discout'] != ''
                              ? "${widget.foodList['discout']}"
                              : "",
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
