import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:foodpanda_app/MainScreen/RegisterPage/registerPage.dart';
import 'package:foodpanda_app/MainScreen/ReviewDriverPage/reviewDriverPage.dart';
import 'package:foodpanda_app/main.dart';
import 'package:intl/intl.dart';

class CartPage extends StatefulWidget {
  final cc;
  CartPage(this.cc);
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<CartPage> {
  TextEditingController _reviewController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  Animation<double> animation;
  AnimationController controller;
  String _debugLabelString = "",
      review = '',
      runningdate = '',
      place = "",
      phone = "",
      payment = "",
      result = '';
  int val = 1, _current = 0, totalProducts = 0;
  double discount = 0.0,
      subtotal = 0.0,
      couponDiscount = 0.0,
      shippingCost = 50.0,
      payableTotal = 0.0;
  var dd, finalDate;
  DateTime _date = DateTime.now();
  bool placeEdit = false,
      phoneEdit = false,
      paymentChoose = false,
      couponOpen = false;

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
    var now = new DateTime.now();
    runningdate = new DateFormat("dd-MM-yyyy").format(now);
    setState(() {
      placeController.text = "New York, USA";
      phoneController.text = "087XXXXXXXX";
    });

    cartProducts();

    super.initState();
  }

  void cartProducts() {
    print(cartList);
    setState(() {
      totalProducts = cartList.length;
    });
    if (totalProducts == 0) {
      totalPrice = 0.0;
    } else {
      for (int i = 0; i < cartList.length; i++) {
        setState(() {
          //totalPrice += cartList[i]['price'];
          print(totalPrice);
        });
      }
    }

    setState(() {
      subtotal = totalPrice - discount;
      payableTotal = totalPrice - (discount + couponDiscount) + shippingCost;
    });
  }

  void _getDate() {
    final DateTime now = DateTime.now();
    final String formattedDateTime1 = _formatDateTime1(now);
    setState(() {
      runningdate = formattedDateTime1;
    });
  }

  String _formatDateTime1(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime);
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1915),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _date) {
      dd = DateTime.parse(_date.toString());
      finalDate = "${dd.day}-${dd.month}-${dd.year}";
      runningdate = finalDate.toString();
      setState(() {
        _date = picked;
        var dd1 = DateTime.parse(_date.toString());
        var finalDate1 = "${dd1.day}-${dd1.month}-${dd1.year}";
        runningdate = finalDate1.toString();
      });
    }
  }

  int _rating = 0;

  void rate(int rating) {
    //Other actions based on rating such as api calls.
    setState(() {
      _rating = rating;
    });
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
            appBar: widget.cc == 0
                ? null
                : AppBar(
                    iconTheme: IconThemeData(color: header),
                    backgroundColor: Colors.white,
                    title: Center(
                      child: Container(
                        child: Container(
                          margin: EdgeInsets.only(top: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Checkout",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black54)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
            body: totalProducts == 0
                ? Container(
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
                                      width: 150,
                                      child: Center(
                                        child: Container(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Image.asset(
                                            'assets/no_product.jpg',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child: Text("No products yet!",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold))),
                                    Container(
                                        margin:
                                            EdgeInsets.only(top: 0, bottom: 10),
                                        child: Text(
                                            "It seems you have no products yet\nSearch in the homepage to add your food item.",
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
                : SingleChildScrollView(
                    child: Container(
                      color: sub_white,
                      //height: MediaQuery.of(context).size.height,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(
                                  top: 5, left: 20, right: 20, bottom: 5),
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 0.2, color: Colors.grey)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Product List",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 5, right: 5, bottom: 5),
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                        children: List.generate(cartList.length,
                                            (int index) {
                                      val = cartList[index]['quantity'];
                                      return Column(children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 5, bottom: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Expanded(
                                                child: Container(
                                                  child: Row(
                                                    children: <Widget>[
                                                      Container(
                                                        width: 55,
                                                        height: 55,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    '${cartList[index]['image']}'),
                                                                fit: BoxFit
                                                                    .cover),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 5),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              Container(
                                                                  //color: Colors.grey[200],
                                                                  //padding: EdgeInsets.all(20),
                                                                  child: Text(
                                                                cartList[index]
                                                                    ['name'],
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey),
                                                              )),
                                                              Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              10),
                                                                  child: Row(
                                                                    children: <
                                                                        Widget>[
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            cartList[index]['quantity']--;
                                                                            if (cartList[index]['quantity'] <=
                                                                                0) {
                                                                              cartList[index]['quantity'] = 1;
                                                                            } else {
                                                                              totalPrice -= cartList[index]['price'];
                                                                              subtotal = totalPrice - discount;
                                                                              payableTotal = totalPrice - (discount + couponDiscount) + shippingCost;
                                                                            }
                                                                          });
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          decoration: BoxDecoration(
                                                                              border: Border.all(color: header),
                                                                              borderRadius: BorderRadius.circular(5)),
                                                                          padding:
                                                                              EdgeInsets.all(2),
                                                                          margin: EdgeInsets.only(
                                                                              left: 3,
                                                                              right: 10),
                                                                          child: Icon(
                                                                              Icons.remove,
                                                                              size: 15,
                                                                              color: header),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "${cartList[index]['quantity']}",
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black54),
                                                                      ),
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            cartList[index]['quantity']++;
                                                                          });
                                                                          print(cartList[index]
                                                                              [
                                                                              'quantity']);
                                                                          totalPrice +=
                                                                              cartList[index]['price'];
                                                                          subtotal =
                                                                              totalPrice - discount;
                                                                          payableTotal = totalPrice -
                                                                              (discount + couponDiscount) +
                                                                              shippingCost;
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          decoration: BoxDecoration(
                                                                              border: Border.all(color: header),
                                                                              borderRadius: BorderRadius.circular(5)),
                                                                          padding:
                                                                              EdgeInsets.all(2),
                                                                          margin: EdgeInsets.only(
                                                                              left: 10,
                                                                              right: 3),
                                                                          child: Icon(
                                                                              Icons.add,
                                                                              size: 15,
                                                                              color: header),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ))
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Colors.grey[200],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15)),
                                                      margin: EdgeInsets.only(
                                                          top: 5, right: 20),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Container(
                                                              //color: Colors.grey[200],
                                                              //padding: EdgeInsets.all(20),
                                                              child: Text(
                                                            "\$ ${cartList[index]['price']}",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black45,
                                                                fontSize: 13),
                                                          )),
                                                        ],
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          cartList
                                                              .removeAt(index);
                                                          totalPrice = 0.0;
                                                          cartProducts();
                                                        });
                                                      },
                                                      child: Container(
                                                          child: Icon(
                                                        Icons.delete,
                                                        color: Colors.redAccent,
                                                      )),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.grey[300],
                                        ),
                                      ]);
                                    })),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(
                                  top: 5, left: 20, right: 20, bottom: 5),
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 0.2, color: Colors.grey)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Shopping Details",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 5, right: 5, bottom: 5),
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 5, bottom: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                  //color: Colors.grey[200],
                                                  //padding: EdgeInsets.all(20),
                                                  child: Text(
                                                "Total Products",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              )),
                                              Container(
                                                  child: Text(
                                                "$totalProducts",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: Colors.black54),
                                              ))
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 15, bottom: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                  //color: Colors.grey[200],
                                                  //padding: EdgeInsets.all(20),
                                                  child: Text(
                                                "Total Price",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              )),
                                              Container(
                                                  child: Row(
                                                children: <Widget>[
                                                  Icon(Icons.attach_money,
                                                      size: 15,
                                                      color: Colors.black54),
                                                  Text(
                                                    "$totalPrice",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        color: Colors.black54),
                                                  ),
                                                ],
                                              ))
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 15, bottom: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                  //color: Colors.grey[200],
                                                  //padding: EdgeInsets.all(20),
                                                  child: Text(
                                                "Discount",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              )),
                                              Container(
                                                  child: Row(
                                                children: <Widget>[
                                                  Icon(Icons.remove,
                                                      size: 15, color: header),
                                                  Icon(Icons.attach_money,
                                                      size: 15, color: header),
                                                  Text(
                                                    "$discount",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        color: header),
                                                  ),
                                                ],
                                              ))
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 15, bottom: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                  //color: Colors.grey[200],
                                                  //padding: EdgeInsets.all(20),
                                                  child: Text(
                                                "Sub Total",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              )),
                                              Container(
                                                  child: Row(
                                                children: <Widget>[
                                                  Icon(Icons.attach_money,
                                                      size: 15,
                                                      color: Colors.black54),
                                                  Text(
                                                    "$subtotal",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        color: Colors.black54),
                                                  ),
                                                ],
                                              ))
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 15, bottom: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                  //color: Colors.grey[200],
                                                  //padding: EdgeInsets.all(20),
                                                  child: Text(
                                                "Coupon Discount",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              )),
                                              Container(
                                                  child: Row(
                                                children: <Widget>[
                                                  Icon(Icons.remove,
                                                      size: 15, color: header),
                                                  Icon(Icons.attach_money,
                                                      size: 15, color: header),
                                                  Text(
                                                    "$couponDiscount",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        color: header),
                                                  ),
                                                ],
                                              ))
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 15, bottom: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                  //color: Colors.grey[200],
                                                  //padding: EdgeInsets.all(20),
                                                  child: Text(
                                                "Shipping Cost",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              )),
                                              Container(
                                                  child: Row(
                                                children: <Widget>[
                                                  Icon(Icons.attach_money,
                                                      size: 15,
                                                      color: Colors.black54),
                                                  Text(
                                                    "$shippingCost",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        color: Colors.black54),
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
                                          margin: EdgeInsets.only(
                                              top: 5, bottom: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                  //color: Colors.grey[200],
                                                  //padding: EdgeInsets.all(20),
                                                  child: Text(
                                                "Total Payable",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              )),
                                              Container(
                                                  child: Row(
                                                children: <Widget>[
                                                  Icon(Icons.attach_money,
                                                      size: 15,
                                                      color: Colors.black),
                                                  Text(
                                                    "$payableTotal",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ))
                                            ],
                                          ),
                                        ),
                                        couponOpen == false
                                            ? Container()
                                            : Container(
                                                margin:
                                                    EdgeInsets.only(top: 20),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Flexible(
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 5),
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius: BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        5),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        5)),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .black45,
                                                                width: 0.2)),
                                                        child: TextField(
                                                          autofocus: false,
                                                          controller:
                                                              _reviewController,
                                                          decoration: InputDecoration(
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              hintText:
                                                                  "Type voucher number...",
                                                              hintStyle:
                                                                  TextStyle(
                                                                      fontSize:
                                                                          13)),
                                                          onChanged: (value) {
                                                            review = value;
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            left: 0),
                                                        padding: EdgeInsets
                                                            .only(
                                                                top: 14,
                                                                bottom: 14,
                                                                left: 10,
                                                                right: 10),
                                                        decoration: BoxDecoration(
                                                            color: header,
                                                            borderRadius: BorderRadius.only(
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            5),
                                                                topRight: Radius
                                                                    .circular(
                                                                        5)),
                                                            border: Border.all(
                                                                color: header,
                                                                width: 0.2)),
                                                        child: Text(
                                                          "Apply",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (couponOpen == true) {
                                                couponOpen = false;
                                              } else {
                                                couponOpen = true;
                                              }
                                            });
                                          },
                                          child: Container(
                                              margin: EdgeInsets.only(top: 15),
                                              alignment: Alignment.centerLeft,
                                              //color: Colors.grey[200],
                                              //padding: EdgeInsets.all(20),
                                              child: Text(
                                                couponOpen == false
                                                    ? "Do you have voucher?"
                                                    : "Not now",
                                                style: TextStyle(
                                                    color: header,
                                                    fontSize: 13),
                                              )),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(
                                    top: 5, left: 20, right: 20, bottom: 5),
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 0.2, color: Colors.grey)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Deliver To",
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.black),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 5, right: 5, bottom: 5),
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 5, bottom: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Container(
                                                    //color: Colors.grey[200],
                                                    //padding: EdgeInsets.all(20),
                                                    child: Text(
                                                  "John Smith",
                                                  style: TextStyle(
                                                      color: Colors.black54),
                                                )),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 0, right: 5, bottom: 5),
                                      width: MediaQuery.of(context).size.width,
                                      child: Center(
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Flexible(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        top: 5, bottom: 5),
                                                    child: Row(
                                                      children: <Widget>[
                                                        Icon(Icons.location_on,
                                                            color: Colors.grey,
                                                            size: 16),
                                                        Flexible(
                                                          child: placeEdit ==
                                                                  true
                                                              ? Container(
                                                                  //height: 100,
                                                                  child:
                                                                      new TextField(
                                                                    maxLines:
                                                                        null,
                                                                    autofocus:
                                                                        true,
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black45,
                                                                      fontSize:
                                                                          14,
                                                                      fontFamily:
                                                                          'Oswald',
                                                                    ),
                                                                    controller:
                                                                        placeController,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      alignLabelWithHint:
                                                                          true,
                                                                      hintText:
                                                                          "Place name",
                                                                      hintStyle: TextStyle(
                                                                          color: Colors
                                                                              .black54,
                                                                          fontSize:
                                                                              14,
                                                                          fontFamily:
                                                                              'Oswald',
                                                                          fontWeight:
                                                                              FontWeight.w300),
                                                                      contentPadding: EdgeInsets.fromLTRB(
                                                                          5.0,
                                                                          10.0,
                                                                          20.0,
                                                                          10.0),
                                                                      border: InputBorder
                                                                          .none,
                                                                    ),
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        place =
                                                                            value;
                                                                      });
                                                                    },
                                                                  ),
                                                                )
                                                              : Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              5),
                                                                  child: Text(
                                                                    "New York, USA",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .grey),
                                                                  )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      if (placeEdit == true) {
                                                        placeEdit = false;
                                                      } else {
                                                        placeEdit = true;
                                                      }
                                                    });
                                                  },
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 5),
                                                      child: Text(
                                                        placeEdit == true
                                                            ? "Done"
                                                            : "Edit",
                                                        style: TextStyle(
                                                            color: header),
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 0, right: 5, bottom: 5),
                                      width: MediaQuery.of(context).size.width,
                                      child: Center(
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Flexible(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        top: 5, bottom: 5),
                                                    child: Row(
                                                      children: <Widget>[
                                                        Icon(Icons.phone,
                                                            color: Colors.grey,
                                                            size: 16),
                                                        Flexible(
                                                          child: phoneEdit ==
                                                                  true
                                                              ? Container(
                                                                  //height: 100,
                                                                  child:
                                                                      new TextField(
                                                                    maxLines:
                                                                        null,
                                                                    autofocus:
                                                                        true,
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black45,
                                                                      fontSize:
                                                                          14,
                                                                      fontFamily:
                                                                          'Oswald',
                                                                    ),
                                                                    controller:
                                                                        phoneController,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      alignLabelWithHint:
                                                                          true,
                                                                      hintText:
                                                                          "Phone number",
                                                                      hintStyle: TextStyle(
                                                                          color: Colors
                                                                              .black54,
                                                                          fontSize:
                                                                              14,
                                                                          fontFamily:
                                                                              'Oswald',
                                                                          fontWeight:
                                                                              FontWeight.w300),
                                                                      contentPadding: EdgeInsets.fromLTRB(
                                                                          5.0,
                                                                          10.0,
                                                                          20.0,
                                                                          10.0),
                                                                      border: InputBorder
                                                                          .none,
                                                                    ),
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        phone =
                                                                            value;
                                                                      });
                                                                    },
                                                                  ),
                                                                )
                                                              : Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              5),
                                                                  child: Text(
                                                                    "087XXXXXXXX",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .grey),
                                                                  )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      if (phoneEdit == true) {
                                                        phoneEdit = false;
                                                      } else {
                                                        phoneEdit = true;
                                                      }
                                                    });
                                                  },
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 5),
                                                      child: Text(
                                                        phoneEdit == true
                                                            ? "Done"
                                                            : "Edit",
                                                        style: TextStyle(
                                                            color: header),
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 20, right: 5, bottom: 3),
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 5, bottom: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Container(
                                                    //color: Colors.grey[200],
                                                    //padding: EdgeInsets.all(20),
                                                    child: Text(
                                                  "Delivery Date",
                                                  style: TextStyle(
                                                      color: Colors.black54),
                                                )),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 0, right: 5, bottom: 5),
                                      width: MediaQuery.of(context).size.width,
                                      child: Center(
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 5, bottom: 5),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Icon(Icons.calendar_today,
                                                          color: Colors.grey,
                                                          size: 16),
                                                      Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 5),
                                                          child: Text(
                                                            runningdate,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    _selectDate(context);
                                                  },
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 5),
                                                      child: Text(
                                                        "Choose",
                                                        style: TextStyle(
                                                            color: header),
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
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(
                                  top: 5, left: 20, right: 20, bottom: 5),
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 0.2, color: Colors.grey)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Payment Details",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 5, right: 5, bottom: 5),
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 5, right: 5, bottom: 5),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: 5, bottom: 5),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Container(
                                                        //color: Colors.grey[200],
                                                        //padding: EdgeInsets.all(20),
                                                        child: Text(
                                                      "Card Payment",
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                    )),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 0, right: 5, bottom: 5),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Center(
                                            child: Column(
                                              children: <Widget>[
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 5, bottom: 5),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Icon(
                                                              Icons.credit_card,
                                                              color:
                                                                  Colors.grey,
                                                              size: 16),
                                                          Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 5),
                                                              child: Text(
                                                                "XXX xxxx XXX xxxx",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey),
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        //paymentSelect();
                                                        setState(() {
                                                          paymentChoose = false;
                                                        });
                                                      },
                                                      child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                paymentChoose ==
                                                                        false
                                                                    ? header
                                                                    : Colors.grey[
                                                                        200],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5)),
                                                          ),
                                                          padding:
                                                              EdgeInsets.all(2),
                                                          margin: EdgeInsets
                                                              .only(left: 5),
                                                          child: Icon(
                                                              Icons.done,
                                                              color:
                                                                  paymentChoose ==
                                                                          false
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .grey,
                                                              size: 15)),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 15, right: 5, bottom: 5),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: 5, bottom: 5),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Container(
                                                        //color: Colors.grey[200],
                                                        //padding: EdgeInsets.all(20),
                                                        child: Text(
                                                      "Cash on delivery",
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                    )),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 0, right: 5, bottom: 5),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Center(
                                            child: Column(
                                              children: <Widget>[
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 5, bottom: 5),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Icon(
                                                              Icons.location_on,
                                                              color:
                                                                  Colors.grey,
                                                              size: 16),
                                                          Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 5),
                                                              child: Text(
                                                                "New York, USA",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey),
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        //paymentSelect();
                                                        setState(() {
                                                          paymentChoose = true;
                                                        });
                                                      },
                                                      child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                paymentChoose ==
                                                                        true
                                                                    ? header
                                                                    : Colors.grey[
                                                                        200],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5)),
                                                          ),
                                                          padding: EdgeInsets
                                                              .all(2),
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 5),
                                                          child: Icon(
                                                              Icons.done,
                                                              color:
                                                                  paymentChoose ==
                                                                          true
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .grey,
                                                              size: 15)),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
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
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, bottom: 20, top: 10),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    color: header,
                                    border: Border.all(
                                        width: 0.2, color: Colors.grey)),
                                child: Text(
                                  "Submit Order",
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
          );
  }

  void paymentSelect() {
    if (paymentChoose == false) {
      setState(() {
        paymentChoose = true;
      });
    } else {
      setState(() {
        paymentChoose = false;
      });
    }
  }
}
