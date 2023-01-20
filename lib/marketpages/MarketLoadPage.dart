import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vahak_clone/Api/Api.dart';
import 'package:vahak_clone/marketpages/Model/MarketLoad_List.dart';
import 'package:http/http.dart' as http;

List<MarketLoadList> marketLoadList = [];
bool loadlist_visibility = false;
bool loadnodata_visibility = false;

class MarketLoadPage extends StatelessWidget {
  const MarketLoadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            LoadMarketLocation(),
            LoadFiterList(),
          ],
        ),
      ),
    );
  }
}

class LoadMarketLocation extends StatefulWidget {
  const LoadMarketLocation({super.key});

  @override
  State<LoadMarketLocation> createState() => _LoadMarketLocationState();
}

class _LoadMarketLocationState extends State<LoadMarketLocation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        elevation: 2,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: FaIcon(
                      FontAwesomeIcons.arrowUp,
                      size: 15,
                    ),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      bookloaddailog();
                    },
                    child: Text('Enter Source location',
                        style:
                            TextStyle(fontFamily: "Montserrat", fontSize: 12)),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                      child: Align(
                          alignment: Alignment.center,
                          child: Text('',
                              style: TextStyle(
                                  fontFamily: "Montserrat", fontSize: 12)))),
                  Align(
                      alignment: Alignment.centerRight,
                      child: FaIcon(FontAwesomeIcons.chevronRight, size: 12))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0),
            child: Container(
              color: Colors.grey,
              height: 0.7,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: FaIcon(
                      FontAwesomeIcons.arrowDown,
                      size: 15,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text('Enter destination location',
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 12,
                            color: Colors.grey)),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: FaIcon(FontAwesomeIcons.chevronRight, size: 12))
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  void bookloaddailog() {
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(Icons.close)),
                                          const Text(
                                            "Bid Now",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          width: double.infinity,
                                          //  height: 50,
                                          child: Card(
                                            elevation: 15,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      CircleAvatar(
                                                          backgroundColor:
                                                              Colors.grey,
                                                          child: CircleAvatar(
                                                            backgroundColor:
                                                                Color.fromARGB(
                                                                    255,
                                                                    193,
                                                                    223,
                                                                    233),
                                                            radius: 30,
                                                            child: Icon(
                                                              Icons.person,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      99,
                                                                      142,
                                                                      170),
                                                            ),
                                                          )),
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            12.0),
                                                        child: Column(
                                                          children: [
                                                            Text("username"),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 8.0),
                                                              child: Text(
                                                                  "5 Tonnes"),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10.0),
                                                    child: Text(
                                                        "Requirement :" +
                                                            " " +
                                                            "Lorry Name"),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10.0),
                                                    child: Text("PickupLocation >" +
                                                        " " +
                                                        "DestinationupLocation"),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    //style: BorderStyle.,
                                                    width: 2.0,
                                                  ),
                                                  color: Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(60),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Text(
                                                    " ₹ ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )),
                                          ),
                                          Text("Enter Price",
                                           style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,fontSize: 15))
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 0.5,
                                          color: Colors.grey.shade600,
                                        ),
                                      )
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
                                      // lorrylistshow();

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
}

class LoadFiterList extends StatefulWidget {
  const LoadFiterList({super.key});

  @override
  State<LoadFiterList> createState() => _LoadFiterListState();
}

bool lvc_click = false;
bool truck_click = false;
bool hyva_click = false;
bool container_click = false;
bool trailer_click = false;
bool tranker_click = false;

bool lvc_dailogclick = false;
bool truck_dailogclick = false;
bool hyva_dailogclick = false;
bool container_dailogclick = false;
bool trailer_dailogclick = false;
bool tranker_dailogclick = false;

bool filter_click = false;
double _startValue = 20.0;
double _endValue = 90.0;

class _LoadFiterListState extends State<LoadFiterList> {
  bool button_filter = false;
  Future getPostLoadList(BuildContext context, String vehicle_name,
      String min_quantity, String max_quantity) async {
    Map<String, String> headers = {
      // "Authorization":"Bearer $token",
      // "Content-type": "multipart/form-data"
      'Content-Type': 'application/json',
      'authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzAzOTE2MjcwLCJpYXQiOjE2NzIzODAyNzAsImp0aSI6ImI5ZjVmZmVmYTcxNDQzZTA5ZWVjYTU2ZjcwYjQyNTJkIiwidXNlcl9pZCI6MX0.-IQkBaqBfGe0ihI6B7XMpvEX04V0-mvghu2twj5Ucug'
    };
    Map<String, String> queryParams = {
      'vehicle_name': vehicle_name,
      'min_quantity': min_quantity,
      'max_quantity': max_quantity
    };

    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.post_load_filters)
        .replace(queryParameters: queryParams);
    var response = await http.get(url, headers: headers);
    print(response);
    var jsonData = jsonDecode(response.body);

    List data = jsonData;
    for (var items in data) {
      marketLoadList.add(MarketLoadList.fromJson(items));
    }
    print(marketLoadList.length);

    print(marketLoadList);

    setState(() {
      if (marketLoadList.length == 0) {
        loadnodata_visibility = true;
        loadlist_visibility = false;
      } else {
        loadlist_visibility = true;
        loadnodata_visibility = false;
      }
      // if (vehicle_name == "LVC") {
      //   lvc_click = true;
      //   truck_click = false;
      //   hyva_click = false;
      //   container_click = false;
      //   trailer_click = false;
      //   tranker_click = false;
      // } else if (vehicle_name == 'Truck') {
      //   // truck_click=true;
      //   lvc_click = false;
      //   truck_click = true;
      //   hyva_click = false;
      //   container_click = false;
      //   trailer_click = false;
      //   tranker_click = false;
      // } else if (vehicle_name == 'Hyva') {
      //   // hyva_click=true;

      //   lvc_click = false;
      //   truck_click = false;
      //   hyva_click = true;
      //   container_click = false;
      //   trailer_click = false;
      //   tranker_click = false;
      // } else if (vehicle_name == 'Container') {
      //   //   container_click=true;

      //   lvc_click = false;
      //   truck_click = false;
      //   hyva_click = false;
      //   container_click = true;
      //   trailer_click = false;
      //   tranker_click = false;
      // } else if (vehicle_name == 'Trailer') {
      //   //   trailer_click=true;

      //   lvc_click = false;
      //   truck_click = false;
      //   hyva_click = false;
      //   container_click = false;
      //   trailer_click = true;
      //   tranker_click = false;
      // } else if (vehicle_name == 'Tanker') {
      //   //  tranker_click=true;

      //   lvc_click = false;
      //   truck_click = false;
      //   hyva_click = false;
      //   container_click = false;
      //   trailer_click = false;
      //   tranker_click = true;
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    RangeValues values = RangeValues(1, 100);
    RangeLabels labels = RangeLabels('1', "100");

    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.zero,
          child: Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            elevation: 2,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Finding Load for",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.only(top: 5)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                  height: 45,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        button_filter = true;

                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          context: context,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top:
                                                          Radius.circular(20))),
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          builder: (BuildContext context) {
                                            return StatefulBuilder(
                                              builder: (context, setState) {
                                                return Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: MediaQuery.of(
                                                                context)
                                                            .viewInsets
                                                            .bottom),
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10.0),
                                                      child: SizedBox(
                                                          height: 550,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      "Filters",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Spacer(),
                                                                    IconButton(
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        icon: Icon(
                                                                            Icons.close_rounded)),
                                                                  ],
                                                                ),
                                                                Divider(
                                                                  color: Colors
                                                                      .black54,
                                                                ),
                                                                Text(
                                                                  "Finding Load for",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Row(
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(0.0),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              50.0,
                                                                          width:
                                                                              100.0,
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                (() {
                                                                              setState(
                                                                                () {
                                                                                  lvc_dailogclick = true;
                                                                                  truck_dailogclick = false;
                                                                                  hyva_dailogclick = false;
                                                                                  container_dailogclick = false;
                                                                                  trailer_dailogclick = false;
                                                                                  tranker_dailogclick = false;
                                                                                },
                                                                              );
                                                                            }),
                                                                            child: Container(
                                                                                decoration: BoxDecoration(color: lvc_dailogclick ? Colors.blue : Colors.grey.shade200, borderRadius: BorderRadius.all(Radius.circular(5.0))),
                                                                                child: Center(
                                                                                  child: Align(
                                                                                    alignment: Alignment.center,
                                                                                    child: Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        // Padding(
                                                                                        //   padding: const EdgeInsets.all(8.0),
                                                                                        //   child: Icon(
                                                                                        //     Icons.social_distance_sharp,
                                                                                        //     size: 15,
                                                                                        //   ),
                                                                                        // ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.all(8.0),
                                                                                          child: Column(
                                                                                            children: [
                                                                                              new Text(
                                                                                                "LCV",
                                                                                                style: TextStyle(fontSize: 12, color: Colors.black54),
                                                                                                textAlign: TextAlign.center,
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: const EdgeInsets.only(top: 4.0),
                                                                                                child: Text("0-6 Tonne", style: TextStyle(color: Colors.black54, fontSize: 11)),
                                                                                              )
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                )),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(left: 8.0),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              50.0,
                                                                          width:
                                                                              100.0,
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () {
                                                                              setState(
                                                                                () {
                                                                                  lvc_dailogclick = false;
                                                                                  truck_dailogclick = true;
                                                                                  hyva_dailogclick = false;
                                                                                  container_dailogclick = false;
                                                                                  trailer_dailogclick = false;
                                                                                  tranker_dailogclick = false;
                                                                                },
                                                                              );
                                                                            },
                                                                            child: Container(
                                                                                decoration: BoxDecoration(color: truck_dailogclick ? Colors.blue : Colors.grey.shade200, borderRadius: BorderRadius.all(Radius.circular(5.0))),
                                                                                child: Center(
                                                                                  child: Align(
                                                                                    alignment: Alignment.center,
                                                                                    child: Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        // Padding(
                                                                                        //   padding: const EdgeInsets.all(8.0),
                                                                                        //   child: Icon(
                                                                                        //     Icons.social_distance_sharp,
                                                                                        //     size: 15,
                                                                                        //   ),
                                                                                        // ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.all(8.0),
                                                                                          child: Column(
                                                                                            children: [
                                                                                              new Text(
                                                                                                "Truck",
                                                                                                style: TextStyle(fontSize: 12, color: Colors.black54),
                                                                                                textAlign: TextAlign.center,
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: const EdgeInsets.only(top: 4.0),
                                                                                                child: Text("0-42 Tonne", style: TextStyle(color: Colors.black54, fontSize: 11)),
                                                                                              )
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                )),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(left: 8.0),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              50.0,
                                                                          width:
                                                                              100.0,
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () {
                                                                              setState(
                                                                                () {
                                                                                  lvc_dailogclick = false;
                                                                                  truck_dailogclick = false;
                                                                                  hyva_dailogclick = true;
                                                                                  container_dailogclick = false;
                                                                                  trailer_dailogclick = false;
                                                                                  tranker_dailogclick = false;
                                                                                },
                                                                              );
                                                                            },
                                                                            child: Container(
                                                                                decoration: BoxDecoration(color: hyva_dailogclick ? Colors.blue : Colors.grey.shade200, borderRadius: BorderRadius.all(Radius.circular(5.0))),
                                                                                child: Center(
                                                                                  child: Align(
                                                                                    alignment: Alignment.center,
                                                                                    child: Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        // Padding(
                                                                                        //   padding: const EdgeInsets.all(8.0),
                                                                                        //   child: Icon(
                                                                                        //     Icons.social_distance_sharp,
                                                                                        //     size: 15,
                                                                                        //   ),
                                                                                        // ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.all(8.0),
                                                                                          child: Column(
                                                                                            children: [
                                                                                              new Text(
                                                                                                "Hyva",
                                                                                                style: TextStyle(fontSize: 12, color: Colors.black54),
                                                                                                textAlign: TextAlign.center,
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: const EdgeInsets.only(top: 4.0),
                                                                                                child: Text("0-35 Tonne", style: TextStyle(color: Colors.black54, fontSize: 11)),
                                                                                              )
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                )),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              0.0),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            50.0,
                                                                        width:
                                                                            100.0,
                                                                        color: Colors
                                                                            .transparent,
                                                                        child:
                                                                            InkWell(
                                                                          onTap:
                                                                              () {
                                                                            setState(
                                                                              () {
                                                                                lvc_dailogclick = false;
                                                                                truck_dailogclick = false;
                                                                                hyva_dailogclick = false;
                                                                                container_dailogclick = true;
                                                                                trailer_dailogclick = false;
                                                                                tranker_dailogclick = false;
                                                                              },
                                                                            );
                                                                          },
                                                                          child: Container(
                                                                              decoration: BoxDecoration(color: container_dailogclick ? Colors.blue : Colors.grey.shade200, borderRadius: BorderRadius.all(Radius.circular(5.0))),
                                                                              child: Center(
                                                                                child: Align(
                                                                                  alignment: Alignment.center,
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      // Padding(
                                                                                      //   padding: const EdgeInsets.all(8.0),
                                                                                      //   child: Icon(
                                                                                      //     Icons.social_distance_sharp,
                                                                                      //     size: 15,
                                                                                      //   ),
                                                                                      // ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsets.all(8.0),
                                                                                        child: Column(
                                                                                          children: [
                                                                                            new Text("Container", style: TextStyle(fontSize: 12, color: Colors.black54)),
                                                                                            Padding(
                                                                                              padding: const EdgeInsets.only(top: 4.0),
                                                                                              child: Text("0-18 Tonne", style: TextStyle(color: Colors.black54, fontSize: 11)),
                                                                                            )
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              )),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              8.0),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            50.0,
                                                                        width:
                                                                            100.0,
                                                                        color: Colors
                                                                            .transparent,
                                                                        child:
                                                                            InkWell(
                                                                          onTap:
                                                                              () {
                                                                            lvc_dailogclick =
                                                                                false;
                                                                            truck_dailogclick =
                                                                                false;
                                                                            hyva_dailogclick =
                                                                                false;
                                                                            container_dailogclick =
                                                                                false;
                                                                            trailer_dailogclick =
                                                                                true;
                                                                            tranker_dailogclick =
                                                                                false;
                                                                          },
                                                                          child: Container(
                                                                              decoration: BoxDecoration(color: trailer_dailogclick ? Colors.blue : Colors.grey.shade200, borderRadius: BorderRadius.all(Radius.circular(5.0))),
                                                                              child: Center(
                                                                                child: Align(
                                                                                  alignment: Alignment.center,
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      // Padding(
                                                                                      //   padding: const EdgeInsets.all(8.0),
                                                                                      //   child: Icon(
                                                                                      //     Icons.social_distance_sharp,
                                                                                      //     size: 15,
                                                                                      //   ),
                                                                                      // ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsets.all(8.0),
                                                                                        child: Column(
                                                                                          children: [
                                                                                            new Text(
                                                                                              "Trailer",
                                                                                              style: TextStyle(fontSize: 12, color: Colors.black54),
                                                                                              textAlign: TextAlign.center,
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: const EdgeInsets.only(top: 4.0),
                                                                                              child: Text("0-100 Tonne", style: TextStyle(color: Colors.black54, fontSize: 11)),
                                                                                            )
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              )),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              8.0),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            50.0,
                                                                        width:
                                                                            100.0,
                                                                        color: Colors
                                                                            .transparent,
                                                                        child:
                                                                            InkWell(
                                                                          onTap:
                                                                              () {
                                                                            setState(
                                                                              () {
                                                                                lvc_dailogclick = false;
                                                                                truck_dailogclick = false;
                                                                                hyva_dailogclick = false;
                                                                                container_dailogclick = false;
                                                                                trailer_dailogclick = false;
                                                                                tranker_dailogclick = true;
                                                                              },
                                                                            );
                                                                          },
                                                                          child: Container(
                                                                              decoration: BoxDecoration(color: tranker_dailogclick ? Colors.blue : Colors.grey.shade200, borderRadius: BorderRadius.all(Radius.circular(5.0))),
                                                                              child: Center(
                                                                                child: Align(
                                                                                  alignment: Alignment.center,
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      // Padding(
                                                                                      //   padding: const EdgeInsets.all(8.0),
                                                                                      //   child: Icon(
                                                                                      //     Icons.social_distance_sharp,
                                                                                      //     size: 15,
                                                                                      //   ),
                                                                                      // ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsets.all(8.0),
                                                                                        child: Column(
                                                                                          children: [
                                                                                            new Text(
                                                                                              "Tanker",
                                                                                              style: TextStyle(fontSize: 12, color: Colors.black54),
                                                                                              textAlign: TextAlign.center,
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: const EdgeInsets.only(top: 4.0),
                                                                                              child: Text("0-35 KL", style: TextStyle(color: Colors.black54, fontSize: 11)),
                                                                                            )
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              )),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 8.0),
                                                                  child: Text(
                                                                      "Additional Filters",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontFamily:
                                                                              "Montserrat")),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            40.0,
                                                                        width:
                                                                            150.0,
                                                                        color: Colors
                                                                            .transparent,
                                                                        child: Container(
                                                                            decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.all(Radius.circular(5.0))),
                                                                            child: Center(
                                                                              child: Align(
                                                                                alignment: Alignment.center,
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: const EdgeInsets.all(8.0),
                                                                                      child: Icon(
                                                                                        Icons.verified,
                                                                                        size: 15,
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: const EdgeInsets.all(8.0),
                                                                                      child: new Text(
                                                                                        "Aadhaar Verified",
                                                                                        style: TextStyle(fontSize: 12, color: Colors.black87),
                                                                                        textAlign: TextAlign.center,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            )),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            40.0,
                                                                        width:
                                                                            150.0,
                                                                        color: Colors
                                                                            .transparent,
                                                                        child: Container(
                                                                            decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.all(Radius.circular(5.0))),
                                                                            child: Center(
                                                                              child: Align(
                                                                                alignment: Alignment.center,
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: const EdgeInsets.all(8.0),
                                                                                      child: Icon(
                                                                                        Icons.verified,
                                                                                        size: 15,
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: const EdgeInsets.all(8.0),
                                                                                      child: new Text(
                                                                                        "GST Verified",
                                                                                        style: TextStyle(fontSize: 12, color: Colors.black87),
                                                                                        textAlign: TextAlign.center,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            )),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            40.0,
                                                                        width:
                                                                            170.0,
                                                                        color: Colors
                                                                            .transparent,
                                                                        child: Container(
                                                                            decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.all(Radius.circular(5.0))),
                                                                            child: Center(
                                                                              child: Align(
                                                                                alignment: Alignment.center,
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: const EdgeInsets.all(8.0),
                                                                                      child: Icon(
                                                                                        Icons.verified,
                                                                                        size: 15,
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: const EdgeInsets.all(8.0),
                                                                                      child: new Text(
                                                                                        "Bank Account Verified",
                                                                                        style: TextStyle(fontSize: 12, color: Colors.black87),
                                                                                        textAlign: TextAlign.center,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            )),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            40.0,
                                                                        width:
                                                                            150.0,
                                                                        color: Colors
                                                                            .transparent,
                                                                        child: Container(
                                                                            decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.all(Radius.circular(5.0))),
                                                                            child: Center(
                                                                              child: Align(
                                                                                alignment: Alignment.center,
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: const EdgeInsets.all(8.0),
                                                                                      child: Icon(
                                                                                        Icons.social_distance_sharp,
                                                                                        size: 15,
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: const EdgeInsets.all(8.0),
                                                                                      child: new Text(
                                                                                        "My Network",
                                                                                        style: TextStyle(fontSize: 12, color: Colors.black87),
                                                                                        textAlign: TextAlign.center,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            )),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Text(
                                                                      "Load quantity range",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontFamily:
                                                                              "Montserrat")),
                                                                ),
                                                                RangeSlider(
                                                                  min: 0.0,
                                                                  max: 100.0,
                                                                  activeColor:
                                                                      Colors.blue[
                                                                          700],
                                                                  inactiveColor:
                                                                      Colors.blue[
                                                                          300],
                                                                  values: RangeValues(
                                                                      _startValue,
                                                                      _endValue),
                                                                  onChanged:
                                                                      (values) {
                                                                    setState(
                                                                        () {
                                                                      _startValue =
                                                                          values
                                                                              .start;
                                                                      _endValue =
                                                                          values
                                                                              .end;

                                                                      print(
                                                                          _startValue);
                                                                      print(
                                                                          _endValue);
                                                                    });
                                                                  },
                                                                ),
                                                                // RangeSlider(
                                                                //     divisions:
                                                                //         5,
                                                                //     activeColor:
                                                                //         Colors.blue[
                                                                //             700],
                                                                //     inactiveColor:
                                                                //         Colors.blue[
                                                                //             300],
                                                                //     min: 1,
                                                                //     max: 100,
                                                                //     values:
                                                                //         values,
                                                                //     labels:
                                                                //         labels,
                                                                //     onChanged:
                                                                //         (value) {
                                                                //       print(
                                                                //           "START: ${value.start}, End: ${value.end}");

                                                                //       setState(
                                                                //           () {
                                                                //         values =
                                                                //             value;
                                                                //         labels = RangeLabels(
                                                                //             "${value.start.toInt().toString()}",
                                                                //             "${value.start.toInt().toString()}");
                                                                //       });
                                                                //     }),
                                                                Expanded(
                                                                  child: Align(
                                                                    alignment:
                                                                        FractionalOffset
                                                                            .bottomCenter,
                                                                    child: Row(
                                                                      children: [
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                40.0,
                                                                            width:
                                                                                150.0,
                                                                            color:
                                                                                Colors.transparent,
                                                                            child: Container(
                                                                                decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.all(Radius.circular(5.0))),
                                                                                child: Center(
                                                                                  child: Align(
                                                                                    alignment: Alignment.center,
                                                                                    child: Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        // Padding(
                                                                                        //   padding: const EdgeInsets.all(8.0),
                                                                                        //   child: Icon(
                                                                                        //     Icons.social_distance_sharp,
                                                                                        //     size: 15,
                                                                                        //   ),
                                                                                        // ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.all(8.0),
                                                                                          child: new Text(
                                                                                            "Clear all",
                                                                                            style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 14, 100, 230)),
                                                                                            textAlign: TextAlign.center,
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                )),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                40.0,
                                                                            width:
                                                                                150.0,
                                                                            color:
                                                                                Colors.transparent,
                                                                            child:
                                                                                InkWell(
                                                                              onTap: () {
                                                                                marketLoadList = [];
                                                                                int start_range = _startValue.toInt();
                                                                                int end_range = _endValue.toInt();
                                                                                print(start_range);

                                                                                //                                         getPostLoadList(
                                                                                // context, "LCV", "40", "70");
                                                                                //                                         Navigator.pop(context);

                                                                                if (lvc_dailogclick) {
                                                                                  getPostLoadList(context, "LCV", "40", "70");
                                                                                  Navigator.pop(context);
                                                                                } else if (truck_dailogclick) {
                                                                                  getPostLoadList(context, "Truck", "0", "50");
                                                                                  Navigator.pop(context);
                                                                                } else if (hyva_dailogclick) {
                                                                                  getPostLoadList(context, "Hyva", "0", "35");
                                                                                  Navigator.pop(context);
                                                                                } else if (container_dailogclick) {
                                                                                  getPostLoadList(context, "Container", "0", "100");

                                                                                  // getPostLoadList(context, "Container", start_range.toString(), end_range.toString());
                                                                                  Navigator.pop(context);
                                                                                } else if (trailer_dailogclick) {
                                                                                  getPostLoadList(context, "Trailer", "0", "100");
                                                                                  // getPostLoadList(context, "Trailer", start_range.toString(), end_range.toString());
                                                                                  Navigator.pop(context);
                                                                                } else if (tranker_dailogclick) {
                                                                                  getPostLoadList(context, "Tanker", "0", "51");
                                                                                  //  getPostLoadList(context, "Tranker", start_range.toString(), end_range.toString());
                                                                                  Navigator.pop(context);
                                                                                }
                                                                              },
                                                                              child: Container(
                                                                                  decoration: BoxDecoration(color: Color.fromARGB(255, 14, 100, 230), borderRadius: BorderRadius.all(Radius.circular(5.0))),
                                                                                  child: Center(
                                                                                    child: Align(
                                                                                      alignment: Alignment.center,
                                                                                      child: Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          // Padding(
                                                                                          //   padding: const EdgeInsets.all(8.0),
                                                                                          //   child: Icon(
                                                                                          //     Icons.social_distance_sharp,
                                                                                          //     size: 15,
                                                                                          //   ),
                                                                                          // ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsets.all(8.0),
                                                                                            child: new Text(
                                                                                              "Apply filter",
                                                                                              style: TextStyle(fontSize: 12, color: Colors.white),
                                                                                              textAlign: TextAlign.center,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          )),
                                                    ));
                                              },
                                            );
                                          },
                                        ).then((value) {
                                          if (value != null) {
                                            setState(() {
                                              // user_type = value;
                                            });
                                          }
                                        });
                                        ;
                                      },
                                      child: SizedBox(
                                          width: 40,
                                          height: 50,
                                          child: Image.asset(
                                              "assets/images/setting.png")),
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  side: BorderSide(
                                                      color: button_filter
                                                          ? Colors.blue
                                                          : Colors.grey))))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                    height: 45.0,
                                    width: 80.0,
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        marketLoadList = [];
                                        setState(() {
                                          lvc_click = true;
                                          truck_click = false;
                                          hyva_click = false;
                                          container_click = false;
                                          trailer_click = false;
                                          tranker_click = false;
                                        });

                                        getPostLoadList(
                                            context, "LCV", "40", "70");
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: lvc_click
                                                  ? Colors.blue
                                                  : Colors.grey.shade200,
                                              // color: Colors.grey.shade200,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0))),
                                          child: Center(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  // Padding(
                                                  //   padding: const EdgeInsets.all(8.0),
                                                  //   child: Icon(
                                                  //     Icons.social_distance_sharp,
                                                  //     size: 15,
                                                  //   ),
                                                  // ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        new Text(
                                                          "LCV",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: Colors
                                                                  .black54),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 4.0),
                                                          child: Text(
                                                              "0-6 Tonne",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black54,
                                                                  fontSize:
                                                                      11)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                    height: 45.0,
                                    width: 80.0,
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        marketLoadList = [];

                                        setState(() {
                                          lvc_click = false;
                                          truck_click = true;
                                          hyva_click = false;
                                          container_click = false;
                                          trailer_click = false;
                                          tranker_click = false;
                                        });
                                        getPostLoadList(
                                            context, "Truck", "0", "50");
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: truck_click
                                                  ? Colors.blue
                                                  : Colors.grey.shade200,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0))),
                                          child: Center(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  // Padding(
                                                  //   padding: const EdgeInsets.all(8.0),
                                                  //   child: Icon(
                                                  //     Icons.social_distance_sharp,
                                                  //     size: 15,
                                                  //   ),
                                                  // ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        new Text(
                                                          "Truck",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: Colors
                                                                  .black54),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 4.0),
                                                          child: Text(
                                                              "0-42 Tonne",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black54,
                                                                  fontSize:
                                                                      11)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                    height: 45.0,
                                    width: 80.0,
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        marketLoadList = [];
                                        //  marketLoadList = [];

                                        setState(() {
                                          lvc_click = false;
                                          truck_click = false;
                                          hyva_click = true;
                                          container_click = false;
                                          trailer_click = false;
                                          tranker_click = false;
                                        });
                                        getPostLoadList(
                                            context, "Hyva", "0", "35");
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: hyva_click
                                                  ? Colors.blue
                                                  : Colors.grey.shade200,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0))),
                                          child: Center(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  // Padding(
                                                  //   padding: const EdgeInsets.all(8.0),
                                                  //   child: Icon(
                                                  //     Icons.social_distance_sharp,
                                                  //     size: 15,
                                                  //   ),
                                                  // ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        new Text(
                                                          "Hyva",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: Colors
                                                                  .black54),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 4.0),
                                                          child: Text(
                                                              "0-35 Tonne",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black54,
                                                                  fontSize:
                                                                      11)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                    height: 45.0,
                                    width: 80.0,
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        marketLoadList = [];

                                        setState(() {
                                          lvc_click = false;
                                          truck_click = false;
                                          hyva_click = false;
                                          container_click = true;
                                          trailer_click = false;
                                          tranker_click = false;
                                        });
                                        getPostLoadList(
                                            context, "Container", "0", "100");
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: container_click
                                                  ? Colors.blue
                                                  : Colors.grey.shade200,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0))),
                                          child: Center(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  // Padding(
                                                  //   padding: const EdgeInsets.all(8.0),
                                                  //   child: Icon(
                                                  //     Icons.social_distance_sharp,
                                                  //     size: 15,
                                                  //   ),
                                                  // ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        new Text(
                                                          "Container",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: Colors
                                                                  .black54),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 4.0),
                                                          child: Text(
                                                              "0-100 Tonne",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black54,
                                                                  fontSize:
                                                                      11)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                    height: 45.0,
                                    width: 80.0,
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        marketLoadList = [];
                                        setState(() {
                                          lvc_click = false;
                                          truck_click = false;
                                          hyva_click = false;
                                          container_click = false;
                                          trailer_click = true;
                                          tranker_click = false;
                                        });
                                        getPostLoadList(
                                            context, "Trailer", "0", "100");
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: trailer_click
                                                  ? Colors.blue
                                                  : Colors.grey.shade200,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0))),
                                          child: Center(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  // Padding(
                                                  //   padding: const EdgeInsets.all(8.0),
                                                  //   child: Icon(
                                                  //     Icons.social_distance_sharp,
                                                  //     size: 15,
                                                  //   ),
                                                  // ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        new Text(
                                                          "Trailer",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: Colors
                                                                  .black54),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 4.0),
                                                          child: Text(
                                                              "0-100 Tonne",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black54,
                                                                  fontSize:
                                                                      11)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                    height: 45.0,
                                    width: 80.0,
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        marketLoadList = [];
                                        setState(() {
                                          lvc_click = false;
                                          truck_click = false;
                                          hyva_click = false;
                                          container_click = false;
                                          trailer_click = false;
                                          tranker_click = true;
                                        });
                                        getPostLoadList(
                                            context, "Tanker", "0", "51");
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: tranker_click
                                                  ? Colors.blue
                                                  : Colors.grey.shade200,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0))),
                                          child: Center(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  // Padding(
                                                  //   padding: const EdgeInsets.all(8.0),
                                                  //   child: Icon(
                                                  //     Icons.social_distance_sharp,
                                                  //     size: 15,
                                                  //   ),
                                                  // ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        new Text(
                                                          "Tanker",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: Colors
                                                                  .black54),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 4.0),
                                                          child: Text("0-51 KL",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black54,
                                                                  fontSize:
                                                                      11)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        LoadListData()
                      ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoadListData extends StatefulWidget {
  const LoadListData({super.key});

  @override
  State<LoadListData> createState() => _LoadListDataState();
}

class _LoadListDataState extends State<LoadListData> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: loadnodata_visibility,
            child: Align(
              alignment: Alignment.center,
              child: Text("No Data Found"),
            ),
          ),
          Visibility(
            visible: loadlist_visibility,
            child: Container(
              height: 300,
              // width: double.infinity,
              child: Expanded(
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),

                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: marketLoadList.length,
                  // ignore: prefer_const_constructors
                  itemBuilder: (BuildContext context, int index) => Card(
                    child: SizedBox(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Text(marketLoadList[index].dropLocation)
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 16),
                                          height: 10,
                                          width: 10,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 1.5,
                                                  color: Colors.greenAccent)),
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(
                                                top: 16, left: 10),
                                            child: Text(marketLoadList[index]
                                                .pickupLocation))
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Dash(
                                          direction: Axis.vertical,
                                          length: 30,
                                          dashLength: 10,
                                          dashColor: Colors.grey),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 10,
                                          width: 10,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                  width: 2, color: Colors.red)),
                                          child: Container(
                                            height: 20,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text(marketLoadList[index]
                                              .dropLocation),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            width: 25,
                                            height: 50,
                                            child: Image.asset(
                                              "assets/images/cargo_truck.png",
                                              color: Colors.black54,
                                            )),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            marketLoadList[index].vehicleName +
                                                " REQUIRED",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 2),
                                      child: Text(
                                        marketLoadList[index].quantity +
                                            " " +
                                            marketLoadList[index].vehicleName,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      height: 20.0,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: CustomPaint(
                                            painter:
                                                DrawDottedhorizontalline()),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            width: 25,
                                            height: 50,
                                            child: Image.asset(
                                                "assets/images/package_box.png",
                                                color: Colors.black54)),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(marketLoadList[index]
                                              .quantity
                                              .toUpperCase()),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5.0),
                                          child: Column(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  color: Colors.blue.shade100,
                                                ),
                                                height: 35,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 30,
                                                        child: CircleAvatar(
                                                          radius: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              6,
                                                          backgroundColor:
                                                              Colors.grey,
                                                          backgroundImage:
                                                              NetworkImage(
                                                            marketLoadList[
                                                                    index]
                                                                .profile_image
                                                                .toString(),
                                                          ) as ImageProvider,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 5),
                                                        child: Text(
                                                          marketLoadList[index]
                                                              .username,
                                                          style: TextStyle(
                                                              fontSize: 11),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    bookloaddailog(marketLoadList,index);
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color:
                                                          Colors.blue.shade800,
                                                    ),
                                                    height: 30,
                                                    width: 100,
                                                    child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          "Book",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        )),
                                                  ),
                                                ),
                                              )
                                              //   Text("data"),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Text(
                                      marketLoadList[index].description,
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "₹ " +
                                                    marketLoadList[index]
                                                        .exceptedPrice,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

 void bookloaddailog(List<MarketLoadList> marketLoadList, int index) {
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(Icons.close)),
                                          const Text(
                                            "Bid Now",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          width: double.infinity,
                                          //  height: 50,
                                          child: Card(
                                            elevation: 15,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundImage:
                                                              NetworkImage(
                                                            marketLoadList[
                                                                    index]
                                                                .profile_image
                                                                .toString(),
                                                          ) as ImageProvider,
                                                          child: CircleAvatar(
                                                            backgroundColor:
                                                                Color.fromARGB(
                                                                    255,
                                                                    193,
                                                                    223,
                                                                    233),
                                                            radius: 30,
                                                            child: Icon(
                                                              Icons.person,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      99,
                                                                      142,
                                                                      170),
                                                            ),
                                                          )),
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            12.0),
                                                        child: Column(
                                                          children: [
                                                            Text(marketLoadList[index].username),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 8.0),
                                                              child: Text(
                                                                 marketLoadList[index].quantity),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10.0),
                                                    child: Text(
                                                        "Requirement :" +
                                                            " " +
                                                          marketLoadList[index].vehicleName),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10.0),
                                                    child: Text(marketLoadList[index].pickupLocation +
                                                        "  >  " +
                                                        marketLoadList[index].dropLocation),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    //style: BorderStyle.,
                                                    width: 2.0,
                                                  ),
                                                  color: Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(60),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Text(
                                                    " ₹ ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )),
                                          ),
                                          Text("Enter Price",
                                           style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,fontSize: 15))
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 0.5,
                                          color: Colors.grey.shade600,
                                        ),
                                      
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Current Price - Per Tonne",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                                      ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 50,
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
                                              label: Text(marketLoadList[index].exceptedPrice.toString()),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
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

                                     // postload_bid();
                                      Navigator.pop(context);
                                                                         },
                                    child: Text("Submit".toUpperCase()),
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
}


class DrawDottedhorizontalline extends CustomPainter {
  late Paint _paint;
  DrawDottedhorizontalline() {
    _paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (double i = -0; i < 300; i = i + 15) {
      if (i % 3 == 0)
        canvas.drawLine(Offset(i, 0.0), Offset(i + 5, 0.0), _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
