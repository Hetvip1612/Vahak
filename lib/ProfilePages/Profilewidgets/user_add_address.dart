import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vahak_clone/Api/Api.dart';
import 'package:vahak_clone/ProfilePages/Model/Address.dart';

Container add_useraddress(BuildContext context){
    TextEditingController buldingnumberControlled = TextEditingController();
    TextEditingController areaControlled = TextEditingController();
        TextEditingController ladmarkControlled = TextEditingController();

    TextEditingController cityControlled = TextEditingController();
    TextEditingController pincodeControlled = TextEditingController();
  var _formkey = GlobalKey<FormState>();

  return Container(
    child: Padding(
      padding: EdgeInsets.only(top: 0,left: 20),
      child: SingleChildScrollView(
        child: Row(children: [
           Image.asset(
                "assets/images/add_note.png",
            height: 100,
            width: 100,
          ),

          Padding(
            padding: EdgeInsets.only(left: 20),
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 225, height: 40),
              child: OutlinedButton(
                style: ButtonStyle(
                  side: MaterialStateProperty.all(BorderSide(
                      color: ApiConstants.purple,
                      width: 1.0,
                      style: BorderStyle.solid)),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )),
                ),
                onPressed: () async {
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
                            await addressdata(context,bulid_number, area,landmark,city,pincode,"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzAzMTQyNTk3LCJpYXQiOjE2NzE2MDY1OTcsImp0aSI6ImQxN2IyYWVkMWQ3ZTQwZTM4NmRjMGViOWFmMWRhYmFmIiwidXNlcl9pZCI6OH0.2t7cL5-IeQC2tG3ozP-0VGKI2HBVGeci4eT_B3Q6SwE");


                                       
                                            print(bulid_number+area+landmark+city+pincode);
                                           }
                                           setState(() {
  
});
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
                    });
                    },
                  );
                },
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "+ Add Address",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    )),
              ),
            ),
          )
        ]),
      ),
    ),
    
  );

}


Future addressdata(context,number, otp,  landmark,  city,  pincode,token) async {
    var headers = {'Content-Type':'application/json','authorization':'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzAzMTQyNTk3LCJpYXQiOjE2NzE2MDY1OTcsImp0aSI6ImQxN2IyYWVkMWQ3ZTQwZTM4NmRjMGViOWFmMWRhYmFmIiwidXNlcl9pZCI6OH0.2t7cL5-IeQC2tG3ozP-0VGKI2HBVGeci4eT_B3Q6SwE'};
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