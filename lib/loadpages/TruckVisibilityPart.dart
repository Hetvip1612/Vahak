import 'package:flutter/material.dart';
import 'package:vahak_clone/loadpages/PostLoadScreen.dart';

class TruckVisibolityPart extends StatefulWidget {
  const TruckVisibolityPart(this.parentfunc, {super.key});

  /// ToDo
  final parentFunctionCallback parentfunc;

  @override
  State<TruckVisibolityPart> createState() => _TruckVisibolityPartState();
}

class _TruckVisibolityPartState extends State<TruckVisibolityPart> {
  var trucklorry = ["Open Full Body", "Open Half Body"];
  var trucktype = [
    "6 Tyres",
    "10 Tyres",
    "12 Tyres",
    "14 Tyres",
    "20 Tyres",
    "22 Tyres"
  ];
  var truckfeet = ["16 ft", "19 ft", "22 ft"];

  int selectedlorry = 0;
  int selectedtyre = -1;
  int selectedtruckfeet = -1;

  bool fullbodyclic = false;
  bool halfbodyclic = false;
  bool sixtyreclic = false;
  bool othertyreclic = false;

  bool value = false;

  bool checkboxclic = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Select the Truck body'),
        ),
        SizedBox(
          height: 50,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 16,
              mainAxisExtent: 50,
            ),
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedlorry = index;
                    if (selectedlorry == 0) {
                      fullbodyclic = true;
                      halfbodyclic = false;
                    }
                    if (selectedlorry == 1) {
                      fullbodyclic = false;
                      halfbodyclic = true;
                    }
                  });
                },
                child: Container(
                  decoration: selectedlorry == index
                      ? const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(7.0)))
                      : const BoxDecoration(
                          color: Color.fromARGB(255, 245, 245, 245),
                          borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  margin: const EdgeInsets.all(8.0),
                  height: double.infinity,
                  width: double.infinity,
                  child: Center(
                    child: Text(trucklorry[index],
                        textAlign: TextAlign.center,
                        style: selectedlorry == index
                            ? const TextStyle(fontSize: 12, color: Colors.white)
                            : const TextStyle(
                                fontSize: 12, color: Colors.black)),
                  ),
                ),
              );
            }),
            itemCount: trucklorry.length,
          ),
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Checkbox(
                value: value,
                onChanged: ((boolvalue) {
                  setState(() {
                    value = boolvalue!;
                    if (value) {
                      checkboxclic = true;
                      AddLoadDetailsPart.nxtisDisable = true;

                      widget.parentfunc(true);
                    } else {
                      checkboxclic = false;
                      sixtyreclic = false;
                      AddLoadDetailsPart.nxtisDisable = false;
                      widget.parentfunc(false);
                    }
                  });
                })), //SizedBox
            const Text(
              'I want to have truck with definied tyres',
              style: TextStyle(fontSize: 12.0),
            ),
          ],
        ),
        Visibility(
          visible: checkboxclic,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Select Tyre'),
              ),
              SizedBox(
                height: 100,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisExtent: 50,
                    crossAxisSpacing: 1,
                    childAspectRatio: 114.0,
                  ),
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedtyre = index;
                          if (selectedtyre == 0) {
                            sixtyreclic = true;
                            othertyreclic = false;
                            AddLoadDetailsPart.nxtisDisable = false;
                            widget.parentfunc(false);
                          }
                          if (selectedtyre == 1) {
                            sixtyreclic = false;
                            othertyreclic = true;
                            AddLoadDetailsPart.nxtisDisable = false;
                            widget.parentfunc(false);
                          }
                          if (selectedtyre == 2) {
                            sixtyreclic = false;
                            othertyreclic = true;
                            AddLoadDetailsPart.nxtisDisable = false;
                            widget.parentfunc(false);
                          }
                          if (selectedtyre == 3) {
                            sixtyreclic = false;
                            othertyreclic = true;
                            AddLoadDetailsPart.nxtisDisable = false;
                            widget.parentfunc(false);
                          }
                          if (selectedtyre == 4) {
                            sixtyreclic = false;
                            othertyreclic = true;
                            AddLoadDetailsPart.nxtisDisable = false;
                            widget.parentfunc(false);
                          }
                          if (selectedtyre == 5) {
                            sixtyreclic = false;
                            othertyreclic = true;
                            AddLoadDetailsPart.nxtisDisable = false;
                            widget.parentfunc(false);
                          }
                        });
                      },
                      child: Container(
                        decoration: selectedtyre == index
                            ? const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7.0)))
                            : const BoxDecoration(
                                color: Color.fromARGB(255, 245, 245, 245),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7.0))),
                        margin: const EdgeInsets.all(8.0),
                        height: double.infinity,
                        width: double.infinity,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(trucktype[index],
                                textAlign: TextAlign.center,
                                style: selectedtyre == index
                                    ? const TextStyle(
                                        fontSize: 12, color: Colors.white)
                                    : const TextStyle(
                                        fontSize: 12, color: Colors.black)),
                          ),
                        ),
                      ),
                    );
                  }),
                  itemCount: trucktype.length,
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: sixtyreclic,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Select the Truck Feet'),
              ),
              SizedBox(
                height: 50,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6, mainAxisExtent: 45),
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedtruckfeet = index;
                          if (selectedtruckfeet == 0) {}
                          if (selectedtruckfeet == 1) {}
                          if (selectedtruckfeet == 2) {}
                        });
                      },
                      child: Container(
                        decoration: selectedtruckfeet == index
                            ? const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7.0)))
                            : const BoxDecoration(
                                color: Color.fromARGB(255, 245, 245, 245),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7.0))),
                        margin: const EdgeInsets.all(8.0),
                        height: double.infinity,
                        width: double.infinity,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(truckfeet[index],
                                textAlign: TextAlign.center,
                                style: selectedtruckfeet == index
                                    ? const TextStyle(
                                        fontSize: 12, color: Colors.white)
                                    : const TextStyle(
                                        fontSize: 12, color: Colors.black)),
                          ),
                        ),
                      ),
                    );
                  }),
                  itemCount: truckfeet.length,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
