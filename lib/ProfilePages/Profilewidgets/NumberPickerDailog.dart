import 'package:flutter/material.dart';
import 'package:vahak_clone/Api/Api.dart';

import 'package:numberpicker/numberpicker.dart';

import 'package:http/http.dart' as http;
import 'package:vahak_clone/ProfilePages/Model/CompanyBio.dart';
import 'package:vahak_clone/ProfilePages/Profilewidgets/user_add_companybio.dart';
class NumberPickerDailog extends StatefulWidget {
  const NumberPickerDailog({super.key});

  @override
  State<NumberPickerDailog> createState() => _NumberPickerState();
}

class _NumberPickerState extends State<NumberPickerDailog> {
  @override
  Widget build(BuildContext context) {
     final TextEditingController dec_Controlled = TextEditingController();
  String text = "Select Number";
 bool address_empaty=true; 
    bool address_data=false; 
 
   String dec_text ;

 
  int _currentValue = 1920;
    return Container(
    child: Padding(
      padding: EdgeInsets.only(top: 10, left: 20),
      child: Column(
        children: [ 
          
          
          
          Visibility(
          visible:address_empaty ,
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
                                                child: const Text("Add Company Bio"))),
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
                                                  Text("Select Number"),
                                              content: StatefulBuilder(
                                                  builder: (context, setState) {
                                                return NumberPicker(
                                                    selectedTextStyle: TextStyle(
                                                        color: Colors.red),
                                                    value: _currentValue,
                                                    minValue: 1920,
                                                    maxValue: 2022,
                                                    onChanged: (value) {
                                                      // updated(setState, value,
                                                      //     _currentValue);
        
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
        dec_text= dec_Controlled.text;
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
        // Visibility(
        //   visible: address_data,
        //   child: Column(
        //     children: [

        //       Text(dec_text)
              
        //     ],
        //   ),
        // )
        
        
        ],
    
        
      ),
    ),
  );
  }
}
