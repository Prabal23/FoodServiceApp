import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodpanda_app/main.dart';

class AddressEditDialog extends StatefulWidget {
  final addressList;
  final index;
  AddressEditDialog(this.addressList, this.index);

  @override
  _AddressEditDialogState createState() => new _AddressEditDialogState();
}

class _AddressEditDialogState extends State<AddressEditDialog> {
  int _current = 0;
  int _isBack = 0;
  String result = '', date = 'Select Birth Date';
  String _radioGender;
  TextEditingController titleController = new TextEditingController();
  TextEditingController houseController = new TextEditingController();
  TextEditingController roadController = new TextEditingController();
  TextEditingController areaController = new TextEditingController();
  TextEditingController blockController = new TextEditingController();
  TextEditingController flatController = new TextEditingController();
  var dd, finalDate;
  DateTime _date = DateTime.now();
  int cat = 1, cat1 = 0, cat2 = 0;

  @override
  void initState() {
    setState(() {
      titleController.text = widget.addressList['title'];
      houseController.text = widget.addressList['house'];
      roadController.text = widget.addressList['road'];
      areaController.text = widget.addressList['area'];
      blockController.text = widget.addressList['block'];
      flatController.text = widget.addressList['flat'];

      if (widget.addressList['type'] == 'Home') {
        cat = 1;
        cat1 = 0;
        cat2 = 0;
      } else if (widget.addressList['type'] == 'Work') {
        cat = 0;
        cat1 = 1;
        cat2 = 0;
      } else if (widget.addressList['type'] != 'Home' &&
          widget.addressList['type'] != 'Work') {
        cat = 0;
        cat1 = 0;
        cat2 = 1;
      }
    });

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
                        widget.addressList['type'] == 'Home'
                            ? Expanded(
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
                                          color: (cat == 1 &&
                                                  cat1 == 0 &&
                                                  cat2 == 0)
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
                              )
                            : Container(),
                        widget.addressList['type'] == 'Work'
                            ? Expanded(
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
                                          color: (cat == 0 &&
                                                  cat1 == 1 &&
                                                  cat2 == 0)
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
                              )
                            : Container(),
                        widget.addressList['type'] != 'Home' &&
                                widget.addressList['type'] != 'Work'
                            ? Expanded(
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
                                          color: (cat == 0 &&
                                                  cat1 == 0 &&
                                                  cat2 == 1)
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
                            : Container()
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
                                controller: titleController,
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
                            controller: houseController,
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
                            controller: roadController,
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
                            controller: areaController,
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
                            controller: blockController,
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
                            controller: flatController,
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
                  GestureDetector(
                    onTap: () {
                      addressAddEdit();
                    },
                    child: Container(
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
                  ),
                ],
              )),
        ),
      ),
    );
  }

  void addressAddEdit() {
    if (cat2 == 1 && titleController.text == '') {
      _showErrorAlert('Title is empty');
    } else if (houseController.text == '') {
      _showErrorAlert('House is empty');
    } else if (roadController.text == '') {
      _showErrorAlert('Road is empty');
    } else if (areaController.text == '') {
      _showErrorAlert('Area is empty');
    } else {
      addressList.removeAt(widget.index);
      addressList.add({
        'title': titleController.text,
        'house': houseController.text,
        'road': roadController.text,
        'area': areaController.text,
        'block': blockController.text,
        'flat': flatController.text,
        'type': cat == 1 ? "Home" : cat1 == 1 ? 'Work' : titleController.text,
      });
      Navigator.pop(context);
    }
  }

  _showErrorAlert(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.redAccent.withOpacity(0.9),
        textColor: Colors.white,
        fontSize: 13.0);
  }
}
