import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import 'package:vahak_clone/Api/Api.dart';
import 'package:vahak_clone/ProfilePages/Profilewidgets/bottompicker_sheet.dart';

import '../Api/AlertDialog.dart';


var editprofile_image;
var editcompany_name;
var editcity;
var editservices;
late String  _city_name;
String? s;
 TextEditingController companyControlled = TextEditingController();
  TextEditingController city_Controlled = TextEditingController();

class EditProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EditScreen();
  }
}

class EditScreen extends State<EditProfileScreen> {
 
  late List<bool> _isChecked;
  List<User> users = [];
  var selectedIndexes = [];
  var selectedIndexes_routs;

  String user_type = "service";
  @override
  void initState() {
    super.initState();
    _isChecked = List<bool>.filled(users.length, false);
    companyControlled = new TextEditingController(text: s.toString());
print(companyControlled.text);
    // String s =
    //     editcompany_name != null ? editcompany_name : Text(" Company Name ");
    // companyControlled = new TextEditingController(text: s.toString());

    // String s1 = editcity != null ? editcity : Text(" City ");
    // city_Controlled = new TextEditingController(text: s1.toString());
  }

  final ImagePicker _picker = ImagePicker();
  File? _image;
  bool uploadStatus = false;

  _imageFromGallery() async {
    final PickedFile? pickedImage =
        await _picker.getImage(source: ImageSource.gallery, imageQuality: 50);
    if (pickedImage == null) {
      showAlertDialog(
          context: context,
          title: "Error Uploading!",
          content: "No Image was selected.");
      return;
    }
    final File fileImage = File(pickedImage.path);
    if (imageConstraint(fileImage))
      setState(() {
        _image = fileImage;
      });
  }

  bool imageConstraint(File image) {
    if (!['bmp', 'jpg', 'jpeg']
        .contains(image.path.split('.').last.toString())) {
      showAlertDialog(
          context: context,
          title: "Error Uploading!",
          content: "Image format should be jpg/jpeg/bmp.");
      return false;
    }
    if (image.lengthSync() > 100000) {
      showAlertDialog(
          context: context,
          title: "Error Uploading!",
          content: "Image Size should be less than 100KB.");
      return false;
    }
    return true;
  }

  var _formkey = GlobalKey<FormState>();

Future getEditUserData() async {
  Map<String, String> headers = {
    // "Authorization":"Bearer $token",
    // "Content-type": "multipart/form-data"
    'Content-Type': 'application/json',
    'authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzAzODM0Njc1LCJpYXQiOjE2NzIyOTg2NzUsImp0aSI6IjFmMGQxMGM5ZDM4ZjQ3Y2E4OTNhNGFjZGRlOWUyMGYwIiwidXNlcl9pZCI6MTF9.hOEQI708-Hd2nt4eurXM4NieKlKLvDgaJ_wx0npbiGs'
  };
  var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.edit_profile + "11/");

  var response = await http.get(url, headers: headers);
  print(response);

  var jsonData = jsonDecode(response.body);

  editprofile_image = jsonData['data'][0]['profile_image'];
  editcompany_name = jsonData
  
  ['data'][0]['name'];
  editcity = jsonData['data'][0]['city'];
  editservices = jsonData['data'][0]['services'][0]['name'];

  print(editprofile_image);



    s =
        editcompany_name != null ? editcompany_name : Text(" Company Name ");
    
    String s1 = editcity != null ? editcity : Text(" City ");
   city_Controlled = new TextEditingController(text: s1.toString());
setState(() {
  
});
   
}

  @override
  Widget build(BuildContext context) {
    getUserData();
    getEditUserData();
    return Scaffold(
      //resizeToAvoidBottomInset : false,

      body: SafeArea(
          child: Form(
        key: _formkey,
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _getImageField,
                Container(
                  height: 0.9,
                  width: double.infinity,
                  color: Colors.grey,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: SizedBox(
                    height: 115,
                    width: 115,
                    child: InkWell(
                      onTap: () {
                        print("object");
                      },
                      child: Stack(
                        clipBehavior: Clip.none,
                        fit: StackFit.expand,
                        children: [
                          GestureDetector(
                            onTap: () {
                              bottomPickerSheet(context, _imageFromGallery);
                            },
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width / 6,
                              backgroundColor: Colors.grey,
                              backgroundImage: _image != null
                                  ? FileImage(_image!)
                                  : editprofile_image != null
                                      ? NetworkImage(
                                          'http://192.168.1.22:8008' +
                                              editprofile_image)
                                      : AssetImage('images/user.png')
                                          as ImageProvider,
                            ),
                          ),
                          // CircleAvatar(
                          //   backgroundImage: AssetImage("images/user.png"),
                          // ),
                          Positioned(
                              bottom: 0,
                              right: -25,
                              child: RawMaterialButton(
                                onPressed: () {},
                                elevation: 2.0,
                                fillColor: Color(0xFFF5F6F9),
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.blue,
                                ),
                                padding: EdgeInsets.all(5.0),
                                shape: CircleBorder(),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Container(
                    height: 0.9,
                    width: double.infinity,
                    color: Colors.grey.shade300,
                  ),
                ),
                //  getprimary_information,
                getexpande,
                _getroutes,
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: 340, height: 40),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          // backgroundColor:
                          //     MaterialStateProperty.all(Color.fromARGB(255, 26, 82, 236)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                        ),
                        onPressed: () async {
                          String _company_name =
                              companyControlled.text.toString();

                           _city_name = city_Controlled.text.toString();

                          //   EditProfileData? data = await add_editProfile(_image!.path,_company_name,_city_name,selectedIndexes_routs,user_type,context
                          //

                          if (_formkey.currentState!.validate()) {
                            submiteditSubscription(
                                _image,
                                _image!.path,
                                _company_name,
                                _city_name,
                                selectedIndexes_routs,
                                user_type,
                                context);

                                Navigator.pop(context);
                          }
                        },
                        child: Text("continue".toUpperCase()),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  get _getroutes {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: Column(
          children: <Widget>[
            //SizedBox(height:20.0),
            ExpansionTile(
              onExpansionChanged: (value) {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return StatefulBuilder(
                        builder: (context, setState) {
                          return Container(
                            padding: EdgeInsets.all(16.0),
                            child: FutureBuilder(
                              future: getUserData(),
                              builder:
                                  (BuildContext ctx, AsyncSnapshot snapshot) {
                                if (snapshot.data == null) {
                                  return Container(
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                } else {
                                  return ListView.builder(
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (ctx, index) =>
                                          CheckboxListTile(
                                            title:
                                                Text(snapshot.data[index].name),
                                            //  subtitle: Text(this.noteList[position].actn_on),
                                            value:
                                                selectedIndexes.contains(index),
                                            onChanged: (_) {
                                              setState(() {
                                                if (selectedIndexes
                                                    .contains(index)) {
                                                  selectedIndexes.remove(
                                                      index); // unselect
                                                } else {
                                                  selectedIndexes
                                                      .add(index); // select
                                                }

                                                print("*****************");
                                                print(selectedIndexes);
                                                var stringList =
                                                    selectedIndexes.join(",");
                                                Navigator.pop(
                                                    context, stringList);
                                                print(stringList);
                                              });
                                            },
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                          ));
                                }
                              },
                            ),
                          );
                        },
                      );
                    }).then((value) {
                  if (value != null) {
                    setState(() {
                      selectedIndexes_routs = value;
                    });
                  }
                });
              },
              title: const Text(
                "Routes Operating",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  get getexpande {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: Column(
          children: <Widget>[
            //SizedBox(height:20.0),
            ExpansionTile(
              title: Text(
                "Primary information",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(top: 0, left: 0, right: 20),
                      child: SizedBox(
                        child: InkWell(
                          onTap: (() {
                            print("object");
                          }),
                          child: TextFormField(
                            
                              controller: companyControlled,
                              maxLength: 50,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Company Name';
                                }
                                return null;
                              },
                              onChanged: ((value) {
                                setState(() {
                                  print(value);
                                  value=companyControlled.text;
                                });
                              }),
                              decoration: InputDecoration(
                                
                                  label: Text(" Company Name "),
                                  hintText: "Enter Company Name",
                                  errorStyle: TextStyle(
                                      color: Colors.red, fontSize: 15.0),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                        ),
                      )),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(top: 15, left: 0, right: 20),
                      child: InkWell(
                        onTap: () {
                          // companyControlled.text = "hello";
                          print("object data");

                          getservicedialog;
                        },
                        child: TextFormField(
                            enabled: false,
                            keyboardType: TextInputType.name,
                            //maxLength: 50,
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Please select Service';
                            //   }
                            //   return null;
                            // },
                            decoration: InputDecoration(
                                label: editservices != null
                                    ? Text(editservices)
                                    : Text(user_type),

                                //   label: Text(user_type),
                                hintText: "Service Provided",
                                errorStyle: TextStyle(
                                    color: Colors.red, fontSize: 15.0),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))))),
                      )),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(top: 15, left: 0, right: 20),
                      child: TextFormField(
                          keyboardType: TextInputType.name,
                          controller: city_Controlled,
                          //maxLength: 50,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter City';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              // label: editcity!=null ? Text(editcity)  : Text("City"),

                              label: Text(" City "),
                              hintText: "City",
                              errorStyle:
                                  TextStyle(color: Colors.red, fontSize: 15.0),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)))))),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: Container(
                    height: 0.9,
                    width: double.infinity,
                    color: Colors.grey.shade400,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  //bool _hasBeenPressed = false;
  bool value1 = false;

  get getservicedialog {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: ServiceDailog());
          },
        );
      },
    ).then((value) {
      if (value != null) {
        setState(() {
          user_type = value;
        });
      }
    });
    ;
  }

  get getprimary_information {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Primary Information",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(top: 20, left: 0, right: 20),
                  child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: companyControlled,
                      maxLength: 50,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Company Name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          label: Text(" Company "),
                          hintText: "Enter Company Name",
                          errorStyle:
                              TextStyle(color: Colors.red, fontSize: 15.0),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)))))),
            )
          ],
        ),
      ),
    );
  }

  late User user;

  Future getUserData() async {
    //  final response =
    //   await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.routes);
    var response = await http.get(url);
    print(response);

    var jsonData = jsonDecode(response.body);

    for (var u in jsonData) {
      user = User(u['id'], u['name']);
      users.add(user);
    }
    print(users.length);
    return users;
  }

 

  get _getImageField {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 0),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: IconButton(
                    onPressed: (() {
                      Navigator.pop(context);
                    }),
                    icon: Icon(Icons.arrow_back)),
              ),
              Text("Edit Profile",
                  style: TextStyle(fontSize: 15.0), textAlign: TextAlign.center)
            ],
          ),
        )
      ],
    );
  }
}

class User {
  int id;
  String name;
  User(this.id, this.name);
}

class ServiceDailog extends StatefulWidget {
  const ServiceDailog({super.key});

  @override
  State<ServiceDailog> createState() => _ServiceDailogState();
}

bool value1 = false;
bool value2 = false;

bool value3 = false;
bool _hasBeenPressed = false;
bool color_value = false;
bool color_value2 = false;

String service_data1 = "";
String service_data2 = "";

String service_data3 = "";
String service_data_final = "";

class _ServiceDailogState extends State<ServiceDailog> {
  @override
  Widget build(BuildContext context) {
    //bool value1 = false;

    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Align(
            //  alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                      padding: EdgeInsets.only(left: 5, top: 5),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Service Provieded ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ))),
                ),
                Spacer(),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Padding(
            padding: EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                // _hasBeenPressed=true;
                color_value = true;
                color_value2 = false;
                setState(() {
                  _hasBeenPressed = true;
                  print("_hasBeenPressed");
                });

                //                   setState() {

                // _hasBeenPressed=true;
                //                   }
              },
              child: Card(
                // backgroundColor:color_value? ApiConstants().purple()
                elevation: 5,
                shadowColor: Colors.black,
                color: color_value ? Colors.purple : Colors.white,
                child: SizedBox(
                  width: double.infinity,
                  //  height: 500,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage('images/user.png'),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                              child: Text(
                                            "Truck Operator",
                                            style: TextStyle(
                                                color: color_value
                                                    ? Colors.white
                                                    : Colors.black),
                                          ))),
                                      Text(
                                          "I Provide Transportation service, I own Lorries",
                                          style: TextStyle(
                                              color: color_value
                                                  ? Colors.white
                                                  : Colors.black))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Visibility(
                            visible: _hasBeenPressed,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                        value: value1,
                                        onChanged: ((boolvalue) {
                                          setState(() {
                                            value1 = boolvalue!;
                                            if (value1) {
                                              service_data1 = "TRANSPORTER";
                                            } else {
                                              service_data1 = "";
                                            }
                                          });
                                        })),
                                    Text("Transport Conractor",
                                        style: TextStyle(
                                            color: color_value
                                                ? Colors.white
                                                : Colors.black))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: value2,
                                      onChanged: (value) {
                                        setState(() {
                                          value2 = value!;
                                          if (value2) {
                                            service_data2 = "TRUCK OWNER";
                                          } else {
                                            service_data2 = "";
                                          }
                                        });
                                      },
                                    ),
                                    Text("Fleet Owner",
                                        style: TextStyle(
                                            color: color_value
                                                ? Colors.white
                                                : Colors.black))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: value3,
                                      onChanged: (value) {
                                        setState(() {
                                          value3 = value!;
                                          if (value3) {
                                            service_data3 = "Broker/Agent";
                                          } else {
                                            service_data3 = "";
                                          }
                                        });
                                      },
                                    ),
                                    Text("Agent/Broker",
                                        style: TextStyle(
                                            color: color_value
                                                ? Colors.white
                                                : Colors.black))
                                  ],
                                ),
                              ],
                            ),
                          )
                        ]), //Column
                  ), //Padding
                ), //SizedBox
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                service_data_final = "Shipping";
                _hasBeenPressed = false;
                print("_hasBeenPressed11");
                color_value = false;

                value1 = false;
                value2 = false;
                value3 = false;

                color_value2 = true;
              });
            },
            child: Card(
              elevation: 5,
              shadowColor: Colors.black,
              color: color_value2 ? Colors.purple : Colors.white,
              child: SizedBox(
                width: double.infinity,
                //  height: 500,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('images/user.png'),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                          child: Text("Shipping",
                                              style: TextStyle(
                                                  color: color_value2
                                                      ? Colors.white
                                                      : Colors.black)))),
                                  Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                          "I own the goods,looking the " +
                                              "\n" +
                                              "transportation service",
                                          style: TextStyle(
                                              color: color_value2
                                                  ? Colors.white
                                                  : Colors.black)))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ), //Column
                ), //Padding
              ), //SizedBox
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 340, height: 40),
              child: ElevatedButton(
                style: ButtonStyle(
                  // backgroundColor: MaterialStateProperty.all(
                  //     Color.fromARGB(255, 26, 82, 236)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
                ),
                onPressed: () async {
                  if (color_value) {
                    if (service_data1.isEmpty && service_data2.isEmpty) {
                      service_data_final = service_data3;
                    } else if (service_data2.isEmpty && service_data3.isEmpty) {
                      service_data_final = service_data1;
                    } else if (service_data1.isEmpty && service_data3.isEmpty) {
                      service_data_final = service_data2;
                    } else if (service_data1.isEmpty) {
                      service_data_final = "$service_data2 , $service_data3";
                    } else if (service_data2.isEmpty) {
                      service_data_final =
                          service_data1 + " , " + service_data3;
                    } else if (service_data3.isEmpty) {
                      service_data_final =
                          service_data1 + " , " + service_data2;
                    } else if (service_data2.isEmpty) {
                      service_data_final =
                          service_data1 + " , " + service_data3;
                    } else if (service_data1.isNotEmpty &&
                        service_data2.isNotEmpty &&
                        service_data3.isNotEmpty) {
                      service_data_final = service_data1 +
                          " , " +
                          service_data2 +
                          " , " +
                          service_data3;
                      print(service_data_final);
                    }
                  } else {
                    service_data_final = "Shipping";
                  }
                  print(service_data_final);
                  Navigator.pop(context, service_data_final);
                  // if (_formkey.currentState!.validate()) {
                  //   if (valuedata) {
                  //     String name = roiControlled.text.toString();
                  //     Register? data = await submitdata(name);
                  //   } else {
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //         const SnackBar(
                  //             content: Text("pls check ")));
                  //   }
                  // }
                },
                child: Text("Done".toUpperCase()),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

Future<int> submiteditSubscription(file, filename, company_name, _city_name,
    selectedIndexes_routs, user_type, BuildContext context) async {
  ///MultiPart request

  var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.edit_profile + "11/");
  var request = http.MultipartRequest(
    'PUT',
    url,
  );
  print(file);
  Map<String, String> headers = {
    // "Authorization":"Bearer $token",
    // "Content-type": "multipart/form-data"
    'Content-Type': 'application/json',
    'authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzAzODM0Njc1LCJpYXQiOjE2NzIyOTg2NzUsImp0aSI6IjFmMGQxMGM5ZDM4ZjQ3Y2E4OTNhNGFjZGRlOWUyMGYwIiwidXNlcl9pZCI6MTF9.hOEQI708-Hd2nt4eurXM4NieKlKLvDgaJ_wx0npbiGseyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzAzODM0Njc1LCJpYXQiOjE2NzIyOTg2NzUsImp0aSI6IjFmMGQxMGM5ZDM4ZjQ3Y2E4OTNhNGFjZGRlOWUyMGYwIiwidXNlcl9pZCI6MTF9.hOEQI708-Hd2nt4eurXM4NieKlKLvDgaJ_wx0npbiGs'
  };
  request.files.add(
    http.MultipartFile(
      'profile_image',
      file.readAsBytes().asStream(),
      file.lengthSync(),
      filename: filename,
      contentType: MediaType('image', 'jpeg'),
    ),
  );
  request.headers.addAll(headers);
  request.fields.addAll({
    "name": company_name,
    "city": _city_name,
    "routes": selectedIndexes_routs,
    "services": user_type
  });
  print("request: " + request.toString());
  var res = await request.send();

  var responseString = await res.stream.bytesToString();
  final decodedMap = json.decode(responseString);

  print("This is response:" + decodedMap.toString());
  return res.statusCode;
}

//late EditProfileData edit_profiledata;
