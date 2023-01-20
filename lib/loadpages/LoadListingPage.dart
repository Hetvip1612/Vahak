import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vahak_clone/loadpages/Model/LoadList.dart';
import 'package:vahak_clone/loadpages/PostLoadScreen.dart';
import 'package:http/http.dart' as http;

import '../Api/Api.dart';

class LoadListingPage extends StatefulWidget {
  const LoadListingPage({super.key});

  @override
  State<LoadListingPage> createState() => _LoadListingPageState();
}

int currentPos = 0;

List<String> listPaths = [
  "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg",
  "https://wallpaperaccess.com/full/2637581.jpg",
  "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg"
];

class _LoadListingPageState extends State<LoadListingPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (var url in listPaths) {
        precacheImage(NetworkImage(url), context);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Stack(
            children: [
               Padding(
                 padding: const EdgeInsets.only(bottom:50.0),
                 child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                  Container(child: LoadCarouselSlider()),
                  Container(child:  LoadDestinationPart(),),
                  Container(child: LoadFilterPart()),
                  Container(child:LoadMainPart())
                 // const LoadMainPart()            
              ]),
            ),
               ),
              Padding(
        padding: const EdgeInsets.all(20),
        child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: ConstrainedBox(
              constraints:
                  const BoxConstraints.tightFor(width: 150, height: 35),
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(shape: const StadiumBorder()),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return const PostLoadScreen();
                  })
                  )
                  );
                },
                child: const Text('Post Load'),
              ),
            )))
            ],
            
          )),
    );
  }
}

List<LoadList> load_list = [];
bool isSwitched = false;
var textValue = 'Switch is OFF';
bool repost_data = false;
var value;
var POS;

class LoadMainPart extends StatefulWidget {
  const LoadMainPart({super.key});

  @override
  State<StatefulWidget> createState() => _LoadMainPartState();
}

class _LoadMainPartState extends State<LoadMainPart> {
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

    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.post_loadlist);
    var response = await http.get(url, headers: headers);
    print(response.body);
    var jsonData = jsonDecode(response.body);

    List data = jsonData;
    for (var items in data) {
      load_list.add(LoadList.fromJson(items));
    }

    print(load_list.length);

    print(load_list);

    setState(() {
      for (int i = 0; i < load_list.length; i++) {
        value = load_list[i].status;
        if (value == "Expired") {
          POS = i;
          print(POS);

          print(i);
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    load_list = [];
    getPostLoadList(context);
  }

  @override
  Widget build(BuildContext context) {
    // load_list = [];
    // getPostLoadList(context);
    return Container(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const Divider(
                color: Colors.black,
              ),
          itemCount: load_list.length,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(children: <Widget>[
                  SizedBox(
                    child: SizedBox(
                      child: Container(
                          width: double.infinity,
                          //  height: 150,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Card(
                                child: Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                  width: 15,
                                                  child: Image.asset(
                                                    "assets/images/boxes.png",
                                                    color: Colors.grey,
                                                  )),
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
                                                      load_list[index]
                                                              .pickupLocation +
                                                          " - " +
                                                          load_list[index]
                                                              .dropLocation,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5.0),
                                                      child: Text(
                                                        "Posted on ${load_list[index].postloadDate}",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors
                                                                .grey.shade500),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                    width: 15,
                                                    child: Image.asset(
                                                        "assets/images/load.png",
                                                        color: Colors.grey)),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 8.0),
                                                  child: Text(
                                                    load_list[index].materialName,
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                    width: 15,
                                                    child: Image.asset(
                                                        "assets/images/lorry.png",
                                                        color: Colors.grey)),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 8.0),
                                                  child: Text(
                                                    load_list[index].quantity +
                                                        " " +
                                                        load_list[index]
                                                            .vehicleName,
                                                    style:
                                                        TextStyle(fontSize: 13),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (() {
                                        print("Heel");
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return StatefulBuilder(
                                              builder: (context, setState) {
                                                TextEditingController
                                                    dec_Controlled =
                                                    TextEditingController();
                                                return Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom:
                                                            MediaQuery.of(context)
                                                                .viewInsets
                                                                .bottom),
                                                    child: SizedBox(
                                                      height: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .height -
                                                          120 -
                                                          MediaQuery.of(context)
                                                              .padding
                                                              .top,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                                15.0),
                                                        child:
                                                            SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                width: double
                                                                    .infinity,
                                                                child: Card(
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                8.0),
                                                                  ),
                                                                  child: Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            0.0),
                                                                    child: Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Container(
                                                                          color: Colors
                                                                              .grey
                                                                              .shade100,
                                                                          height:
                                                                              30,
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsets.only(left: 15.0),
                                                                                child: Text(
                                                                                  "1. load details".toUpperCase(),
                                                                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                                                                ),
                                                                              ),
                                                                              Spacer(),
                                                                              Padding(
                                                                                padding: const EdgeInsets.only(right: 8.0, top: 5),
                                                                                child: Text(
                                                                                  "Edit",
                                                                                  style: TextStyle(color: Colors.blue.shade600, fontSize: 16),
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              top:
                                                                                  8.0,
                                                                              left:
                                                                                  8),
                                                                          child:
                                                                              Text(
                                                                            load_list[index].pickupLocation +
                                                                                " - " +
                                                                                load_list[index].dropLocation,
                                                                            style: TextStyle(
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.w500),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              top:
                                                                                  5.0,
                                                                              left:
                                                                                  8),
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              Text(
                                                                                'Material : ' + load_list[index].materialName,
                                                                                style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
                                                                              ),
                                                                              Padding(
                                                                                  padding: EdgeInsets.only(left: 5),
                                                                                  child: Text(
                                                                                    ' ,  Quantity : ' + load_list[index].quantity,
                                                                                    style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
                                                                                  )),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              top:
                                                                                  7.0,
                                                                              left:
                                                                                  8),
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              setImage(load_list[index].vehicleName),
                                                                              Text(load_list[index].vehicleName,
                                                                                  style: TextStyle(color: Colors.grey.shade500, fontSize: 16)),
                                                                            ],
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 8.0),
                                                                child: SizedBox(
                                                                  width: double
                                                                      .infinity,
                                                                  child: Card(
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    elevation: 5,
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .start,
                                                                        children: [
                                                                          Container(
                                                                            color: Colors
                                                                                .grey
                                                                                .shade100,
                                                                            height:
                                                                                30,
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(left: 8.0),
                                                                                  child: Text(
                                                                                    "2. What is your expected price",
                                                                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                                                                  ),
                                                                                ),
                                                                                Spacer(),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(right: 8.0, top: 5),
                                                                                  child: Text(
                                                                                    "Edit",
                                                                                    style: TextStyle(color: Colors.blue.shade600, fontSize: 16),
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsets.only(
                                                                                top: 8.0,
                                                                                left: 8),
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                Text("₹  "),
                                                                                Text(
                                                                                  load_list[index].exceptedPrice,
                                                                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(top: 8.0),
                                                                                  child: Text("/ Fixed Price", style: TextStyle(color: Colors.grey, fontSize: 12)),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsets.only(
                                                                                top: 8.0,
                                                                                left: 8,
                                                                                bottom: 15),
                                                                            child:
                                                                                Text("To Pay"),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 8.0),
                                                                child: Row(
                                                                  children: [
                                                                    Text(
                                                                      "3. odc consignment & remarks "
                                                                          .toUpperCase(),
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Text(
                                                                      " (Optional)",
                                                                      style: TextStyle(
                                                                          fontStyle:
                                                                              FontStyle.italic),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 8.0),
                                                                child: Row(
                                                                  children: [
                                                                    Text("odc consignment"
                                                                        .toUpperCase()),
                                                                    Spacer(),
                                                                    Switch(
                                                                      trackColor:
                                                                          MaterialStateProperty.all(
                                                                              Colors.black38),
                                                                      activeColor:
                                                                          Colors
                                                                              .blue,
                                                                      activeTrackColor:
                                                                          Colors
                                                                              .yellow,
                                                                      inactiveThumbColor:
                                                                          Colors
                                                                              .redAccent,
                                                                      inactiveTrackColor:
                                                                          Colors
                                                                              .orange,
                                                                      value:
                                                                          isSwitched,
                                                                      onChanged: (value) =>
                                                                          setState(() =>
                                                                              isSwitched =
                                                                                  value),
                                                                    )
                                                                    // Switch(
                                                                    //   onChanged:
                                                                    //       toggleSwitch,
                                                                    //   value:
                                                                    //       isSwitched,
                                                                    //   activeColor:
                                                                    //       Colors
                                                                    //           .blue,
                                                                    //   activeTrackColor:
                                                                    //       Colors
                                                                    //           .yellow,
                                                                    //   inactiveThumbColor:
                                                                    //       Colors
                                                                    //           .redAccent,
                                                                    //   inactiveTrackColor:
                                                                    //       Colors
                                                                    //           .orange,
                                                                    // )
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        101,
                                                                        160,
                                                                        209),
                                                                child: TextField(
                                                                    controller:
                                                                        dec_Controlled,
                                                                    maxLines: 2,
                                                                    style:
                                                                        new TextStyle(
                                                                            fontSize:
                                                                                16.0,
                                                                            // height: 2.0,
                                                                            color: Colors
                                                                                .black),
                                                                    decoration:
                                                                        const InputDecoration(
                                                                      hintText:
                                                                          "There is no data",
                                                                      contentPadding:
                                                                          EdgeInsets.symmetric(
                                                                              vertical:
                                                                                  60.0),

                                                                      //contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                                                                    )),
                                                              ),
                                                            ],
                                                          ),
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
                                      }),
                                      child: Visibility(
                                        visible:
                                            load_list[index].status == "Expired"
                                                ? true
                                                : false,
                                        child: Positioned(
                                          bottom: 10,
                                          top: 20,
                                          child: Padding(
                                            padding: const EdgeInsets.all(0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 51,
                                              color: Color.fromARGB(
                                                  255, 163, 201, 232),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.refresh,
                                                    color: Colors.white,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: Text(
                                                      "Repost",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15),
                                                    ),
                                                  ),
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
                            )),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, left: 28),
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey.shade400,
                              width: 1.0,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        // height: 30,
                        //width: 100
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(load_list[index].status),
                        )),
                  )
                ]),
              )),
    );
    // child: Padding(
    //     padding: const EdgeInsets.all(20),
    //     child: Align(
    //         alignment: FractionalOffset.bottomCenter,
    //         child: ConstrainedBox(
    //           constraints:
    //               const BoxConstraints.tightFor(width: 100, height: 35),
    //           child: ElevatedButton(
    //             style:
    //                 ElevatedButton.styleFrom(shape: const StadiumBorder()),
    //             onPressed: () {
    //               Navigator.push(context,
    //                   MaterialPageRoute(builder: ((context) {
    //                 return const PostLoadScreen();
    //               })
    //               )
    //               );
    //             },
    //             child: const Text('Post Load'),
    //           ),
    //         ))));
  }
//   _setImage(String vehicleName) {
//   if (vehicleName == "LCV") {
//     return SizedBox(
//         width: 180,
//         height: 100,
//         child: Image(image: AssetImage('assets/images/lvc_img.png')));

//     // return AssetImage('assets/images/lvc_img.png');
//   } else if (vehicleName == "truck" || vehicleName == "Truck") {
//     return SizedBox(
//         width: 180,
//         height: 100,
//         child: Image(image: AssetImage('assets/images/truck_img.png')));
//   } else if (vehicleName == "Hyva") {
//     return SizedBox(
//         width: 180,
//         height: 100,
//         child: Image(image: AssetImage('assets/images/hyva_img.png')));
//   } else if (vehicleName == "Container") {
//     return SizedBox(
//         width: 180,
//         height: 100,
//         child: Image(image: AssetImage('assets/images/container_img.png')));
//   } else if (vehicleName == "Trailer") {
//     return SizedBox(
//         width: 180,
//         height: 100,
//         child: Image(image: AssetImage('assets/images/treller_img.png')));
//   } else if (vehicleName == "Tanker") {
//     return SizedBox(
//         width: 180,
//         height: 100,
//         child: Image(image: AssetImage('assets/images/tanker_img.png')));
//   }
// }

  setImage(String vehicleName) {
    if (vehicleName == "LCV") {
      return SizedBox(
          width: 50,
          height: 50,
          child: Image(image: AssetImage('assets/images/lvc_img.png')));

      // return AssetImage('assets/images/lvc_img.png');
    } else if (vehicleName == "truck" || vehicleName == "Truck") {
      return SizedBox(
          width: 50,
          height: 50,
          child: Image(image: AssetImage('assets/images/truck_img.png')));
    } else if (vehicleName == "Hyva") {
      return SizedBox(
          width: 50,
          height: 50,
          child: Image(image: AssetImage('assets/images/hyva_img.png')));
    } else if (vehicleName == "Container") {
      return SizedBox(
          width: 50,
          height: 50,
          child: Image(image: AssetImage('assets/images/container_img.png')));
    } else if (vehicleName == "Trailer") {
      return SizedBox(
          width: 50,
          height: 50,
          child: Image(image: AssetImage('assets/images/treller_img.png')));
    } else if (vehicleName == "Tanker") {
      return SizedBox(
          width: 50,
          height: 50,
          child: Image(image: AssetImage('assets/images/tanker_img.png')));
    }
  }

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }
}

class LoadFilterPart extends StatefulWidget {
  const LoadFilterPart({super.key});

  @override
  State<StatefulWidget> createState() => _LoadFilterPartState();
}

class _LoadFilterPartState extends State<LoadFilterPart> {
  bool active_values = false;
  bool inprogress_values = false;

  bool completed_values = false;

  bool expired_values = false;

  bool inTransit_values = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Row(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Load",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            Container(
                width: 35,
                height: 3,
                color: const Color.fromARGB(255, 14, 100, 230))
          ],
        ),
        const Spacer(),
        InkWell(
            onTap: () {
              print("object");
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Container(
                              height: 400,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Filter Load By",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Center(
                                              child: Text("Active",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600))),
                                          Spacer(),
                                          Checkbox(
                                            value: this.active_values,
                                            onChanged: (value) {
                                              setState(() {
                                                this.active_values = value!;
                                                inprogress_values = false;
                                                completed_values = false;
                                                expired_values = false;
                                                inTransit_values = false;
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Center(
                                              child: Text("InProgress",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600))),
                                          Spacer(),
                                          Checkbox(
                                            value: this.inprogress_values,
                                            onChanged: (value) {
                                              setState(() {
                                                this.inprogress_values = value!;
                                                active_values = false;
                                                completed_values = false;
                                                expired_values = false;
                                                inTransit_values = false;
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Center(
                                              child: Text("Completed",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600))),
                                          Spacer(),
                                          Checkbox(
                                            value: this.completed_values,
                                            onChanged: (value) {
                                              setState(() {
                                                this.completed_values = value!;
                                                active_values = false;
                                                inprogress_values = false;
                                                expired_values = false;
                                                inTransit_values = false;
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Center(
                                              child: Text("Expired",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600))),
                                          Spacer(),
                                          Checkbox(
                                            value: this.expired_values,
                                            onChanged: (value) {
                                              setState(() {
                                                this.expired_values = value!;
                                                active_values = false;
                                                inprogress_values = false;
                                                completed_values = false;
                                                inTransit_values = false;
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Center(
                                              child: Text("In Transit",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600))),
                                          Spacer(),
                                          Checkbox(
                                            value: this.inTransit_values,
                                            onChanged: (value) {
                                              setState(() {
                                                this.inTransit_values = value!;
                                                active_values = false;
                                                inprogress_values = false;
                                                completed_values = false;
                                                expired_values = false;
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints.tightFor(
                                            width: 340, height: 40),
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            // backgroundColor: MaterialStateProperty.all(
                                            //     Color.fromARGB(255, 26, 82, 236)),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            )),
                                          ),
                                          onPressed: () async {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                              "Apply Filter".toUpperCase()),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )));
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
            },
            child: const FaIcon(FontAwesomeIcons.filter, size: 18))
      ]),
    );
  }
}

class LoadDestinationPart extends StatefulWidget {
  const LoadDestinationPart({super.key});

  @override
  State<StatefulWidget> createState() => _LoadDestinationPartState();
}

class _LoadDestinationPartState extends State<LoadDestinationPart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
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
                  Text('Loading Point',
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
                    child: Text('Where is your Unloading Point',
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 12,
                            color: Color.fromARGB(255, 30, 136, 229))),
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

class LoadCarouselSlider extends StatefulWidget {
  const LoadCarouselSlider({super.key});

  @override
  State<StatefulWidget> createState() => _LoadCarouselSliderState();
}

class _LoadCarouselSliderState extends State<LoadCarouselSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
            itemCount: listPaths.length,
            options: CarouselOptions(
                autoPlay: true,
                height: 140.0,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 900),
                viewportFraction: 0.75,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentPos = index;
                  });
                }),
            itemBuilder: (context, index, rea) {
              return Container(
                margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(listPaths[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: listPaths.map((url) {
            int index = listPaths.indexOf(url);
            return Container(
              width: 5.0,
              height: 5.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentPos == index
                    ? const Color.fromARGB(255, 14, 100, 230)
                    : const Color.fromARGB(255, 163, 196, 247),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
