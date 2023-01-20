import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vahak_clone/Api/Api.dart';
import 'package:http/http.dart' as http;
import 'package:vahak_clone/lorrypages/LorryListingData_formv2.dart';

TextEditingController vehiclenumber = TextEditingController();
TextEditingController current_location = TextEditingController();

bool visible = false;

class LorryListingData_formv1 extends StatefulWidget {
  const LorryListingData_formv1({super.key});

  @override
  State<LorryListingData_formv1> createState() =>
      _LorryListingData_formv1State();
}

class User {
  int id;
  String name;
  User(this.id, this.name);
}

List<String> v_name = [];

class _LorryListingData_formv1State extends State<LorryListingData_formv1> {
  var vehicle_numb;
  var current_loc;
  bool permit_data = false;
  late User user;
  List<User> users = [];
  bool permit_check = false;

  Future getUserData() async {
    //  final response =
    //   await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.routes);
    var response = await http.get(url);
    print(response.body);

    var jsonData = jsonDecode(response.body);

    for (var u in jsonData) {
      user = User(u['id'], u['name']);
      users.add(user);
    }
    for (int i = 0; i < users.length; i++) {
      v_name.add(users[i].name);
    }
    print(users.length);
    return users;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  var selectedIndexes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.close)),
                      Text(
                        "Attach New Lorry",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Color.fromARGB(255, 211, 201, 201),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0.0, top: 0),
                  child: Card(
                      color: Colors.grey.shade100,
                      elevation: 0,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 15.0, bottom: 10.0, left: 10, right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Padding(
                                padding: EdgeInsets.only(
                                    top: 5.0, bottom: 5.0, left: 8, right: 8),
                                child: Text(
                                  '1',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(
                                          top: 20.0,
                                          bottom: 10.0,
                                          left: 10,
                                          right: 10),
                                      child: Text(
                                        'Vehicle Details',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.grey.shade700),
                                      )),
                                ])
                          ])),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: vehiclenumber,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 10.0),
                            border: OutlineInputBorder(),
                            labelText: 'Enter vehicle number',
                            hintText: 'vehicle number',
                          ),
                          validator: (pickvalue) {
                            if (pickvalue == null || pickvalue.isEmpty) {
                              visible = false;
                              return 'Can\'t be empty';
                            }

                            return null;
                          },
                          // update the state variable when the text changes
                          onChanged: (pickvalue) => setState(() {
                            vehicle_numb = pickvalue;
                            if (vehicle_numb.isNotEmpty) {
                              visible = true;
                            } else {
                              visible = false;
                            }
                          }),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: Visibility(
                      visible: visible,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 16, left: 10, right: 10),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      controller: current_location,
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 15.0, horizontal: 10.0),
                                        border: OutlineInputBorder(),
                                        labelText: 'Current vehicle location',
                                        hintText: 'vehicle location',
                                      ),
                                      validator: (pickvalue) {
                                        if (pickvalue == null ||
                                            pickvalue.isEmpty) {
                                          // visible = false;
                                          return 'Can\'t be empty';
                                        }

                                        return null;
                                      },
                                      // update the state variable when the text changes
                                      onChanged: (pickvalue) => setState(() {
                                        current_loc = pickvalue;
                                        // if (vehicle_numb.isNotEmpty ) {
                                        //   visible = true;
                                        // } else {
                                        //   visible = false;
                                        // }
                                      }),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 16, left: 10, right: 10),
                              child: Text(
                                "Add your Vehicle Routes",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: this.permit_data,
                                  onChanged: (value) {
                                    setState(() {
                                                   this.permit_data = value!;

                                      if (value) {
                                        permit_data = true;

                                        selectedIndexes.addAll(v_name);
                                        print(v_name);
                                      } else {
                                        permit_check = false;
                                        selectedIndexes = [];
                                      }
                                    });
                                  },
                                ),
                                Text("All India Permit"),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 16, left: 10, right: 10),
                              child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    mainAxisExtent:
                                        50, // here set custom Height You Want
                                  ),
                                  shrinkWrap: true,
                                  primary: false,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: users.length,
                                  // gridDelegate:
                                  //     const SliverGridDelegateWithFixedCrossAxisCount(
                                  //         crossAxisCount: 3,),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      child: Container(
                                        height: 20,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: permit_data
                                                    ? Colors.blue
                                                    : selectedIndexes.contains(
                                                            users[index].name)
                                                        ? Colors.blue
                                                        : Colors.green,
                                                spreadRadius: 3),
                                          ],
                                        ),
                                        //  alignment: Alignment.center,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Checkbox(
                                                value: selectedIndexes.contains(
                                                    users[index].name),
                                                onChanged: (value) {
                                                  setState(() {
                                                    if (selectedIndexes
                                                        .contains(users[index]
                                                            .name)) {
                                                      selectedIndexes.remove(
                                                          users[index].name);
                                                      permit_check =
                                                          false; // unselect
                                                    } else {
                                                      selectedIndexes.add(
                                                          users[index].name);
                                                      permit_check =
                                                          true; // select
                                                    }

                                                    print("*****************");
                                                    print(selectedIndexes);
                                                    // var stringList =
                                                    //     selectedIndexes.join(",");
                                                    //    Navigator.pop(
                                                    //     context, stringList);
                                                    // print(stringList);
                                                  });
                                                },
                                              ),
                                              SizedBox(
                                                  width: 120.0,
                                                  child: Text(users[index].name,
                                                      softWrap: false,
                                                      overflow: TextOverflow
                                                          .ellipsis)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            )
                          ])),
                ),
              ]),
        ),
        Expanded(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              height: 60,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints.tightFor(
                      width: double.infinity, height: 60),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: visible
                          ? MaterialStateProperty.all(
                              Color.fromARGB(255, 26, 82, 236))
                          : MaterialStateProperty.all(
                              Color.fromARGB(255, 131, 146, 188)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      )),
                    ),
                    onPressed: () async {
                      vehicle_numb = vehiclenumber.text;
                      current_loc = current_location.text;

                      if (vehicle_numb.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "enter vehicle number",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else if (current_loc.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "pls enter current location",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else if (selectedIndexes.isEmpty) {
                         Fluttertoast.showToast(
                            msg: "pls select location",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        Navigator.pop(context);
                        //  var vehicle_numb
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LorryListingData_formv2(
                                vehicle_numb, current_loc,selectedIndexes)));
                      }

                      // print(vehicle_numb + current_loc);
                    },
                    child: Text("Update".toUpperCase()),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    )));
  }
}
