import 'dart:convert';
import 'package:http/http.dart' as http;

  import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vahak_clone/Api/Api.dart';
import 'package:vahak_clone/ProfilePages/Model/Address.dart';
import 'package:vahak_clone/ProfilePages/Model/UserProfileData.dart';

//List<User> users = [];
  var selectedIndexes = [];
 late final List<Address> list;
Container show_compayaddress_list(BuildContext context, List<Officeaddress?> users, int length) {
  print(users.length);
    print("============================");
   // print(users[0].buildingNumber);

  //getUserData();
    TextEditingController buldingnumberControlled = TextEditingController();
    TextEditingController areaControlled = TextEditingController();
        TextEditingController ladmarkControlled = TextEditingController();

    TextEditingController cityControlled = TextEditingController();
    TextEditingController pincodeControlled = TextEditingController();
  var _formkey = GlobalKey<FormState>();

  return Container(
    
    child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    "Office Address",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue),
                  ),
                  Spacer(),
                  Padding(padding: EdgeInsets.only(right: 10),
                    child: InkWell(onTap: () {
                       showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return 
                      Padding(  
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: SizedBox(
                          
                          child: Form(
                            key: _formkey,
                            child: Wrap(children: [
                              Padding(padding: EdgeInsets.only(top: 20.0)),
                              Align(
                                //  alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text("Add Address ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),))),
                                    ),
                                    Spacer(),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Align(
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                  padding:
                                                      EdgeInsets.only(right: 20),
                                                  child: IconButton(
                                                    iconSize: 20,
                                                    icon: const Icon(
                                                      Icons.close,
                                                    ),
                                                    // the method which is called
                                                    // when button is pressed
                                                    onPressed: () {
                                                      Navigator.pop(context);

                                                      // setState(
                                                      //   () {
                                                      //     count++;
                                                      //   },
                                                      // );
                                                    },
                                                  )))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                               Padding(
                                          padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                                        ),
                                        
                                        Padding(
                                            padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                                            child: TextFormField(
                                                keyboardType: TextInputType.number,
                                                controller: buldingnumberControlled,
                                                maxLength: 50,
                                                validator: (value) {
                                                  if (value == null || value.isEmpty) {
                            return 'Please enter  your Building Number';
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                            label: Text(" Building Number "),
                            hintText: "Enter Building Number",
                            errorStyle:
                                TextStyle(color: Colors.red, fontSize: 15.0),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)))))),
                          
                          
                                       Padding(
                                            padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                                            child: TextFormField(
                                                keyboardType: TextInputType.name,
                                                controller: areaControlled,
                                                maxLength: 100,
                                                validator: (value) {
                                                  if (value == null || value.isEmpty) {
                            return 'Please enter  your Address';
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                            label: Text(" Area/Steet "),
                            hintText: "Enter area/steet",
                            errorStyle:
                                TextStyle(color: Colors.red, fontSize: 15.0),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)))))),
                                     Padding(
                                            padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                                            child: TextFormField(
                                                keyboardType: TextInputType.name,
                                                controller: ladmarkControlled,
                                                maxLength: 100,
                                                validator: (value) {
                                                  if (value == null || value.isEmpty) {
                            return 'Please enter  your Landmark';
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                            label: Text(" Landmark "),
                            hintText: "Enter landmark",
                            errorStyle:
                                TextStyle(color: Colors.red, fontSize: 15.0),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)))))),
                                     Padding(
                                            padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                                            child: TextFormField(
                                                keyboardType: TextInputType.name,
                                                controller: cityControlled,
                                                maxLength: 50,
                                                validator: (value) {
                                                  if (value == null || value.isEmpty) {
                            return 'Please enter  your City';
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                            label: Text(" City "),
                            hintText: "Enter City",
                            errorStyle:
                                TextStyle(color: Colors.red, fontSize: 15.0),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)))))),
                                     Padding(
                                            padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                                            child: TextFormField(
                                                keyboardType: TextInputType.number,
                                                controller: pincodeControlled,
                                                maxLength: 6,
                                                validator: (value) {
                                                  if (value == null || value.isEmpty) {
                            return 'Please enter  your Pincode';
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                            label: Text(" Pincode "),
                            hintText: "Enter Pincode",
                            errorStyle:
                                TextStyle(color: Colors.red, fontSize: 15.0),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)))))),
                                     
                                     
                                     
                                     
                                     Padding(
                                padding: EdgeInsets.only(top: 10,bottom: 5),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints.tightFor(
                                        width: 180, height: 40),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        // backgroundColor: MaterialStateProperty.all(
                                        //     Color.fromARGB(255, 26, 82, 236)),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                        )),
                                      ),
                                      onPressed: () async {
                                           if (_formkey.currentState!.validate()) {
                                            String bulid_number=buldingnumberControlled.text as String;
                                            String area=areaControlled.text as String;
                                            String landmark=ladmarkControlled.text as String;
                                            String city=cityControlled.text as String;
                                            String pincode=pincodeControlled.text as String;

SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  String? stringValue =
                                      prefs.getString("token");

 Address? data =
                            await addressdata(context,bulid_number, area,landmark,city,pincode,"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzAzNTY4MzA0LCJpYXQiOjE2NzIwMzIzMDQsImp0aSI6ImJhODRjMWE1ZWM4ODQxYTQ5MGI2OWNlZTQzZThlYTIxIiwidXNlcl9pZCI6N30.J5oyI8UIwu0m4gz5s6wDIF3N7ePPRsIpawd6Nuqz35U");


                                       
                                            print(bulid_number+area+landmark+city+pincode);
                                           }
                                      },
                                      child: Align(
                                          alignment: Alignment.center,
                                          child: Text("Attach New Address")),
                                    ),
                                  ),
                                ),
                              )
                            ]),
                          ),
                        ),
                      );
                    },
                  );
                    },
                      child: Padding(padding: EdgeInsets.only(right: 10),
                        child: Container(child: Text("Add"))))
                    )
                  //  Padding(
                  //     padding: EdgeInsets.only(top: 2),
                  //     child: Container(
                  //       height: 3,
                  //       width: double.infinity,
                  //       color: Colors.blue.shade300,
                  //     ),
                  //   )
                ],
              ),
            ),
          ),
        //  Text("Add"),
       Padding(
        padding: EdgeInsets.only(top: 10,left: 10),
         child: Container(
          height: 100,
         // width: double.infinity,
           child: Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount:users.length,
                // ignore: prefer_const_constructors
                itemBuilder: (BuildContext context, int index) => Card(
               
                  
                      child: SizedBox(
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
       
         Text(users[index]!.buildingNumber + " , "+ users[index]!.area),
        Padding(padding: EdgeInsets.only(top: 5),
          child: Text(users[index]!.landmark)),
         Padding(padding: EdgeInsets.only(top:5),
          child: Text(users[index]!.city + " , "+ users[index]!.pincode))
                          ],
                         )),
                    ),
              ),
            ),
         ),
       ),

        ]),
  );
}

Future addressdata(context,number, otp,  landmark,  city,  pincode,token) async {
    var headers = {'Content-Type':'application/json','authorization':'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzAzODM0Njc1LCJpYXQiOjE2NzIyOTg2NzUsImp0aSI6IjFmMGQxMGM5ZDM4ZjQ3Y2E4OTNhNGFjZGRlOWUyMGYwIiwidXNlcl9pZCI6MTF9.hOEQI708-Hd2nt4eurXM4NieKlKLvDgaJ_wx0npbiGs'};
final body = {"building_number": number.toString(), 
                      "area": otp.toString(),
                      "landmark": landmark.toString(),
                       "city": city.toString(),
                       "pincode": pincode.toString()
                      };
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.add_office_address);
    var response = await http
        .post(url, 
         headers: headers,
        body: jsonEncode(body));
    var data = response.body;
    print(data);
                                                      Navigator.pop(context);

   
     
   
  }