import 'package:flutter/material.dart';

class Textdata extends StatelessWidget{
  String? txtdata;
  Color txtcolor;
  FontWeight fweight;
  

  Textdata({super.key,this.txtdata,
   this.txtcolor=Colors.blue,
   this.fweight=FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(txtdata!,style: TextStyle(color: txtcolor,fontFamily: 'Montserrat',fontWeight: fweight,fontSize: 12));
  }
}