import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'package:vahak_clone/loadpages/ContainerVisibilityPart.dart';
import 'package:vahak_clone/loadpages/HyvaVisibilityPart.dart';
import 'package:vahak_clone/loadpages/PaymentDetailPart.dart';
import 'package:vahak_clone/loadpages/TankerVisibilityPArt.dart';
import 'package:vahak_clone/loadpages/TrailerVisibilityPart.dart';
import 'package:vahak_clone/loadpages/TruckVisibilityPart.dart';

class PostLoadScreen extends StatefulWidget {
  const PostLoadScreen({super.key});

  @override
  State<PostLoadScreen> createState() => _PostLoadScreenState();
}

bool visible = false;
bool nxtvisible = false;
TextEditingController pickupController = TextEditingController();
TextEditingController dropController = TextEditingController();
TextEditingController materialController = TextEditingController();
TextEditingController quantityController = TextEditingController();
var picktext, droptext, materialtext, quantitytext;
String _pickname = '';
String _dropname = '';
String _materialname = '';
String _quantityname = '';

final _formKey = GlobalKey<FormState>();

class _PostLoadScreenState extends State<PostLoadScreen> {
  var pickedtxt;
  var droppedtxt;
  var materialedtxt;
  var quanttxt;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                    padding:
                        const EdgeInsets.only(top: 40.0, left: 20, right: 20),
                    child: Column(children: [
                      Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            InkWell(
                              child: const FaIcon(FontAwesomeIcons.xmark),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            const SizedBox(width: 20),
                            const Text(
                              'Add New Load',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: pickupController,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 10.0),
                                  border: OutlineInputBorder(),
                                  labelText: 'Pickup Location',
                                  hintText: 'Search Pickup Location',
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
                                  _pickname = pickvalue;
                                  if (_dropname.isNotEmpty &&
                                      _pickname.isNotEmpty) {
                                    visible = true;
                                  } else {
                                    visible = false;
                                  }
                                }),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: dropController,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 10.0),
                                  border: OutlineInputBorder(),
                                  labelText: 'Drop Location',
                                  hintText: 'Search Drop Location',
                                ),
                                validator: (dropvalue) {
                                  if (dropvalue == null || dropvalue.isEmpty) {
                                    visible = false;
                                    return 'Can\'t be empty';
                                  }

                                  return null;
                                },
                                // update the state variable when the text changes
                                onChanged: (dropvalue) => setState(() {
                                  _dropname = dropvalue;
                                  if (_dropname.isNotEmpty &&
                                      _pickname.isNotEmpty) {
                                    visible = true;
                                  } else {
                                    visible = false;
                                  }
                                }),
                              ),
                            ),
                            Visibility(
                                visible: visible,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        controller: materialController,
                                        decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 15.0, horizontal: 10.0),
                                          border: OutlineInputBorder(),
                                          labelText: 'Material Name',
                                          hintText: 'Steel',
                                        ),
                                        validator: (materialvalue) {
                                          if (materialvalue == null ||
                                              materialvalue.isEmpty) {
                                            return 'Enter material, e.g.Steel';
                                          }

                                          return null;
                                        },
                                        onChanged: (materialvalue) =>
                                            setState(() {
                                          _materialname = materialvalue;
                                          if (_quantityname.isNotEmpty &&
                                              _materialname.isNotEmpty) {
                                            nxtvisible = true;
                                          } else {
                                            nxtvisible = false;
                                          }
                                        }),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        controller: quantityController,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 15.0,
                                                  horizontal: 10.0),
                                          border: const OutlineInputBorder(),
                                          labelText: 'Quantity',
                                          hintText: '10.0',
                                          suffixIcon: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween, // added line
                                            mainAxisSize:
                                                MainAxisSize.min, // added line
                                            children: <Widget>[
                                              SizedBox(
                                                height: 25,
                                                width: 73,
                                                child: OutlinedButton(
                                                  style: OutlinedButton.styleFrom(
                                                      shape:
                                                          const StadiumBorder()),
                                                  child: const Text(
                                                    'Tonne(s)',
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  ),
                                                  onPressed: () {},
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              SizedBox(
                                                height: 25,
                                                width: 81,
                                                child: OutlinedButton(
                                                  style: OutlinedButton.styleFrom(
                                                      shape:
                                                          const StadiumBorder()),
                                                  onPressed: (() {}),
                                                  child: const Text(
                                                      'Kilo liter(s)',
                                                      style: TextStyle(
                                                          fontSize: 10)),
                                                ),
                                              ),
                                              const SizedBox(width: 15),
                                            ],
                                          ),
                                        ),
                                        validator: (quantityvalue) {
                                          if (quantityvalue == null ||
                                              quantityvalue.isEmpty) {
                                            return 'Please enter the quantity';
                                          }

                                          return null;
                                        },
                                        onChanged: (quantityvalue) =>
                                            setState(() {
                                          _quantityname = quantityvalue;
                                          if (_quantityname.isNotEmpty &&
                                              _materialname.isNotEmpty) {
                                            nxtvisible = true;
                                          } else {
                                            nxtvisible = false;
                                          }
                                        }),
                                      ),
                                    ),
                                    Visibility(
                                      visible: nxtvisible,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    const Color.fromARGB(
                                                        255, 26, 82, 236)),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            )),
                                          ),
                                          onPressed: () {
                                            pickedtxt = pickupController.text
                                                .toString();
                                            droppedtxt =
                                                dropController.text.toString();
                                            materialedtxt = materialController
                                                .text
                                                .toString();
                                            quanttxt = quantityController.text
                                                .toString();

                                            if (_formKey.currentState!
                                                .validate()) {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return AddLoadDetailsPart(
                                                    pickedtxt,
                                                    droppedtxt,
                                                    materialedtxt,
                                                    quanttxt);
                                              }));
                                            }
                                          },
                                          child: Text("Next  ".toUpperCase()),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      )
                    ])),
              ),
            )));
  }
}

typedef parentFunctionCallback = void Function(bool value);

class AddLoadDetailsPart extends StatefulWidget {
  String pickedtxt;
  String droppedtxt;
  String materialedtxt;
  String quanttxt;

  static bool nxtisDisable = true;

  AddLoadDetailsPart(
      this.pickedtxt, this.droppedtxt, this.materialedtxt, this.quanttxt,
      {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AddLoadDetailsPartState(
        pickedtxt, droppedtxt, materialedtxt, quanttxt);
  }
}

class _AddLoadDetailsPartState extends State<AddLoadDetailsPart> {
  String pickedtxt;
  String droppedtxt;
  String materialedtxt;
  String quanttxt;

  nextbuttondata(value) {
    setState(() {
      AddLoadDetailsPart.nxtisDisable = value;
    });
  }

  _AddLoadDetailsPartState(
      this.pickedtxt, this.droppedtxt, this.materialedtxt, this.quanttxt);
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
    "assets/images/lcv.png",
    "assets/images/truck.png",
    "assets/images/hyva.png",
    "assets/images/container.png",
    "assets/images/trailer.png",
    "assets/images/tanker.png",
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              color: Colors.white,
                              child: Row(
                                children: [
                                  InkWell(
                                    child: const FaIcon(FontAwesomeIcons.xmark),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  const SizedBox(width: 20),
                                  const Text(
                                    'Add New Load',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: SizedBox(
                              height: 150,
                              child: Card(
                                color: Colors.grey.shade100,
                                elevation: 5,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          '1',
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
                                              'Load Details',
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.grey.shade700),
                                            )),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                top: 5.0, left: 10, right: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                const Icon(Icons.circle,
                                                    size: 8),
                                                const SizedBox(width: 5),
                                                Text(
                                                  widget.pickedtxt.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            )),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 13, right: 10),
                                            width: 1.5,
                                            color: Colors.black,
                                            height: 10),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 10.0,
                                                left: 10,
                                                right: 10),
                                            child: Row(
                                              children: [
                                                const Icon(Icons.rectangle,
                                                    size: 9),
                                                const SizedBox(width: 5),
                                                Text(
                                                  widget.droppedtxt.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            )),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 10.0,
                                                left: 10,
                                                right: 10),
                                            child: Row(
                                              children: [
                                                Text(
                                                  widget.materialedtxt
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.black),
                                                ),
                                                const Text('-'),
                                                Text(
                                                  widget.quanttxt.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                    const Spacer(),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
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
                                              fontSize: 10,
                                              fontWeight: FontWeight.w800,
                                              color: Color.fromARGB(
                                                  255, 14, 100, 230)),
                                        ),
                                      ),
                                    )
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
                                        AddLoadDetailsPart.nxtisDisable = false;
                                        truckclic = false;

                                        loadclic = true;
                                        hyvaclic = false;
                                        trailerclic = false;
                                        containerclic = false;
                                        tankerclic = false;
                                      }
                                      if (selectedCard == 1) {
                                        AddLoadDetailsPart.nxtisDisable = false;

                                        truckclic = true;
                                        loadclic = false;
                                        hyvaclic = false;
                                        trailerclic = false;
                                        containerclic = false;
                                        tankerclic = false;
                                      }
                                      if (selectedCard == 2) {
                                        AddLoadDetailsPart.nxtisDisable = true;

                                        truckclic = false;
                                        loadclic = false;
                                        hyvaclic = true;
                                        trailerclic = false;
                                        containerclic = false;
                                        tankerclic = false;
                                      }
                                      if (selectedCard == 3) {
                                        AddLoadDetailsPart.nxtisDisable = true;

                                        truckclic = false;
                                        loadclic = false;
                                        hyvaclic = false;
                                        trailerclic = false;
                                        containerclic = true;
                                        tankerclic = false;
                                      }
                                      if (selectedCard == 4) {
                                        AddLoadDetailsPart.nxtisDisable = true;

                                        truckclic = false;
                                        loadclic = false;
                                        hyvaclic = false;
                                        trailerclic = true;
                                        containerclic = false;
                                        tankerclic = false;
                                      }
                                      if (selectedCard == 5) {
                                        AddLoadDetailsPart.nxtisDisable = false;
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
                                            fit: BoxFit.cover,
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
                        ]),
                      ),
                    ),
                     SizedBox(
        width: double.infinity,
        height: 50,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0, top: 2),
          child: ElevatedButton(
              style: AddLoadDetailsPart.nxtisDisable
                  ? ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade200)
                  : ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                AddLoadDetailsPart.nxtisDisable
                    ? () => null
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => PaymentDetailPart(
                                pickedtxt: pickedtxt,
                                droppedtxt: droppedtxt,
                                materialedtxt: materialedtxt,
                                quanttxt: quanttxt))));
              },
              child: const Text('Next')),
        )),
                  ],
                )),
          )),
    );
  }
}


