import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../main.dart';

class ProfileEditForm extends StatefulWidget {
  @override
  _ProfileEditFormState createState() => _ProfileEditFormState();
}

class _ProfileEditFormState extends State<ProfileEditForm> {
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
    if (file != null) {
      fileImage = file;
    }
    if (profileInfo.length == 0) {
      setState(() {
        nameController.text = 'John Smith';
        addressController.text = 'New York, USA';
        phoneController.text = '017XXXXXXXX';
        emailController.text = 'john.smith@gmail.com';
        bdController.text = '23/01/1993';
      });
    } else {
      setState(() {
        nameController.text = profileInfo[0]['name'];
        addressController.text = profileInfo[0]['address'];
        phoneController.text = profileInfo[0]['phone'];
        emailController.text = profileInfo[0]['email'];
        bdController.text = '23/01/1993';
      });
    }

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
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FutureBuilder<File>(
                  future: fileImage,
                  builder:
                      (BuildContext context, AsyncSnapshot<File> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.data != null) {
                      return Container(
                        //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                        padding: EdgeInsets.all(1.0),
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundColor: Colors.transparent,
                          backgroundImage: FileImage(snapshot.data),
                        ),
                        decoration: new BoxDecoration(
                          color: Colors.grey, // border color
                          shape: BoxShape.circle,
                        ),
                      );
                    } else if (snapshot.error != null) {
                      return const Text(
                        'Error Picking Image',
                        textAlign: TextAlign.center,
                      );
                    } else {
                      return Container(
                        //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                        padding: EdgeInsets.all(1.0),
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundColor: Colors.transparent,
                          backgroundImage: isLoggedin
                              ? AssetImage('assets/user.jpg')
                              : AssetImage('assets/user.png'),
                        ),
                        decoration: new BoxDecoration(
                          color: Colors.grey, // border color
                          shape: BoxShape.circle,
                        ),
                      );
                    }
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    pickImagefromGallery(ImageSource.gallery);
                  },
                  child: Container(
                    width: 160,
                    margin: EdgeInsets.only(left: 0, right: 0, top: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Colors.grey[200],
                        border: Border.all(width: 0.2, color: Colors.grey)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.image,
                          size: 16,
                          color: Colors.black54,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text("Select photo",
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 13)))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 20), height: 2, child: Divider()),
          Container(
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
              child: Container(
                  margin: EdgeInsets.only(left: 8, top: 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: Colors.grey[100],
                      border: Border.all(width: 0.2, color: Colors.grey)),
                  child: TextField(
                    controller: nameController,
                    autofocus: false,
                    style: TextStyle(color: Colors.black54),
                    decoration: InputDecoration(
                      hintText: 'Type your name...',
                      labelText: 'Enter Name',
                      labelStyle: TextStyle(color: header),
                      contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 20.0, 5.0),
                      border: InputBorder.none,
                    ),
                  ))),
          // Container(
          //     margin: EdgeInsets.only(top: 0),
          //     height: 2,
          //     child: Divider()),
          Container(
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
              child: Container(
                  margin: EdgeInsets.only(left: 8, top: 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: Colors.grey[100],
                      border: Border.all(width: 0.2, color: Colors.grey)),
                  child: TextField(
                    controller: addressController,
                    autofocus: false,
                    style: TextStyle(color: Colors.black54),
                    decoration: InputDecoration(
                      hintText: 'Type your address...',
                      labelText: 'Enter Address',
                      labelStyle: TextStyle(color: header),
                      contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 20.0, 5.0),
                      border: InputBorder.none,
                    ),
                  ))),
          // Container(
          //     margin: EdgeInsets.only(top: 0),
          //     height: 2,
          //     child: Divider()),
          Container(
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
              child: Container(
                  margin: EdgeInsets.only(left: 8, top: 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: Colors.grey[100],
                      border: Border.all(width: 0.2, color: Colors.grey)),
                  child: TextField(
                    controller: phoneController,
                    autofocus: false,
                    style: TextStyle(color: Colors.black54),
                    decoration: InputDecoration(
                      hintText: 'Type your phone number...',
                      labelText: 'Enter Phone Number',
                      labelStyle: TextStyle(color: header),
                      contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 20.0, 5.0),
                      border: InputBorder.none,
                    ),
                  ))),
          Container(
              margin: EdgeInsets.only(top: 0), height: 2, child: Divider()),
          Container(
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
              child: Container(
                  margin: EdgeInsets.only(left: 8, top: 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: Colors.grey[100],
                      border: Border.all(width: 0.2, color: Colors.grey)),
                  child: TextField(
                    controller: emailController,
                    autofocus: false,
                    style: TextStyle(color: Colors.black54),
                    decoration: InputDecoration(
                      hintText: 'Type your email...',
                      labelText: 'Enter Email',
                      labelStyle: TextStyle(color: header),
                      contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 20.0, 5.0),
                      border: InputBorder.none,
                    ),
                  ))),
          GestureDetector(
            onTap: () {
              setState(() {
                profileInfo.clear();
                file = fileImage;
                profileInfo.add({
                  'name': nameController.text,
                  'address': addressController.text,
                  'phone': phoneController.text,
                  'email': emailController.text,
                });
                //print(profileInfo[0]['image']);
              });
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(left: 25, right: 15, bottom: 20, top: 5),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: header,
                  border: Border.all(width: 0.2, color: Colors.grey)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.edit,
                    size: 20,
                    color: Colors.white,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text("Edit",
                          style: TextStyle(color: Colors.white, fontSize: 17)))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
