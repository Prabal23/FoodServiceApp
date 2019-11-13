import 'package:flutter/material.dart';
import 'package:foodpanda_app/main.dart';

class AddressAddEditDialog extends StatefulWidget {
  @override
  _AddressAddEditDialogState createState() => new _AddressAddEditDialogState();
}

class _AddressAddEditDialogState extends State<AddressAddEditDialog> {
  int _current = 0;
  int _isBack = 0;
  String result = '', date = 'Select Birth Date';
  String _radioGender;
  TextEditingController nameController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController bdController = new TextEditingController();
  var dd, finalDate;
  DateTime _date = DateTime.now();
  int cat = 1, cat1 = 0, cat2 = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        iconTheme: IconThemeData(color: header),
        backgroundColor: Colors.white,
        title: Center(
          child: Container(
            child: Container(
              margin: EdgeInsets.only(top: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("Address",
                      style: TextStyle(fontSize: 17, color: Colors.black54)),
                ],
              ),
            ),
          ),
        ),
      ),
      //body: new Text("It's a Dialog!"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: new Container(
              padding: EdgeInsets.all(0.0),
              //color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Colors.white,
                        border: Border.all(width: 0.2, color: Colors.grey)),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                cat = 1;
                                cat1 = 0;
                                cat2 = 0;
                              });
                            },
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.home,
                                    color: (cat == 1 && cat1 == 0 && cat2 == 0)
                                        ? header
                                        : Colors.black54,
                                    size: 18,
                                  ),
                                  Text("Home",
                                      style: TextStyle(
                                          color: (cat == 1 &&
                                                  cat1 == 0 &&
                                                  cat2 == 0)
                                              ? header
                                              : Colors.black54,
                                          fontSize: 12)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                cat = 0;
                                cat1 = 1;
                                cat2 = 0;
                              });
                            },
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.work,
                                    color: (cat == 0 && cat1 == 1 && cat2 == 0)
                                        ? header
                                        : Colors.black54,
                                    size: 18,
                                  ),
                                  Text("Work",
                                      style: TextStyle(
                                          color: (cat == 0 &&
                                                  cat1 == 1 &&
                                                  cat2 == 0)
                                              ? header
                                              : Colors.black54,
                                          fontSize: 12)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                cat = 0;
                                cat1 = 0;
                                cat2 = 1;
                              });
                            },
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.add_circle,
                                    color: (cat == 0 && cat1 == 0 && cat2 == 1)
                                        ? header
                                        : Colors.black54,
                                    size: 18,
                                  ),
                                  Text("Other",
                                      style: TextStyle(
                                          color: (cat == 0 &&
                                                  cat1 == 0 &&
                                                  cat2 == 1)
                                              ? header
                                              : Colors.black54,
                                          fontSize: 12)),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      height: 1,
                      width: 50,
                      child: Divider(
                        color: header,
                      )),
                  (cat == 0 && cat1 == 0 && cat2 == 1)
                      ? Container(
                          padding: EdgeInsets.only(
                              left: 15, right: 20, top: 20, bottom: 10),
                          child: Container(
                              margin: EdgeInsets.only(left: 8, top: 0),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 0.2, color: Colors.grey)),
                              child: TextField(
                                controller: nameController,
                                obscureText: true,
                                style: TextStyle(color: Colors.black54),
                                decoration: InputDecoration(
                                  hintText: 'Type Title...',
                                  labelText: 'Enter Title',
                                  labelStyle: TextStyle(color: Colors.grey),
                                  //hintStyle: TextStyle(color: Colors.grey),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10.0, 5.0, 20.0, 5.0),
                                  border: InputBorder.none,
                                ),
                              )))
                      : Container(),
                  Container(
                      padding: EdgeInsets.only(
                          left: 15, right: 20, top: 10, bottom: 10),
                      child: Container(
                          margin: EdgeInsets.only(left: 8, top: 0),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              color: Colors.white,
                              border:
                                  Border.all(width: 0.2, color: Colors.grey)),
                          child: TextField(
                            controller: nameController,
                            obscureText: true,
                            style: TextStyle(color: Colors.black54),
                            decoration: InputDecoration(
                              hintText: 'Type House/Plot Number...',
                              labelText: 'Enter House/Plot Number',
                              labelStyle: TextStyle(color: Colors.grey),
                              //hintStyle: TextStyle(color: Colors.grey),
                              contentPadding:
                                  EdgeInsets.fromLTRB(10.0, 5.0, 20.0, 5.0),
                              border: InputBorder.none,
                            ),
                          ))),
                  // Container(
                  //     margin: EdgeInsets.only(top: 0),
                  //     height: 2,
                  //     child: Divider()),
                  Container(
                      padding: EdgeInsets.only(
                          left: 15, right: 20, top: 10, bottom: 10),
                      child: Container(
                          margin: EdgeInsets.only(left: 8, top: 0),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              color: Colors.white,
                              border:
                                  Border.all(width: 0.2, color: Colors.grey)),
                          child: TextField(
                            controller: addressController,
                            obscureText: true,
                            style: TextStyle(color: Colors.black54),
                            decoration: InputDecoration(
                              hintText: 'Type Street/Road...',
                              labelText: 'Enter Street/Road',
                              labelStyle: TextStyle(color: Colors.grey),
                              contentPadding:
                                  EdgeInsets.fromLTRB(10.0, 5.0, 20.0, 5.0),
                              border: InputBorder.none,
                            ),
                          ))),
                  // Container(
                  //     margin: EdgeInsets.only(top: 0),
                  //     height: 2,
                  //     child: Divider()),
                  Container(
                      padding: EdgeInsets.only(
                          left: 15, right: 20, top: 10, bottom: 10),
                      child: Container(
                          margin: EdgeInsets.only(left: 8, top: 0),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              color: Colors.white,
                              border:
                                  Border.all(width: 0.2, color: Colors.grey)),
                          child: TextField(
                            controller: phoneController,
                            style: TextStyle(color: Colors.black54),
                            decoration: InputDecoration(
                              hintText: 'Type Area...',
                              labelText: 'Enter Area (Ex : Bondor Bazar)',
                              labelStyle: TextStyle(color: Colors.grey),
                              contentPadding:
                                  EdgeInsets.fromLTRB(10.0, 5.0, 20.0, 5.0),
                              border: InputBorder.none,
                            ),
                          ))),
                  Container(
                      padding: EdgeInsets.only(
                          left: 15, right: 20, top: 10, bottom: 10),
                      child: Container(
                          margin: EdgeInsets.only(left: 8, top: 0),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              color: Colors.white,
                              border:
                                  Border.all(width: 0.2, color: Colors.grey)),
                          child: TextField(
                            controller: phoneController,
                            style: TextStyle(color: Colors.black54),
                            decoration: InputDecoration(
                              hintText: 'Type Block/Sector...',
                              labelText: 'Enter Block/Sector (Optional)',
                              labelStyle: TextStyle(color: Colors.grey),
                              contentPadding:
                                  EdgeInsets.fromLTRB(10.0, 5.0, 20.0, 5.0),
                              border: InputBorder.none,
                            ),
                          ))),
                  Container(
                      padding: EdgeInsets.only(
                          left: 15, right: 20, top: 10, bottom: 10),
                      child: Container(
                          margin: EdgeInsets.only(left: 8, top: 0),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              color: Colors.white,
                              border:
                                  Border.all(width: 0.2, color: Colors.grey)),
                          child: TextField(
                            controller: phoneController,
                            style: TextStyle(color: Colors.black54),
                            decoration: InputDecoration(
                              hintText: 'Type Floor/Flat...',
                              labelText: 'Enter Floor/Flat (Optional)',
                              labelStyle: TextStyle(color: Colors.grey),
                              contentPadding:
                                  EdgeInsets.fromLTRB(10.0, 5.0, 20.0, 5.0),
                              border: InputBorder.none,
                            ),
                          ))),
                  Container(
                    margin: EdgeInsets.only(
                        left: 25, right: 20, bottom: 20, top: 5),
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
                            child: Text("Submit",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17))),
                        Icon(
                          Icons.arrow_right,
                          size: 30,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
