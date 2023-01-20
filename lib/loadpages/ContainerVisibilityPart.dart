import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vahak_clone/loadpages/PostLoadScreen.dart';

class ContainerVisibilityPart extends StatefulWidget {
  const ContainerVisibilityPart(this.parentfunc, {super.key});

  /// ToDo
  final parentFunctionCallback parentfunc;
  @override
  State<ContainerVisibilityPart> createState() =>
      _ContainerVisibilityPartState();
}

class _ContainerVisibilityPartState extends State<ContainerVisibilityPart> {
  var containerfeet = [
    "32 ft sxl",
    "32 ft sxl HQ",
    "32 ft mxl",
    "32 ft mxl HQ",
    "20 ft Sxl",
    "21 ft Sxl",
    "22 ft Sxl",
    "23 ft Sxl",
    "24 ft Sxl"
  ];
  var selectedfeet = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      
      children: [
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Select the Container Feet'),
      ),
      Wrap(children: [
        for (int index = 0; index < containerfeet.length; index++)
          InkWell(
              onTap: () {
                setState(() {
                  selectedfeet = index;
                  if (selectedfeet == 0) {
                    AddLoadDetailsPart.nxtisDisable = false;
                      widget.parentfunc(false);
                  }
                  if (selectedfeet == 1) {
                    AddLoadDetailsPart.nxtisDisable = false;
                      widget.parentfunc(false);
                  }
                });
              },
              child: Container(
                decoration: selectedfeet == index
                    ? const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(7.0)))
                    : const BoxDecoration(
                        color: Color.fromARGB(255, 245, 245, 245),
                        borderRadius: BorderRadius.all(Radius.circular(7.0))),
                margin: const EdgeInsets.only(left:8.0,right: 8.0,top:5,bottom: 5),
                child: Padding(
                  padding: const EdgeInsets.only(left:15.0,right: 15.0,top:10,bottom: 10),
                  child: Text(containerfeet[index],
                      style: selectedfeet == index
                          ? const TextStyle(fontSize: 12, color: Colors.white)
                          : const TextStyle(fontSize: 12, color: Colors.black)),
                ),
              )),
      ])
    ]);
  }
}
