import 'package:flutter/material.dart';

import 'PostLoadScreen.dart';

class HvyaVisibilityPart extends StatefulWidget {
  const HvyaVisibilityPart(this.parentfunc, {super.key});

  /// ToDo
  final parentFunctionCallback parentfunc;

  @override
  State<HvyaVisibilityPart> createState() => _HvyaVisibilityPartState();
}

class _HvyaVisibilityPartState extends State<HvyaVisibilityPart> {
     var trucktyre = [ "10 Tyres","12 Tyres", "14 Tyres"];
     
       int selectedtyre=-1;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                              AddLoadDetailsPart.nxtisDisable = false;
                      widget.parentfunc(false);
                           
                          }
                          if (selectedtyre == 1) {
                               AddLoadDetailsPart.nxtisDisable = false;
                      widget.parentfunc(false);
                           
                          }
                           if (selectedtyre == 2) {
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
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Text(trucktyre[index],
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
                  itemCount: trucktyre.length,
                ),
              ),
      ],
    );
  }
}