import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodpanda_app/Forms/ProfileEditForm/profileEditForm.dart';
import 'package:foodpanda_app/MainScreen/ChangePaswordPage/changePaswordPage.dart';
import 'package:foodpanda_app/main.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEditDialog extends StatefulWidget {
  @override
  _ProfileEditDialogState createState() => new _ProfileEditDialogState();
}

class _ProfileEditDialogState extends State<ProfileEditDialog> {
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
  int gen = 1, gen1 = 0;
  Future<File> fileImage;

  @override
  void initState() {
    nameController.text = 'John Smith';
    addressController.text = 'Modina Market';
    phoneController.text = '017XXXXXXXX';
    emailController.text = 'john.smith@gmail.com';
    bdController.text = '23/01/1993';
    var now = new DateTime.now();
    date = new DateFormat("dd/MM/yyyy").format(now);
    super.initState();
  }

  pickImagefromGallery(ImageSource src) {
    setState(() {
      fileImage = ImagePicker.pickImage(source: src);
    });
  }

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
                  Text("Edit Profile",
                      style: TextStyle(fontSize: 17, color: Colors.black54)),
                  GestureDetector(
                      onTap: () {
                        editPassword();
                      },
                      child: Container(
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            Icons.lock,
                            color: header,
                          )))
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
              child: ProfileEditForm()),
        ),
      ),
    );
  }

  void editPassword() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new PassEditDialog();
        },
        fullscreenDialog: true));
  }
}