// ignore: file_names
import 'package:flutter/material.dart';

// class LoadBidsPage extends StatelessWidget {
//   const LoadBidsPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     bool all_click = false;
//     bool sent_click = false;
//     bool recieved_click = false;

//     return Scaffold(
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(18.0),
//             child: Row(
//               children: [
//                 Text('Bids:',
//                     style: TextStyle(
//                         color: Colors.blue.shade900,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15)),
//                 InkWell(
//                   onTap: () {

//                     all_click=true;
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 8.0),
//                     child: Container(
//                         width: 50,
//                         decoration: BoxDecoration(
//                             color: all_click
//                                 ? Color.fromARGB(255, 7, 36, 59)
//                                 : Colors.grey.shade200,
//                             borderRadius: BorderRadius.all(Radius.circular(5.0))),
//                         child: Center(
//                           child: Align(
//                             alignment: Alignment.center,
//                             child: Container(
//                               margin: EdgeInsets.all(5),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Column(
//                                       children: [
//                                         new Text(
//                                           "All",
//                                           style: TextStyle(
//                                               fontSize: 12,
//                                               color:all_click?
//                                                Colors.white:Colors.black),
//                                           textAlign: TextAlign.center,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         )),
//                   ),
//                 ),
//                  Padding(
//                   padding: const EdgeInsets.only(left: 8.0),
//                   child: Container(
//                       width: 80,
//                       decoration: BoxDecoration(
//                          color: sent_click
//                               ? Color.fromARGB(255, 7, 36, 59)
//                               : Colors.grey.shade200,
//                           borderRadius: BorderRadius.all(Radius.circular(5.0))),
//                       child: Center(
//                         child: Align(
//                           alignment: Alignment.center,
//                           child: Container(
//                             margin: EdgeInsets.all(5),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Column(
//                                     children: [
//                                       new Text(
//                                         "Sent",
//                                          style: TextStyle(
//                                             fontSize: 12,
//                                             color:sent_click?
//                                              Colors.white:Colors.black)
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       )),
//                 ),
//                  Padding(
//                   padding: const EdgeInsets.only(left: 8.0),
//                   child: Container(
//                       width: 100,
//                       decoration: BoxDecoration(
//                           color: recieved_click
//                               ? Color.fromARGB(255, 7, 36, 59)
//                               : Colors.grey.shade200,
//                           borderRadius: BorderRadius.all(Radius.circular(5.0))),
//                       child: Center(
//                         child: Align(
//                           alignment: Alignment.center,
//                           child: Container(
//                             margin: EdgeInsets.all(5),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Column(
//                                     children: [
//                                       new Text(
//                                         "Recived",
//                                         style: TextStyle(
//                                             fontSize: 12,
//                                             color:recieved_click?
//                                              Colors.white:Colors.black)
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       )),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class LoadbidsPage extends StatefulWidget {
  const LoadbidsPage({super.key});

  @override
  State<LoadbidsPage> createState() => _LoadbidsPageState();
}

class _LoadbidsPageState extends State<LoadbidsPage> {
  bool all_click = false;
  bool sent_click = false;
  bool recieved_click = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Text('Bids:',
                    style: TextStyle(
                        color: Colors.blue.shade900,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
                InkWell(
                  onTap: () {
                    setState(() {
                      all_click = true;
                      sent_click = false;
                      recieved_click = false;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                        width: 50,
                        decoration: BoxDecoration(
                            color: all_click
                                ? Color.fromARGB(255, 7, 36, 59)
                                : Colors.grey.shade200,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        child: Center(
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        new Text(
                                          "All",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: all_click
                                                  ? Colors.white
                                                  : Colors.black),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      all_click = false;
                      sent_click = true;
                      recieved_click = false;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                        width: 80,
                        decoration: BoxDecoration(
                            color: sent_click
                                ? Color.fromARGB(255, 7, 36, 59)
                                : Colors.grey.shade200,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        child: Center(
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        new Text("Sent",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: sent_click
                                                    ? Colors.white
                                                    : Colors.black)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      all_click = false;
                      sent_click = false;
                      recieved_click = true;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                            color: recieved_click
                                ? Color.fromARGB(255, 7, 36, 59)
                                : Colors.grey.shade200,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        child: Center(
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        new Text("Recived",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: recieved_click
                                                    ? Colors.white
                                                    : Colors.black)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                  ),
                )
              ],
            ),
          ),
          BidsList()
        ],
      ),
    );
  }
}
class BidsList extends StatefulWidget {
  const BidsList({super.key});

  @override
  State<BidsList> createState() => _BidsListState();
}

class _BidsListState extends State<BidsList> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}