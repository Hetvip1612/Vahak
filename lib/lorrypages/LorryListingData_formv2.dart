import 'package:flutter/material.dart';
import 'package:vahak_clone/loadpages/ContainerVisibilityPart.dart';
import 'package:vahak_clone/loadpages/HyvaVisibilityPart.dart';
import 'package:vahak_clone/loadpages/TrailerVisibilityPart.dart';
import 'package:vahak_clone/loadpages/TruckVisibilityPart.dart';
import 'package:vahak_clone/lorrypages/LorryListingData_formv1.dart';

import '../loadpages/TankerVisibilityPart.dart';

class LorryListingData_formv2 extends StatefulWidget {
  var vehicle_numb;
  var current_loc;
  List selectedIndexes = [];
  
  LorryListingData_formv2(
      this.vehicle_numb, this.current_loc, this.selectedIndexes,
      {super.key});

  @override
  State<LorryListingData_formv2> createState() =>
      _LorryListingData_formv2State(vehicle_numb, current_loc, selectedIndexes);
}

class _LorryListingData_formv2State extends State<LorryListingData_formv2> {
  List selectedIndexes = [];
  var concatenate;
  String vehicle_numb;
  var current_loc;
  _LorryListingData_formv2State(
      this.vehicle_numb, this.current_loc, this.selectedIndexes);
 var nameveh = ["LCV", "Truck", "Hyva", "Container", "Trailer", "Tanker"];
  List<String> tonneveh = [
    "1-6 Tonnes",
    "1-42 Tonnes",
    "1-35 Tonnes",
    "1-18 Tonnes",
    "1-100 Tonnes",
    "1-35 KL"
  ];
  var trucklorry = ["Open Full Body", "Open Half Body"];
  final List<String> _listImages = [
    "assets/images/lvc_img.png",
    "assets/images/truck_img.png",
    "assets/images/hyva_img.png",
    "assets/images/container_img.png",
    "assets/images/treller_img.png",
    "assets/images/truck_img.png",
  ];
  int selectedCard = -1;
  bool loadclic = false;
  bool truckclic = false;
  bool hyvaclic = false;
  bool containerclic = false;
  bool trailerclic = false;
  bool tankerclic = false;

  int selectedlorry = -1;
  bool fullbodyclic = false;
  bool halfbodyclic = false;
    static bool nxtisDisable = true;
  nextbuttondata(value) {
    setState(() {
      _LorryListingData_formv2State.nxtisDisable = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    //    concatenate = StringBuffer();

    // selectedIndexes.forEach((item){
    //   concatenate.write(item);
    // });
    concatenate =
        selectedIndexes.reduce((value, element) => value + ',' + element);

// // For your example:
// List<String> servicesList = await SharedPrefSignUp.getSelectedServices();
// selectServicesText = servicesList.reduce((value, element) => value + ',' + element);
    print(concatenate);
    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
         SingleChildScrollView(
              scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(bottom:100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
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
                Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20.0, right: 10, left: 10),
                      child: SizedBox(
                        height: 150,
                        child: Card(
                          color: Colors.grey.shade100,
                          elevation: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            top: 15.0,
                                            bottom: 10.0,
                                            left: 10,
                                            right: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius: BorderRadius.circular(5)),
                                        child: const Padding(
                                          padding: EdgeInsets.only(
                                              top: 5.0,
                                              bottom: 5.0,
                                              left: 8,
                                              right: 8),
                                          child: Text(
                                            '1',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              margin: const EdgeInsets.only(
                                                  top: 15.0,
                                                  bottom: 10.0,
                                                  left: 10,
                                                  right: 10),
                                              child: const Text(
                                                "Vehicle Details",
                                                style:
                                                    TextStyle(color: Colors.grey),
                                              )),
                                          Container(
                                              margin: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              child: Text(
                                                widget.vehicle_numb.toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              )),
                                          Container(
                                              margin: const EdgeInsets.only(
                                                  top: 8, left: 10, right: 10),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                      width: 15,
                                                      child: Image.asset(
                                                          "assets/images/location.png",
                                                          color: Colors.grey)),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 8.0),
                                                    child: Text(
                                                      widget.current_loc.toString(),
                                                      style:
                                                          TextStyle(fontSize: 14),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: SizedBox(
                                              width: 250,
                                              child: Text(
                                                  "-  " + concatenate.toString(),
                                                  softWrap: false,
                                                  overflow: TextOverflow.ellipsis),
                                            ),
                                          ),
                                        ],
                                      ),
                                      //   Text(widget.vehicle_numb.toString())
                                    ],
                                  ),
                                  const SizedBox(width: 10),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      //  var vehicle_numb
                                      var push = Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LorryListingData_formv1()));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 20.0,
                                          bottom: 10.0,
                                          left: 10,
                                          right: 10),
                                      child: const Text(
                                        'Edit',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w800,
                                            color:
                                                Color.fromARGB(255, 14, 100, 230)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                      Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Card(
                                color: Colors.grey.shade100,
                                elevation: 5,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            top: 15.0,
                                            bottom: 10.0,
                                            left: 10,
                                            right: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: const Padding(
                                          padding: EdgeInsets.only(
                                              top: 5.0,
                                              bottom: 5.0,
                                              left: 8,
                                              right: 8),
                                          child: Text(
                                            '2',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                      color:
                                                          Colors.grey.shade700),
                                                )),
                                          ])
                                    ])),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: ((context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedCard = index;
                                      if (selectedCard == 0) {
                                        _LorryListingData_formv2State.nxtisDisable = false;
                                        truckclic = false;
                          
                                        loadclic = true;
                                        hyvaclic = false;
                                        trailerclic = false;
                                        containerclic = false;
                                        tankerclic = false;
                                      }
                                      if (selectedCard == 1) {
                                        _LorryListingData_formv2State.nxtisDisable = false;
                          
                                        truckclic = true;
                                        loadclic = false;
                                        hyvaclic = false;
                                        trailerclic = false;
                                        containerclic = false;
                                        tankerclic = false;
                                      }
                                      if (selectedCard == 2) {
                                        _LorryListingData_formv2State.nxtisDisable = true;
                          
                                        truckclic = false;
                                        loadclic = false;
                                        hyvaclic = true;
                                        trailerclic = false;
                                        containerclic = false;
                                        tankerclic = false;
                                      }
                                      if (selectedCard == 3) {
                                        _LorryListingData_formv2State.nxtisDisable = true;
                          
                                        truckclic = false;
                                        loadclic = false;
                                        hyvaclic = false;
                                        trailerclic = false;
                                        containerclic = true;
                                        tankerclic = false;
                                      }
                                      if (selectedCard == 4) {
                                        _LorryListingData_formv2State.nxtisDisable = true;
                          
                                        truckclic = false;
                                        loadclic = false;
                                        hyvaclic = false;
                                        trailerclic = true;
                                        containerclic = false;
                                        tankerclic = false;
                                      }
                                      if (selectedCard == 5) {
                                        _LorryListingData_formv2State.nxtisDisable = false;
                                        truckclic = false;
                                        loadclic = false;
                                        hyvaclic = false;
                                        trailerclic = false;
                                        containerclic = false;
                                        tankerclic = true;
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                        border: Border.all(
                                            width: 1,
                                            color: selectedCard == index
                                                ? Colors.blue
                                                : Colors.grey.shade200)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(_listImages[index],
                                            fit: BoxFit.contain,
                                            width: 60,
                                            height: 60),
                                        const Spacer(),
                                        Container(
                                          width: double.infinity,
                                          color: selectedCard == index
                                              ? Colors.blue
                                              : Colors.grey.shade200,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(nameveh[index],
                                                    style: selectedCard == index
                                                        ? const TextStyle(
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white)
                                                        : const TextStyle(
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black)),
                                                Text(tonneveh[index],
                                                    style: selectedCard == index
                                                        ? const TextStyle(
                                                            fontSize: 10,
                                                            color: Colors.white)
                                                        : const TextStyle(
                                                            fontSize: 10,
                                                            color:
                                                                Colors.black)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                              itemCount: nameveh.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 11,
                                      crossAxisSpacing: 11),
                            ),
                          ),
                          Visibility(
                              visible: truckclic,
                              child: Column(
                                children:  [
                                  TruckVisibolityPart(nextbuttondata)
                                ],
                              )),
                          Visibility(
                              visible: hyvaclic,
                              child: Column(
                                children:  [HvyaVisibilityPart(nextbuttondata)],
                              )),
                          Visibility(
                              visible: containerclic,
                              child: Column(
                                children:  [ContainerVisibilityPart(nextbuttondata)],
                              )),
                          Visibility(
                              visible: trailerclic,
                              child: Column(
                                children:  [TrailerVisibilityPart(nextbuttondata)],
                              )),
                          Visibility(
                              visible: tankerclic,
                              child: Column(
                                children: const [TankerVisibilityPart()],
                              )),
                  ],
                ),
               
                        ]),
                        
                
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
Navigator.pop(context);
                    // if (vehicle_numb.isEmpty) {
                    //   Fluttertoast.showToast(
                    //       msg: "enter vehicle number",
                    //       toastLength: Toast.LENGTH_SHORT,
                    //       gravity: ToastGravity.CENTER,
                    //       timeInSecForIosWeb: 1,
                    //       textColor: Colors.white,
                    //       fontSize: 16.0);
                    // } else if (current_loc.isEmpty) {
                    //   Fluttertoast.showToast(
                    //       msg: "pls enter current location",
                    //       toastLength: Toast.LENGTH_SHORT,
                    //       gravity: ToastGravity.CENTER,
                    //       timeInSecForIosWeb: 1,
                    //       textColor: Colors.white,
                    //       fontSize: 16.0);
                    // } else if (selectedIndexes.isEmpty) {
                    //    Fluttertoast.showToast(
                    //       msg: "pls select location",
                    //       toastLength: Toast.LENGTH_SHORT,
                    //       gravity: ToastGravity.BOTTOM,
                    //       timeInSecForIosWeb: 1,
                    //       textColor: Colors.white,
                    //       fontSize: 16.0);
                    // } else {
                    //   Navigator.pop(context);
                    //   //  var vehicle_numb
                    //   Navigator.of(context).push(MaterialPageRoute(
                    //       builder: (context) => LorryListingData_formv2(
                    //           vehicle_numb, current_loc,selectedIndexes)));
                    // }

                    // print(vehicle_numb + current_loc);
                  },
                  child: Text("Attach & Post ".toUpperCase()),
                ),
              ),
            ),
          ),
        ),
      )
          ],
        )
      ,
    ));
  }
}
