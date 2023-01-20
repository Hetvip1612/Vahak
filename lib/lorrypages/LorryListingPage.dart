import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vahak_clone/Api/Api.dart';
import 'package:http/http.dart' as http;
import 'package:vahak_clone/lorrypages/LorryListingData_formv1.dart';
import 'package:vahak_clone/lorrypages/Model/LorryList.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LorryListingPage extends StatefulWidget {
  const LorryListingPage({super.key});

  @override
  State<LorryListingPage> createState() => _LorryListingPageState();
}

class _LorryListingPageState extends State<LorryListingPage> {
  int currentPos = 0;

  List<String>? listPaths = [
    "https://wonderfulengineering.com/wp-content/uploads/2016/01/nature-wallpapers-38.jpg",
    "https://www.pixelstalk.net/wp-content/uploads/2016/07/Desktop-autumn-hd-wallpaper-3D.jpg",
    "https://wallpapertag.com/wallpaper/full/c/8/8/548481-best-cool-nature-wallpapers-hd-1920x1080-720p.jpg",
    "https://i.pinimg.com/originals/ff/e4/59/ffe459582c8e4dc676d73e4b07dcabc0.jpg",
    "https://wallpapercave.com/wp/uUqxVHp.jpg",
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (var url in listPaths!) {
        precacheImage(NetworkImage(url), context);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
           SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(children: [
                    CarouselSlider.builder(
                        itemCount: listPaths!.length,
                        options: CarouselOptions(
                            autoPlay: true,
                            height: 140.0,
                            enlargeCenterPage: true,
                            aspectRatio: 16 / 9,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 900),
                            viewportFraction: 0.75,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentPos = index;
                              });
                            }),
                        itemBuilder: (context, index, rea) {
                          return Container(
                            margin: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: NetworkImage(listPaths![index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: listPaths!.map((url) {
                        int index = listPaths!.indexOf(url);
                        return Container(
                          width: 5.0,
                          height: 5.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentPos == index
                                ? const Color.fromARGB(255, 14, 100, 230)
                                : const Color.fromARGB(255, 163, 196, 247),
                          ),
                        );
                      }).toList(),
                    ),
                  ])),
              LoadDestinationPart(),
              LoadFilterPart(),
              LorryListData(),
             
            ],
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
                    return const LorryListingData_formv1();
                  })
                  )
                  );
                },
                child: const Text('Attach Lorry'),
              ),
            )))
        ],
        
      ),
    );
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
            const Text("My Lorries",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            Container(
                width: 50,
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LorryListingData_formv1()));
                    },
                    child: Text('Loading Point',
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

class MyImageView extends StatelessWidget {
  const MyImageView(String listPath, {super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class LorryListData extends StatefulWidget {
  const LorryListData({super.key});

  @override
  State<LorryListData> createState() => _LorryListState();
}

List<LorryList> lorry_list = [];
List<RouteLorry> routeLorry_list = [];

class _LorryListState extends State<LorryListData> {
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
  }

  @override
  void initState() {
    super.initState();
    lorry_list = [];
    getPostLoadList(context);
  }

  @override
  Widget build(BuildContext context) {
    // getPostLoadList(context);
    return ListView.separated(
        primary: false,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const Divider(
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
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                      width: 65,
                                      child: Image.asset(
                                        "assets/images/lorry_trucks.png",
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          lorry_list[index].uservehicleNumber,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            "Updated  on ${lorry_list[index].updatedDate}",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey.shade500),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5.0, left: 25),
                                child: Row(
                                  children: [
                                    SizedBox(
                                        width: 20,
                                        child: Image.asset(
                                            "assets/images/home.png",
                                            color: Colors.grey)),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        lorry_list[index].currentLocation,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 7.0, left: 25),
                                child: Row(
                                  children: [
                                    SizedBox(
                                        width: 20,
                                        child: Image.asset(
                                            "assets/images/lorry.png",
                                            color: Colors.grey)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        lorry_list[index].vehicleLoadCapacity +
                                            " " +
                                            lorry_list[index].vehicleName,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5.0, left: 25),
                                child: Row(
                                  children: [
                                    SizedBox(
                                        width: 15,
                                        child: Image.asset(
                                            "assets/images/location.png",
                                            color: Colors.grey)),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 13.0),
                                      child: Text(
                                        routeLorry_list.length.toString() +
                                            " Routes",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18.0, top: 5),
                                child: Container(
                                  color: Colors.grey.shade300,
                                  height: 0.7,
                                  width: double.infinity,
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                    )),
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
                        child: Text(lorry_list[index].status),
                      )),
                )
              ]),
            ));
  }
}
