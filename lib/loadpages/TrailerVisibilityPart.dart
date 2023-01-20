import 'package:flutter/material.dart';

import 'PostLoadScreen.dart';

class TrailerVisibilityPart extends StatefulWidget {
  const TrailerVisibilityPart(this.parentfunc, {super.key});

  /// ToDo
  final parentFunctionCallback parentfunc;
  @override
  State<TrailerVisibilityPart> createState() => _TrailerVisibilityPartState();
}

class _TrailerVisibilityPartState extends State<TrailerVisibilityPart> {
  var trailerfeet = [
    "40 ft High bed",
    "40 ft Semi bed",
    "40 ft Low bed",
    "20 ft High bed"
  ];
  var selectedtrailer = -1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Select the Trailer Feet'),
        ),
        Wrap(children: [
          for (int index = 0; index < trailerfeet.length; index++)
            InkWell(
                onTap: () {
                  setState(() {
                    selectedtrailer = index;
                    if (selectedtrailer == 0) {
                       AddLoadDetailsPart.nxtisDisable = false;
                            widget.parentfunc(false);
                    }
                    if (selectedtrailer == 1) {
                       AddLoadDetailsPart.nxtisDisable = false;
                            widget.parentfunc(false);
                    }
                    if (selectedtrailer == 2) {
                       AddLoadDetailsPart.nxtisDisable = false;
                            widget.parentfunc(false);
                    }
                    if (selectedtrailer == 3) {
                       AddLoadDetailsPart.nxtisDisable = false;
                            widget.parentfunc(false);
                    }
                  });
                },
                child: Container(
                  decoration: selectedtrailer == index
                      ? const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(7.0)))
                      : const BoxDecoration(
                          color: Color.fromARGB(255, 245, 245, 245),
                          borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  margin: const EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 5, bottom: 5),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10, bottom: 10),
                    child: Text(trailerfeet[index],
                        style: selectedtrailer == index
                            ? const TextStyle(fontSize: 12, color: Colors.white)
                            : const TextStyle(fontSize: 12, color: Colors.black)),
                  ),
                )),
        ])
      ]),
    );
  }
}
