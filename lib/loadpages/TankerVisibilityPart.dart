import 'package:flutter/material.dart';

class TankerVisibilityPart extends StatefulWidget {
  const TankerVisibilityPart({super.key});

  @override
  State<TankerVisibilityPart> createState() => _TankerVisibilityPartState();
}

class _TankerVisibilityPartState extends State<TankerVisibilityPart> {
  var tankerbody = ["Metal steel", "Stainless steel"];
  var selectedtanker = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Select the Tanker body'),
          ),
          Wrap(
            children: [
            for (int index = 0; index < tankerbody.length; index++)
              InkWell(
                  onTap: () {
                    setState(() {
                      selectedtanker = index;
                      if (selectedtanker == 0) {}
                      if (selectedtanker == 1) {}
                     
                    });
                  },
                  child: Container(
                    decoration: selectedtanker == index
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
                      child: Text(tankerbody[index],
                          style: selectedtanker == index
                              ? const TextStyle(fontSize: 12, color: Colors.white)
                              : const TextStyle(
                                  fontSize: 12, color: Colors.black)),
                    ),
                  )),
          ])
        ],
      ),
    );
  }
}
