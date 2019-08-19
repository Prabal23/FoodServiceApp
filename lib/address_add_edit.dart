import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:foodpanda_app/homepage.dart';
import 'package:foodpanda_app/main.dart';
import 'package:foodpanda_app/order_details.dart';
import 'package:foodpanda_app/profile.dart';
import 'package:foodpanda_app/vouchers.dart';

import 'address.dart';
import 'orderlist.dart';

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
                  margin: EdgeInsets.only(top: 20),
                  child: new ListTile(
                      leading: new Icon(Icons.home),
                      title: new Text(
                        'Home',
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
                Container(
                  child: new ListTile(
                      leading: new Icon(Icons.list),
                      title: new Text('Orders'),
                      trailing: Container(
                          margin: EdgeInsets.only(right: 17),
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
                ),
                Container(
                  margin: EdgeInsets.only(right: 17, top: 0),
                  decoration: BoxDecoration(
                      color: header.withOpacity(0.1),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(100),
                          bottomRight: Radius.circular(100))),
                  child: new ListTile(
                      leading: new Icon(Icons.location_on, color: header),
                      title: new Text('Addresses',
                          style: TextStyle(color: header)),
                      trailing: Container(
                          margin: EdgeInsets.only(right: 0),
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
                ),
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
    return new Scaffold(
      backgroundColor: Colors.white,
      //drawer: drawer,
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
