import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vahak_clone/Api/Api.dart';
import 'package:http/http.dart' as http;
import 'package:vahak_clone/loadpages/PostLoadScreen.dart';
import 'package:vahak_clone/lorrypages/Model/LorryList.dart';
import 'package:vahak_clone/lorrypages/lorryBook/Model/BookLorryList.dart';
import 'package:vahak_clone/marketpages/MarketLoadPage.dart';

late List<PostLoad> bookLorryList;
List<Attachnewlorry> booklorry_data = [];
TextEditingController _controller = new TextEditingController();
TextEditingController roiControlled = new TextEditingController();
var _controllerdta;
List<LorryList> lorry_list = [];
List<RouteLorry> routeLorry_list = [];
List<String> v_name = [];

class LorryBookScreen extends StatefulWidget {
  const LorryBookScreen({super.key});

  @override
  State<LorryBookScreen> createState() => _LorryBookScreenState();
}

class _LorryBookScreenState extends State<LorryBookScreen> {
  Future getbookLoadList(BuildContext context) async {
    //load_list = [];
    //getPostLoadList(context);
    Map<String, String> headers = {
      // "Authorization":"Bearer $token",
      // "Content-type": "multipart/form-data"
      'Content-Type': 'application/json',
      'authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzAzOTE2MjcwLCJpYXQiOjE2NzIzODAyNzAsImp0aSI6ImI5ZjVmZmVmYTcxNDQzZTA5ZWVjYTU2ZjcwYjQyNTJkIiwidXNlcl9pZCI6MX0.-IQkBaqBfGe0ihI6B7XMpvEX04V0-mvghu2twj5Ucug'
    };

    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.getbook_lorrylist);
    var response = await http.get(url, headers: headers);
    //  print(response.body);
    var jsonData = jsonDecode(response.body);

    List data = jsonData[0]['PostLoad'];
    print(data);
    for (var items in data) {
      bookLorryList.add(PostLoad.fromJson(items));
    }

    List lorry = jsonData[0]['Attachnewlorry'];
    print(lorry);
    for (var lorry_data in lorry) {
      booklorry_data.add(Attachnewlorry.fromJson(lorry_data));
    }
    _controllerdta = booklorry_data[0].fixedPrice;
    setState(() {});
  }

  Future getPostLoadList(BuildContext context) async {
    //load_list = [];
    //getPostLoadList(context);
    Map<String, String> headers = {
      // "Authorization":"Bearer $token",
      // "Content-type": "multipart/form-data"
      'Content-Type': 'application/json',
      'authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzAzOTE2MjcwLCJpYXQiOjE2NzIzODAyNzAsImp0aSI6ImI5ZjVmZmVmYTcxNDQzZTA5ZWVjYTU2ZjcwYjQyNTJkIiwidXNlcl9pZCI6MX0.-IQkBaqBfGe0ihI6B7XMpvEX04V0-mvghu2twj5Ucug'
    };

    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.post_lorrylist);
    var response = await http.get(url, headers: headers);
    print(response.body);
    var jsonData = jsonDecode(response.body);

    List data = jsonData;
    for (var items in data) {
      lorry_list.add(LorryList.fromJson(items));
    }
    List data_route = jsonData[0]['routes'];
    for (var item_data in data_route) {
      routeLorry_list.add(RouteLorry.fromJson(item_data));
    }
    print(routeLorry_list);
    //print(lorry_list.length);

    print(lorry_list);
    setState(() {});

    for (int i = 0; i < lorry_list.length; i++) {
      v_name.add(lorry_list[i].updatedDate);
    }
  }

  @override
  void initState() {
    super.initState();
    bookLorryList = [];
    getbookLoadList(context);
    lorry_list = [];
    getPostLoadList(context);
    _controller = TextEditingController(text: _controllerdta.toString());
  }

  bool select_all = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {},
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                ),
                child: Text(
                  "Choose Your Load",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(
                top: 40,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 380, height: 50),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      // backgroundColor:
                      //     MaterialStateProperty.all(Color.fromARGB(255, 26, 82, 236)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                    ),
                    onPressed: () async {
                      // if (_formKey.currentState.validate()) {

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PostLoadScreen()));
                    },
                    child: Text(
                      "+  Add New Load",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 29.0, right: 19),
              child: Container(
                width: double.infinity,
                height: 3,
                color: Colors.grey.shade200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "Select from the list of loads",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: bookLorryList.length,

                    // ignore: prefer_const_constructors
                    itemBuilder: (BuildContext context, int index) => Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: InkWell(
                                onTap: () {
                                  //  print("object");
                                  booklorrydailog(booklorry_data, index);
                                },
                                child: Row(
                                  children: [
                                    SizedBox(
                                        width: 45,
                                        height: 45,
                                        child: Image(
                                          image: AssetImage(
                                              'assets/images/book_boxes.png'),
                                        )),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 30.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              width: 150,
                                              height: 25,
                                              // color: Colors.red,
                                              decoration: BoxDecoration(
                                                  color: setcolor(
                                                      bookLorryList[index]
                                                          .status),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(30))),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    bookLorryList[index]
                                                        .status
                                                        .toUpperCase(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontStyle:
                                                            FontStyle.italic),
                                                  ),
                                                ),
                                              )),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5.0, left: 8.0),
                                            child: Text(
                                              bookLorryList[index]
                                                      .pickupLocation +
                                                  "- " +
                                                  bookLorryList[index]
                                                      .dropLocation,
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 2.0, left: 8.0),
                                            child: Text(
                                                bookLorryList[index].quantity +
                                                    "  " +
                                                    bookLorryList[index]
                                                        .materialName,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color:
                                                        Colors.grey.shade500)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
              ),
            )
          ],
        ),
      ),
    ));
  }

  setcolor(String status) {
    if (status == "Expired") {
      return Colors.red;
    } else if (status == "is Progress") {
      return Colors.purple;
    } else if (status == "active") {
      return Colors.blue;
    }
  }

  void booklorrydailog(List<Attachnewlorry> bookattaLorryList, int index) {
    print(booklorry_data[index].username);

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height -
                      120 -
                      MediaQuery.of(context).padding.top,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 70.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 40,
                                              height: 40,
                                              child: CircleAvatar(
                                                backgroundColor: Color.fromARGB(
                                                    255, 193, 223, 233),
                                                radius: 30,
                                                child: Icon(
                                                  Icons.person,
                                                  color: Color.fromARGB(
                                                      255, 99, 142, 170),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    bookattaLorryList[index]
                                                        .username,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 3),
                                                    child: Text(
                                                      bookattaLorryList[index]
                                                          .currentLocation,
                                                      style: TextStyle(
                                                          color: Colors
                                                              .grey.shade900,
                                                          fontSize: 12),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Spacer(),
                                            IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(Icons.close_sharp))
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        color:
                                            Color.fromARGB(255, 208, 229, 245),
                                        //   height: 70,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                  width: 65,
                                                  child: Image.asset(
                                                    "assets/images/box-truck.png",
                                                  )),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    bookattaLorryList[index]
                                                        .uservehicleNumber,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16),
                                                  ),
                                                  Text(
                                                    bookattaLorryList[index]
                                                            .vehicleLoadCapacity +
                                                        "  " +
                                                        bookattaLorryList[index]
                                                            .vehicleName,
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  )
                                                ],
                                              ),
                                              Spacer(),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 18.0),
                                                child: Column(
                                                  children: [
                                                    Text("Available in"),
                                                    Text(
                                                        bookattaLorryList[index]
                                                            .currentLocation)
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(30.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 400,
                                          decoration: BoxDecoration(
                                              //color: Colors.white,
                                              border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 215, 210, 210)),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(25.0))),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20.0,
                                                    left: 20,
                                                    bottom: 16),
                                                child: Text(
                                                  "Send Response to" +
                                                      bookattaLorryList[index]
                                                          .uservehicleNumber,
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                height: 1,
                                                color: Color.fromARGB(
                                                    255, 215, 210, 210),
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 20,
                                                      left: 20,
                                                      right: 20),
                                                  child: TextFormField(
                                                      keyboardType:
                                                          TextInputType.number,
                                                      controller: _controller,
                                                      //maxLength: 9,
                                                      decoration:
                                                          InputDecoration(
                                                              suffix: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .black,
                                                                      width:
                                                                          1.0),
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              5.0)),
                                                                ),
                                                                child:
                                                                    ToggleButtons(
                                                                  selectedColor:
                                                                      Colors
                                                                          .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                  fillColor:
                                                                      Colors
                                                                          .blue,
                                                                  children: [
                                                                    Text(
                                                                        'Fixed'),
                                                                    Text(
                                                                        'Per Tonne'),
                                                                  ],
                                                                  isSelected: [
                                                                    true,
                                                                    false,
                                                                  ],
                                                                  onPressed:
                                                                      (d) {},
                                                                ),
                                                              ),
                                                              label: Text(
                                                                  " Enter rate "),
                                                              //      hintText: "Refferral code(Optional)",
                                                              errorStyle:
                                                                  TextStyle(
                                                                      color: Colors
                                                                          .red,
                                                                      fontSize:
                                                                          15.0),
                                                              border: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              5)))))),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 30, right: 30),
                                                child: TextFormField(
                                                  controller: roiControlled,
                                                  maxLength: 10,
                                                  decoration:
                                                      const InputDecoration(
                                                          labelText:
                                                              'Quantity'),
                                                  keyboardType:
                                                      TextInputType.phone,
                                                  validator: (value) {},
                                                  onSaved: (value) {},
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 30, right: 30),
                                                child: Row(
                                                  children: [
                                                    Text("Remarks"),
                                                    Text(
                                                      "Optional)",
                                                      style: TextStyle(
                                                          fontStyle:
                                                              FontStyle.italic),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0,
                                                    right: 30,
                                                    left: 30),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 100,
                                                  color: Color.fromARGB(
                                                      255, 193, 223, 233),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: TextField(
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintText:
                                                            'Enter your comment here',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
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
                                      // backgroundColor:
                                      //     MaterialStateProperty.all(Color.fromARGB(255, 26, 82, 236)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      )),
                                    ),
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      lorrylistshow();

                                      // if (_formKey.currentState.validate()) {

                                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => CompanyDetails()));
                                    },
                                    child: Text("Bid Now".toUpperCase()),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ));
          },
        );
      },
    ).then((value) {
      if (value != null) {
        setState(() {
          //  user_type = value;
        });
      }
    });
  }

  var selectedIndexes = [];

  void lorrylistshow() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [
                          Text(
                            "Recommended Lorries for you",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.close_sharp))
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                          "Here are some lorries based on your preferences."),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                          "You can select multiple lorries to bid on all at once"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 20),
                      child: Row(
                        children: [
                          Text(
                            lorry_list.length.toString() + " results",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: select_all,
                                  //  value: this.value,
                                  onChanged: (value) {
                                    setState(() {
                                      if (value!) {
                                        select_all = true;

                                        selectedIndexes.addAll(v_name);
                                        print(v_name);
                                      }
                                      else{
                                                                                  select_all = false;
                                        selectedIndexes=[];

                                      }
                                    });
                                  },
                                ),
                                const Text(
                                  "select All",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 9),
                      child: SizedBox(
                        height:MediaQuery.of(context).size.height-200,
                        child: Stack(children: [
                           Padding(
                            padding: const EdgeInsets.only(bottom:50.0),
                            child: ListView.separated(
                                primary: false,
                                shrinkWrap: true,
                                separatorBuilder: (context, index) =>
                                    const Divider(
                                      color: Colors.black,
                                    ),
                                itemCount: lorry_list.length,
                                itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Stack(children: <Widget>[
                                        SizedBox(
                                            width: double.infinity,
                                            //  height: 150,
                                            child: Padding(
                                              padding: const EdgeInsets.all(20.0),
                                              child: Card(
                                                  elevation: 10,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              SizedBox(
                                                                  width: 65,
                                                                  child:
                                                                      Image.asset(
                                                                    "assets/images/lorry_trucks.png",
                                                                  )),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            8.0),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start, //change here don't //worked
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                        
                                                                      children: [
                                                                        Text(
                                                                          lorry_list[index]
                                                                              .uservehicleNumber,
                                                                          style: TextStyle(
                                                                              fontSize:
                                                                                  15,
                                                                              fontWeight:
                                                                                  FontWeight.bold),
                                                                        ),
                                                                        Checkbox(
                                                                          value: selectedIndexes
                                                                              .contains(lorry_list[index].updatedDate),
                                                                          onChanged:
                                                                              (value) {
                                                                            setState(
                                                                                () {
                                                                              if (selectedIndexes.contains(lorry_list[index].updatedDate)) {
                                                                                selectedIndexes.remove(lorry_list[index].updatedDate); // unselect
                                                                              } else {
                                                                                selectedIndexes.add(lorry_list[index].updatedDate); // select
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
                                                                        )
                                                                        //Spacer(),
                                                                        // CheckboxListTile(
                                                                        //   //  subtitle: Text(this.noteList[position].actn_on),
                                                                        //   value: selectedIndexes
                                                                        //       .contains(index),
                                                                        //   onChanged:
                                                                        //       (_) {
                                                                        //     setState(
                                                                        //         () {
                                                                        //       if (selectedIndexes.contains(index)) {
                                                                        //         selectedIndexes.remove(index); // unselect
                                                                        //       } else {
                                                                        //         selectedIndexes.add(index); // select
                                                                        //       }
                        
                                                                        //       print("*****************");
                                                                        //       print(selectedIndexes);
                                                                        //       var stringList =
                                                                        //           selectedIndexes.join(",");
                                                                        //       // Navigator.pop(context,
                                                                        //       //     stringList);
                                                                        //       print(stringList);
                                                                        //     });
                                                                        //   },
                                                                        //   controlAffinity:
                                                                        //       ListTileControlAffinity.trailing,
                                                                        // )
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              5.0),
                                                                      child: Text(
                                                                        "Updated  on ${lorry_list[index].updatedDate}",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            color: Colors
                                                                                .grey
                                                                                .shade500),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 5.0,
                                                                    left: 25),
                                                            child: Row(
                                                              children: [
                                                                SizedBox(
                                                                    width: 20,
                                                                    child: Image.asset(
                                                                        "assets/images/home.png",
                                                                        color: Colors
                                                                            .grey)),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              10.0),
                                                                  child: Text(
                                                                    lorry_list[
                                                                            index]
                                                                        .currentLocation,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 7.0,
                                                                    left: 25),
                                                            child: Row(
                                                              children: [
                                                                SizedBox(
                                                                    width: 20,
                                                                    child: Image.asset(
                                                                        "assets/images/lorry.png",
                                                                        color: Colors
                                                                            .grey)),
                        
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              8.0),
                                                                  child: Text(
                                                                    lorry_list[index]
                                                                            .vehicleLoadCapacity +
                                                                        " " +
                                                                        lorry_list[
                                                                                index]
                                                                            .vehicleName,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold),
                                                                  ),
                                                                ),
                                                                // Spacer(),
                                                                Text("data"),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 5.0,
                                                                    left: 25),
                                                            child: Row(
                                                              children: [
                                                                SizedBox(
                                                                    width: 15,
                                                                    child: Image.asset(
                                                                        "assets/images/location.png",
                                                                        color: Colors
                                                                            .grey)),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              13.0),
                                                                  child: Text(
                                                                    routeLorry_list
                                                                            .length
                                                                            .toString() +
                                                                        " Routes",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 18.0,
                                                                    right: 18.0,
                                                                    top: 5),
                                                            child: Container(
                                                              color: Colors
                                                                  .grey.shade300,
                                                              height: 0.7,
                                                              width:
                                                                  double.infinity,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                            )),
                                        // Visibility(
                                        //   visible: false,
                                        //   child: Padding(
                                        //     padding: const EdgeInsets.only(top: 5.0, left: 28),
                                        //     child: Container(
                                        //         decoration: BoxDecoration(
                                        //           border: Border.all(
                                        //               color: Colors.grey.shade400,
                                        //               width: 1.0,
                                        //               style: BorderStyle.solid),
                                        //           borderRadius: BorderRadius.circular(10),
                                        //           color: Colors.white,
                                        //         ),
                                        //         // height: 30,
                                        //         //width: 100
                                        //         child: Padding(
                                        //           padding: const EdgeInsets.all(3.0),
                                        //           child: Text("Status"),
                                        //         )),
                                        //   ),
                                        // )
                                      ]),
                                    )),
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
                                    // backgroundColor:
                                    //     MaterialStateProperty.all(Color.fromARGB(255, 26, 82, 236)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(8.0),
                                    )),
                                  ),
                                  onPressed: () async {
                                    Navigator.pop(context);
                               //     lorrylistshow();
                                      
                                    // if (_formKey.currentState.validate()) {

                                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => CompanyDetails()));
                                  },
                                  child: Text("Add Now".toUpperCase()),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                        ],
                          
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }
}
