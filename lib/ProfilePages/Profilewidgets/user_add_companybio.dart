import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import 'package:http/http.dart' as http;
import 'package:vahak_clone/Api/Api.dart';
import 'package:vahak_clone/ProfilePages/Model/CompanyBio.dart';
  





class Company_BIO extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CompanyDetailsBio();
  }

}

class CompanyDetailsBio extends State<Company_BIO> {
     final TextEditingController dec_Controlled = TextEditingController();

  int _currentValue = 1;
    String text = "Select value";

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
    child: Padding(
      padding: EdgeInsets.only(top: 10, left: 20),
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
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: SizedBox(
                          height: 500,
                          child: Column(children: [
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
                                            child: Text("Add Company Bio"))),
                                  ),
                                  Spacer(),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
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
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 20, top: 20),
                                  child: Text("Year of Establishment")),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title:
                                              Text("Select value"),
                                          content: StatefulBuilder(
                                              builder: (context, setState) {
                                            return NumberPicker(
                                                selectedTextStyle: TextStyle(
                                                    color: Colors.red),
                                                value: _currentValue,
                                                minValue: 1,
                                                maxValue: 10,
                                                onChanged: (value) {
                                                  updated(setState, value,
                                                      _currentValue);

                                                  setState(() =>
                                                      _currentValue = value);
                                                });
                                          }),
                                          actions: [
                                            TextButton(
                                              child: Text("OK"),
                                              onPressed: () {
                                                print("_currentValue");
                                                print(_currentValue);
                                                Navigator.of(context).pop(_currentValue.toString());
                                              },
                                            )
                                          ],
                                        );
                                      }
                                      
                                      
                                      
                                      ).then((value) {
                                       if (value != null) {
                                       setState(() {
                                          text=value;
                                              });
                                      }
                                  });
                                },
                                child: Container(
                                  height: 60,
                                  child: InputDecorator(
                                    decoration: InputDecoration(
                                      // labelText: 'XP',

                                      suffixIcon: Icon(Icons.calendar_month),

                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7.0),
                                          borderSide: BorderSide(
                                              width: 1,
                                              color: ApiConstants.purple)),
                                    ),
                                    child: Text(text),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(right: 20, top: 0, left: 20),
                              child: Container(
                                height: 150.0,
                                decoration: new BoxDecoration(
                                    border: new Border.all(color: Colors.grey)),
                                child: new SizedBox(
                                  height: 150,
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: new TextField(
                                        controller: dec_Controlled,
                                        maxLines: 2,
                                        style: new TextStyle(
                                            fontSize: 16.0,
                                            // height: 2.0,
                                            color: Colors.black),
                                        decoration: const InputDecoration(
                                          hintText: "There is no data",
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 60.0),

                                          //contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: ConstrainedBox(
                                constraints: BoxConstraints.tightFor(
                                    width: 150, height: 40),
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
                                    String dec_ = dec_Controlled.text;

                                    CompanyBio? data = await add_compann_bio(
                                        _currentValue, dec_, context);
//add_compann_bio(_currentValue,dec_);
                                  },
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text("Done")),
                                ),
                              ),
                            )
                          ]),
                        ),
                      );
                    },
                  );
                },
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "+ Add Company Bio ",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    )),
              ),
            ),
          ),
        ]),
      ),
    ),
  ),

  );
  }
}
































companybio(BuildContext context) {
  final TextEditingController dec_Controlled = TextEditingController();

  int _currentValue = 1;
  return Container(
    child: Padding(
      padding: EdgeInsets.only(top: 10, left: 20),
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
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: SizedBox(
                          height: 500,
                          child: Column(children: [
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
                                            child: Text("Add Company Bio"))),
                                  ),
                                  Spacer(),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
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
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 20, top: 20),
                                  child: Text("Year of Establishment")),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title:
                                              Text("Wähle eine Aufgabenanzahl"),
                                          content: StatefulBuilder(
                                              builder: (context, setState) {
                                            return NumberPicker(
                                                selectedTextStyle: TextStyle(
                                                    color: Colors.red),
                                                value: _currentValue,
                                                minValue: 1,
                                                maxValue: 10,
                                                onChanged: (value) {
                                                  updated(setState, value,
                                                      _currentValue);

                                                  setState(() =>
                                                      _currentValue = value);
                                                });
                                          }),
                                          actions: [
                                            TextButton(
                                              child: Text("OK"),
                                              onPressed: () {
                                                print("_currentValue");
                                                print(_currentValue);
                                                Navigator.of(context).pop(_currentValue.toString());
                                              },
                                            )
                                          ],
                                        );
                                      }
                                      
                                      
                                      
                                      ).then((value){ 
                                        
                                      });
                                },
                                child: Container(
                                  height: 60,
                                  child: InputDecorator(
                                    decoration: InputDecoration(
                                      // labelText: 'XP',

                                      suffixIcon: Icon(Icons.calendar_month),

                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7.0),
                                          borderSide: BorderSide(
                                              width: 1,
                                              color: ApiConstants.purple)),
                                    ),
                                    child: Text(_currentValue.toString()),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(right: 20, top: 0, left: 20),
                              child: Container(
                                height: 150.0,
                                decoration: new BoxDecoration(
                                    border: new Border.all(color: Colors.grey)),
                                child: new SizedBox(
                                  height: 150,
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: new TextField(
                                        controller: dec_Controlled,
                                        maxLines: 2,
                                        style: new TextStyle(
                                            fontSize: 16.0,
                                            // height: 2.0,
                                            color: Colors.black),
                                        decoration: const InputDecoration(
                                          hintText: "There is no data",
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 60.0),

                                          //contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: ConstrainedBox(
                                constraints: BoxConstraints.tightFor(
                                    width: 150, height: 40),
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
                                    String dec_ = dec_Controlled.text;

                                    CompanyBio? data = await add_compann_bio(
                                        _currentValue, dec_, context);
//add_compann_bio(_currentValue,dec_);
                                  },
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text("Done")),
                                ),
                              ),
                            )
                          ]),
                        ),
                      );
                    },
                  );
                },
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "+ Add Company Bio ",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    )),
              ),
            ),
          ),
        ]),
      ),
    ),
  );
}


Future<Null> updated(
    StateSetter updateState, int value, int currentValue) async {
  updateState(() {
    currentValue = value;
  });
}
//  Future<Null> updated(StateSetter setState, int value) {
//   updateState(() {
//       update = 'Update Leekan si';
//     });
// }
// Future add_compann_bio(number, otp) async {
//     var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.add_company_bio+"/6/");
//     var response = await http
//         .post(url, body: {"company_start_date": number.toString(), "company_start_date": otp.toString()});
//     var data = response.body;
//     print(data);

//      if (response.statusCode == 200) {

//      }else{

//      }

// }
Future add_compann_bio(number, otp, BuildContext context) async {
  print(number);
    print(otp);

  var headers = {
    'Content-Type': 'application/json',
    'authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzAzMTQyNTk3LCJpYXQiOjE2NzE2MDY1OTcsImp0aSI6ImQxN2IyYWVkMWQ3ZTQwZTM4NmRjMGViOWFmMWRhYmFmIiwidXNlcl9pZCI6OH0.2t7cL5-IeQC2tG3ozP-0VGKI2HBVGeci4eT_B3Q6SwE'
  };
  final body = {
    "company_start_date": number,
    "company_bio": otp.toString(),
  };
  var url =
      Uri.parse(ApiConstants.baseUrl + ApiConstants.add_company_bio + "6/");
  var response = await http.put(url, headers: headers, body: jsonEncode(body));
  var data = response.body;
  print(data);
  Navigator.pop(context);
}


Future<CompanyBio> updateFruit(String title,String dec) async {
  var url =
      Uri.parse(ApiConstants.baseUrl + ApiConstants.add_company_bio + "6/");
  final http.Response response = await http.put(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json', 'authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzAzMTQyNTk3LCJpYXQiOjE2NzE2MDY1OTcsImp0aSI6ImQxN2IyYWVkMWQ3ZTQwZTM4NmRjMGViOWFmMWRhYmFmIiwidXNlcl9pZCI6OH0.2t7cL5-IeQC2tG3ozP-0VGKI2HBVGeci4eT_B3Q6SwE',
    },
    body: jsonEncode(<String, String>{
    "company_start_date": title.toString(),
    "company_bio": dec.toString(),
    }),
  );
var data = response.body;
  print(data);
  if (response.statusCode == 200) {
    return CompanyBio.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to update album.');
  }
}