import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vahak_clone/Api/AlertDialog.dart';
import 'package:vahak_clone/Api/Api.dart';
import 'package:vahak_clone/lorrypages/lorryBook/lorrybookscreen.dart';
import 'package:vahak_clone/marketpages/Model/MarketLorryList.dart';
import 'package:http/http.dart' as http;

// class MarketLorryPage extends StatelessWidget{
//   const MarketLorryPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(child: Text('Lorry Page'),),
//     );
//   }

// }

List<MarketLorryList> marketLorryList = [];
List<Permit> permitList = [];

bool loadlist_visibility = false;
bool loadnodata_visibility = false;

class MarketLorryPage extends StatefulWidget {
  const MarketLorryPage({super.key});

  @override
  State<MarketLorryPage> createState() => _MarketLorryPageState();
}

class _MarketLorryPageState extends State<MarketLorryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            LorryMarketLocation(),
            LorryFilterList(),
          ],
        ),
      ),
    );
  }
}

class LorryMarketLocation extends StatefulWidget {
  const LorryMarketLocation({super.key});

  @override
  State<LorryMarketLocation> createState() => _LorryMarketLocationState();
}

class _LorryMarketLocationState extends State<LorryMarketLocation> {
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
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: FaIcon(
                      FontAwesomeIcons.arrowUp,
                      size: 15,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text('Enter Source location',
                      style: TextStyle(fontFamily: "Montserrat", fontSize: 12)),
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
}

class LorryFilterList extends StatefulWidget {
  const LorryFilterList({super.key});

  @override
  State<LorryFilterList> createState() => _LorryFilterListState();
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

class _LorryFilterListState extends State<LorryFilterList> {
  @override
  void initState() {
    super.initState();
//     _setImage("LCV").(value){
// setState(){

// }
//     };
  }

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
      'min_capacity': min_quantity,
      'max_capacity': max_quantity
    };

    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.post_lorry_ficlters)
        .replace(queryParameters: queryParams);
    var response = await http.get(url, headers: headers);

    print(response.body.toString());
    var jsonData = jsonDecode(response.body);

    List data = jsonData;
    for (var items in data) {
      marketLorryList.add(MarketLorryList.fromJson(items));
    }
    print(marketLorryList.length);

    print(marketLorryList);

    List data_route = jsonData[0]['permit'];
    for (var item_data in data_route) {
      permitList.add(Permit.fromJson(item_data));
    }
    print(permitList);

    setState(() {
      if (marketLorryList.length == 0) {
        loadnodata_visibility = true;
        loadlist_visibility = false;
      } else {
        loadlist_visibility = true;
        loadnodata_visibility = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool button_filter = false;

    RangeValues values = RangeValues(1, 100);
    RangeLabels labels = RangeLabels('1', "100");
    setState(() {});
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
                                                                            setState(() {
                                                                              lvc_dailogclick = false;
                                                                              truck_dailogclick = false;
                                                                              hyva_dailogclick = false;
                                                                              container_dailogclick = false;
                                                                              trailer_dailogclick = true;
                                                                              tranker_dailogclick = false;
                                                                            });
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
                                                                                marketLorryList = [];
                                                                                permitList = [];
                                                                                int start_range = _startValue.toInt();
                                                                                int end_range = _endValue.toInt();
                                                                                print(start_range);

                                                                                if (lvc_dailogclick) {
                                                                                  lvc_click = true;
                                                                                  truck_click = false;
                                                                                  hyva_click = false;
                                                                                  container_click = false;
                                                                                  trailer_click = false;
                                                                                  tranker_click = false;
                                                                                  getPostLoadList(context, "LCV", "", "");
                                                                                  Navigator.pop(context);
                                                                                } else if (truck_dailogclick) {
                                                                                  lvc_click = false;
                                                                                  truck_click = true;
                                                                                  hyva_click = false;
                                                                                  container_click = false;
                                                                                  trailer_click = false;
                                                                                  tranker_click = false;
                                                                                  getPostLoadList(context, "Truck", "", "");
                                                                                  Navigator.pop(context);
                                                                                } else if (hyva_dailogclick) {
                                                                                  lvc_click = false;
                                                                                  truck_click = false;
                                                                                  hyva_click = true;
                                                                                  container_click = false;
                                                                                  trailer_click = false;
                                                                                  tranker_click = false;
                                                                                  getPostLoadList(context, "Hyva", "", "");
                                                                                  Navigator.pop(context);
                                                                                } else if (container_dailogclick) {
                                                                                  lvc_click = false;
                                                                                  truck_click = false;
                                                                                  hyva_click = false;
                                                                                  container_click = true;
                                                                                  trailer_click = false;
                                                                                  tranker_click = false;
                                                                                  getPostLoadList(context, "Container", "", "");

                                                                                  // getPostLoadList(context, "Container", start_range.toString(), end_range.toString());
                                                                                  Navigator.pop(context);
                                                                                } else if (trailer_dailogclick) {
                                                                                  lvc_click = false;
                                                                                  truck_click = false;
                                                                                  hyva_click = false;
                                                                                  container_click = false;
                                                                                  trailer_click = true;
                                                                                  tranker_click = false;
                                                                                  getPostLoadList(context, "Trailer", "", "");
                                                                                  // getPostLoadList(context, "Trailer", start_range.toString(), end_range.toString());
                                                                                  Navigator.pop(context);
                                                                                } else if (tranker_dailogclick) {
                                                                                  lvc_click = false;
                                                                                  truck_click = false;
                                                                                  hyva_click = false;
                                                                                  container_click = false;
                                                                                  trailer_click = false;
                                                                                  tranker_click = true;
                                                                                  getPostLoadList(context, "Tanker", "", "");
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
                                        marketLorryList = [];
                                        permitList = [];
                                        getPostLoadList(context, "LCV", "", "");
                                        setState(() {
                                          lvc_click = true;
                                          truck_click = false;
                                          hyva_click = false;
                                          container_click = false;
                                          trailer_click = false;
                                          tranker_click = false;
                                        });
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
                                        marketLorryList = [];
                                        permitList = [];
                                        getPostLoadList(
                                            context, "truck", "", "");

                                        setState(() {
                                          lvc_click = false;
                                          truck_click = true;
                                          hyva_click = false;
                                          container_click = false;
                                          trailer_click = false;
                                          tranker_click = false;
                                        });
                                        // getPostLoadList(
                                        //     context, "Truck", "0", "50");
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
                                        marketLorryList = [];
                                        permitList = [];

                                        setState(() {
                                          lvc_click = false;
                                          truck_click = false;
                                          hyva_click = true;
                                          container_click = false;
                                          trailer_click = false;
                                          tranker_click = false;
                                        });
                                        getPostLoadList(
                                            context, "Hyva", "", "");
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
                                        marketLorryList = [];
                                        permitList = [];

                                        setState(() {
                                          lvc_click = false;
                                          truck_click = false;
                                          hyva_click = false;
                                          container_click = true;
                                          trailer_click = false;
                                          tranker_click = false;
                                        });
                                        getPostLoadList(
                                            context, "Container", "", "");
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
                                        marketLorryList = [];
                                        permitList = [];
                                        setState(() {
                                          lvc_click = false;
                                          truck_click = false;
                                          hyva_click = false;
                                          container_click = false;
                                          trailer_click = true;
                                          tranker_click = false;
                                        });
                                        getPostLoadList(
                                            context, "Trailer", "", "");
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
                                        marketLorryList = [];
                                        permitList = [];
                                        setState(() {
                                          lvc_click = false;
                                          truck_click = false;
                                          hyva_click = false;
                                          container_click = false;
                                          trailer_click = false;
                                          tranker_click = true;
                                        });
                                        getPostLoadList(
                                            context, "Tanker", "", "");
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
                        LorryListData()
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

class LorryListData extends StatefulWidget {
  const LorryListData({super.key});

  @override
  State<LorryListData> createState() => _LorryListDataState();
}

class _LorryListDataState extends State<LorryListData> {
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
              height: 350,
              // width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Expanded(
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),

                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: marketLorryList.length,

                    // ignore: prefer_const_constructors
                    itemBuilder: (BuildContext context, int index) => Card(
                      child: SizedBox(
                          width: 200,
                          //      height: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: _setImage(
                                    marketLorryList[index].vehicleName),
                              ),
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    marketLorryList[index]
                                            .vehicleLoadCapacity
                                            .toString() +
                                        "  " +
                                        marketLorryList[index].vehicleName,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: 25,
                                      height: 25,
                                      child: Image(
                                          image: AssetImage(
                                              'assets/images/speed.png'))),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      marketLorryList[index]
                                          .vehicleLoadCapacity
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                      width: 25,
                                      height: 25,
                                      child: Image(
                                          image: AssetImage(
                                              'assets/images/tyre.png'))),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                        marketLorryList[index].vehicalTyres,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      marketLorryList[index].uservehicleNumber,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 11),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                color: Colors.white,
                                height: 20.0,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: CustomPaint(
                                      painter: DrawDottedhorizontalline()),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          "CURRENT LOCATION",
                                          style: TextStyle(fontSize: 8),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                                width: 20,
                                                height: 20,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Image(
                                                      image: AssetImage(
                                                          'assets/images/location.png')),
                                                )),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                marketLorryList[index]
                                                    .currentLocation,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, bottom: 5.0),
                                              child: Text(
                                                "Routes".toUpperCase(),
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          print("location");
                                          print(permitList.length);
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text("Route" ?? ""),
                                                  content:
                                                      SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 200.0,
                                                          width: 200,
                                                          child: ListView
                                                              .separated(
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis
                                                                          .vertical,
                                                                  separatorBuilder: (BuildContext
                                                                              context,
                                                                          int
                                                                              index) =>
                                                                      Divider(
                                                                          height:
                                                                              5),
                                                                  itemCount:
                                                                      permitList
                                                                          .length,
                                                                  itemBuilder:
                                                                      (BuildContext
                                                                              c,
                                                                          int index) {
                                                                    return ListTile(
                                                                      title: Text(permitList[
                                                                              index]
                                                                          .name
                                                                          .toString()),
                                                                    );
                                                                  }),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text('OK'),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              });
                                        },
                                        child:                                      Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, bottom: 5.0),
                                              child: Text(
                                                permitList.length.toString() +
                                                    " location",
                                                style: TextStyle(
                                                  color: Colors.blue.shade600,
                                                  fontSize: 12.0,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                              ),
                                            ),
                                            //Icon(Icons.downarr)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5.0),
                                              child: FaIcon(
                                                  FontAwesomeIcons.chevronDown,
                                                  size: 12),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
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
                                            padding: const EdgeInsets.all(5.0),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 30,
                                                  child: CircleAvatar(
                                                    radius:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            6,
                                                    backgroundColor:
                                                        Colors.grey,
                                                    backgroundImage:NetworkImage(
                                          marketLorryList[index]
                                              .profileImage
                                              .toString(),
                                          )
                                                        // Image.network(
                                                        //   errorbu
                                                        //         //'http://192.168.1.22:8008' +
                                                        //         marketLorryList[
                                                        //                 index]
                                                        //             .profileImage)
                                                            as ImageProvider,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 5),
                                                  child: Text(
                                                    marketLorryList[index]
                                                        .username,
                                                    style:
                                                        TextStyle(fontSize: 11),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LorryBookScreen()),
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.blue.shade800,
                                              ),
                                              height: 30,
                                              width: 100,
                                              child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "Book",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                            ),
                                          ),
                                        )
                                        //   Text("data"),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
}

void _showPopupMenu(BuildContext context, List<Permit> permitList) async {
  await showMenu(
    context: context,
    position: RelativeRect.fromLTRB(50, 700, 500, 500),
    items: [
      PopupMenuItem<String>(
          child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: permitList.length,

              // ignore: prefer_const_constructors
              itemBuilder: (BuildContext context, int index) => Card(
                    child: Text(permitList[index].name),
                  )))
    ],
    elevation: 8.0,
  );
}

_setImage(String vehicleName) {
  if (vehicleName == "LCV") {
    return SizedBox(
        width: 180,
        height: 100,
        child: Image(image: AssetImage('assets/images/lvc_img.png')));

    // return AssetImage('assets/images/lvc_img.png');
  } else if (vehicleName == "truck" || vehicleName == "Truck") {
    return SizedBox(
        width: 180,
        height: 100,
        child: Image(image: AssetImage('assets/images/truck_img.png')));
  } else if (vehicleName == "Hyva") {
    return SizedBox(
        width: 180,
        height: 100,
        child: Image(image: AssetImage('assets/images/hyva_img.png')));
  } else if (vehicleName == "Container") {
    return SizedBox(
        width: 180,
        height: 100,
        child: Image(image: AssetImage('assets/images/container_img.png')));
  } else if (vehicleName == "Trailer") {
    return SizedBox(
        width: 180,
        height: 100,
        child: Image(image: AssetImage('assets/images/treller_img.png')));
  } else if (vehicleName == "Tanker") {
    return SizedBox(
        width: 180,
        height: 100,
        child: Image(image: AssetImage('assets/images/tanker_img.png')));
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
    for (double i = -0; i < 500; i = i + 15) {
      if (i % 3 == 0)
        canvas.drawLine(Offset(i, 0.0), Offset(i + 5, 0.0), _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
