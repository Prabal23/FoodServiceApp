import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:foodpanda_app/Cards/LandscapeFoodCard/landscapeFoodCard.dart';
import 'package:foodpanda_app/Cards/PortraitFoodCard/PortraitFoodCard.dart';
import 'package:foodpanda_app/MainScreen/FilterPage/filterPage.dart';
import 'package:foodpanda_app/MainScreen/FoodDetailsPage/details.dart';
import 'package:foodpanda_app/main.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  bool internet = true, isFocused = false;
  String result = '';
  int loc = 1, loc1 = 0;

  List foodList = [
    {
      'name':'Panshi Restaurant',
      'type':'Bangladeshi',
      'deliveryType':'Free Delivery',
      'time':'35 MIN',
      'rating':'5',
      'people':'30',
      'image':'assets/burger.jpg',
      'discout':'20% OFF',
    },
    {
      'name':'Bhujon Bari Restaurant',
      'type':'Bangladeshi',
      'deliveryType':'Free Delivery',
      'time':'40 MIN',
      'rating':'4.8',
      'people':'35',
      'image':'assets/roll.jpg',
      'discout':'10% OFF',
    },
    {
      'name':'Panch Bhai Restaurant',
      'type':'Bangladeshi, Indian',
      'deliveryType':'Free Delivery',
      'time':'25 MIN',
      'rating':'5',
      'people':'20',
      'image':'assets/sandwich.jpg',
      'discout':'',
    },
    {
      'name':'Asmi Food',
      'type':'Bangladeshi, Indian',
      'deliveryType':'Free Delivery',
      'time':'50 MIN',
      'rating':'4.2',
      'people':'10',
      'image':'assets/pasta.jpg',
      'discout':'',
    },
    {
      'name':'Panshi Food',
      'type':'Bangladeshi, Indian, Thai',
      'deliveryType':'Free Delivery',
      'time':'45 MIN',
      'rating':'4.8',
      'people':'50',
      'image':'assets/swarma.jpg',
      'discout':'5% OFF',
    },
    {
      'name':'Rice and Spice Restaurant',
      'type':'Bangladeshi, Indian',
      'deliveryType':'Free Delivery',
      'time':'30 MIN',
      'rating':'3.6',
      'people':'23',
      'image':'assets/pizza.jpg',
      'discout':'',
    }
  ];

  @override
  void initState() {
    internetCheck();
    super.initState();
  }

  void internetCheck() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      //print("Connected to Mobile Network");
      setState(() {
        internet = true;
      });
    } else if (connectivityResult == ConnectivityResult.wifi) {
      //print("Connected to WiFi");
      setState(() {
        internet = true;
      });
    } else {
      setState(() {
        internet = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 0),
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(10),
                //color: Colors.white,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10.0,
                      color: Colors.black.withOpacity(.5),
                      //offset: Offset(6.0, 7.0),
                    ),
                  ],
                  //shape: BoxShape.rectangle,
                  //border: Border.all(),
                  color: Colors.white,
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: Icon(
                              Icons.search,
                              color: header,
                            )),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isFocused = true;
                                print("data");
                                print(isFocused);
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              //margin: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0.0)),
                                //color: Colors.grey[100],
                                // border:
                                //     Border.all(width: 0.2, color: Colors.grey)
                              ),
                              child: TextFormField(
                                autofocus: false,
                                decoration: InputDecoration(
                                  // icon: Container(
                                  //   margin: EdgeInsets.only(left: 10),
                                  //   child: const Icon(
                                  //     Icons.search,
                                  //     color: Colors.black38,
                                  //   ),
                                  // ),
                                  hintText: 'Search Restaurant or Cuisine...',
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
                          ),
                        ),

                        // Container(
                        //     height: 20,
                        //     margin: EdgeInsets.only(right: 10),
                        //     child: VerticalDivider(
                        //       color: Colors.grey,
                        //     )),
                        GestureDetector(
                          onTap: () {
                            filterPage();
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 5, left: 10),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.filter_list,
                                  color: header,
                                  size: 25,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            Container(
              height: 1,
              child: Divider(
                color: Colors.white,
              ),
            ),
            Expanded(
              child: internet
                  ? Container(
                      margin: EdgeInsets.only(
                        left: 0,
                        right: 0,
                      ),
                      color: sub_white,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 5, right: 5),
                      //height: MediaQuery.of(context).size.height,
                      child: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? ListView.builder(
                            physics: BouncingScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) =>
                                  new Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Container(
                                  margin: EdgeInsets.only(
                                      bottom: 5, top: 5, left: 2.5, right: 2.5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    //border: Border.all(width: 0.5, color: Colors.grey),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 1.0,
                                        color: Colors.black.withOpacity(.5),
                                        //offset: Offset(6.0, 7.0),
                                      ),
                                    ],
                                  ),
                                  child: PortraitFoodCard(foodList[index]),
                                ),
                              ),
                              itemCount: foodList.length,
                            )
                          : GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio:
                                    (MediaQuery.of(context).size.width / 2) /
                                        (MediaQuery.of(context).size.height /
                                            2.5),
                              ),
                              itemBuilder: (BuildContext context, int index) =>
                                  new Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Container(
                                  margin: EdgeInsets.only(
                                      bottom: 5, top: 5, left: 2.5, right: 2.5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    //border: Border.all(width: 0.5, color: Colors.grey),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 1.0,
                                        color: Colors.black.withOpacity(.5),
                                        //offset: Offset(6.0, 7.0),
                                      ),
                                    ],
                                  ),
                                  child: LandscapeFoodCard(index),
                                ),
                              ),
                              itemCount: 20,
                            ))
                  : SingleChildScrollView(
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  //height: 180,
                                  child: Center(
                                    child: Container(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Image.asset(
                                        'assets/no_net.jpg',
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(top: 10, bottom: 10),
                                    child: Text("No network!",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold))),
                                Container(
                                    margin: EdgeInsets.only(top: 0, bottom: 10),
                                    child: Text(
                                        "No internet connection\nCheck the connection of the network",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black38))),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: header,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.refresh,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Retry",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }

  void filterPage() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new FilterDialog();
        },
        fullscreenDialog: true));
  }
}
