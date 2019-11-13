import 'package:flutter/material.dart';

import '../../main.dart';

class ReataurantReviewPage extends StatefulWidget {
  @override
  _ReataurantReviewPageState createState() => _ReataurantReviewPageState();
}

class _ReataurantReviewPageState extends State<ReataurantReviewPage> {
  int page = 0;
  String review = '', _ratingStatus = 'No review';

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
      _ratingStatus = "Below Average";
    }
    if (rating == 3) {
      _ratingStatus = "Average";
    }
    if (rating == 4) {
      _ratingStatus = "Good";
    }
    if (rating == 5) {
      _ratingStatus = "Excellent";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                    Text("Restaurant Review",
                        style: TextStyle(fontSize: 17, color: Colors.black54)),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: CustomScrollView(slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 25, top: 15),
              child: new Column(
                children: <Widget>[
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 15, left: 20),
                      child: Text(
                        "Fill up the below information to write your review",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 14,
                            fontFamily: 'Oswald',
                            fontWeight: FontWeight.w300),
                      )),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 20),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Rating",
                          style: TextStyle(
                              color: Colors.grey, fontFamily: "Oswald"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10, top: 10, left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new GestureDetector(
                                  child: new Icon(
                                    Icons.star,
                                    color: _rating >= 1
                                        ? header
                                        : Colors.grey.withOpacity(0.3),
                                  ),
                                  onTap: () => rate(1),
                                ),
                                new GestureDetector(
                                  child: new Icon(
                                    Icons.star,
                                    color: _rating >= 2
                                        ? header
                                        : Colors.grey.withOpacity(0.4),
                                  ),
                                  onTap: () => rate(2),
                                ),
                                new GestureDetector(
                                  child: new Icon(
                                    Icons.star,
                                    color: _rating >= 3
                                        ? header
                                        : Colors.grey.withOpacity(0.4),
                                  ),
                                  onTap: () => rate(3),
                                ),
                                new GestureDetector(
                                  child: new Icon(
                                    Icons.star,
                                    color: _rating >= 4
                                        ? header
                                        : Colors.grey.withOpacity(0.4),
                                  ),
                                  onTap: () => rate(4),
                                ),
                                new GestureDetector(
                                  child: new Icon(
                                    Icons.star,
                                    color: _rating >= 5
                                        ? header
                                        : Colors.grey.withOpacity(0.4),
                                  ),
                                  onTap: () => rate(5),
                                )
                              ],
                            ),
                          ],
                        ),
                        Text(
                          _ratingStatus,
                          style: TextStyle(
                              color: Colors.grey, fontFamily: "Oswald"),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 10,
                      top: 15,
                      left: 20,
                    ),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(left: 0, right: 0, top: 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3.0,
                              color: Colors.black.withOpacity(.2),
                              //offset: Offset(6.0, 7.0),
                            ),
                          ],
                          //border: Border.all(color: Colors.grey, width: 0.3),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(left: 5, top: 3),
                                child: Icon(
                                  Icons.description,
                                  size: 19,
                                  color: header,
                                )),
                            Flexible(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxHeight: 200.0, minHeight: 100.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: TextField(
                                    maxLines: null,
                                    //controller: phoneController,
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: 'Oswald',
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "Description (Optional)",
                                      hintStyle: TextStyle(
                                          color: Colors.black38,
                                          fontSize: 15,
                                          fontFamily: 'Oswald',
                                          fontWeight: FontWeight.w300),
                                      //labelStyle: TextStyle(color: Colors.white70),
                                      contentPadding: EdgeInsets.fromLTRB(
                                          10.0, 0.0, 10.0, 0.0),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(left: 20, right: 0, bottom: 20),
                      decoration: BoxDecoration(
                          color: header,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Text(
                        "Send",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: 'BebasNeue',
                        ),
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
            ),
          )
        ]));
  }
}
