import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // ignore: prefer_const_literals_to_create_immutables
              SizedBox(
                width: double.infinity,
                height: 60,
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: CircleAvatar(
                            backgroundColor:
                                Color.fromARGB(255, 193, 223, 233),
                            radius: 30,
                            child: Icon(
                              Icons.person,
                              color: Color.fromARGB(255, 99, 142, 170),
                            ),
                          )),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            "Menu",
                            style:
                                TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.grey.shade400,
                height: 1.8,
              ),

              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    child: Column(children: [
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Card(
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(50),
                           ),
                           child: Container(
                             width: 450,
                             height: 150,
                             decoration: BoxDecoration(
                                 gradient: LinearGradient(
                                   colors: [
                                     Colors.orangeAccent,
                                     // Colors.orangeAccent,
                                     Colors.yellow.shade100,
                                   ],
                                   begin: Alignment.topLeft,
                                   end: Alignment.bottomRight,
                                 ),
                                 borderRadius: BorderRadius.all(Radius.circular(10))),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Align(
                                   //  alignment: Alignment.centerLeft,
                                   child: Padding(
                                       padding: EdgeInsets.only(left: 20, top: 20),
                                       child: Align(
                                         alignment: Alignment.centerLeft,
                                         child: Column(children: [
                                           const Text(
                                             "Complete your kyc and become ",
                                             style: TextStyle(fontSize: 18),
                                           ),
                                         ]),
                                       )),
                                 ),
                                 Align(
                                   alignment: Alignment.centerLeft,
                                   child: Padding(
                                     padding: EdgeInsets.only(left: 20, top: 15.0),
                                     child: RichText(
                                         text: const TextSpan(
                                             style: TextStyle(
                                                 color: Colors.black, fontSize: 15.0),
                                             children: [
                                           TextSpan(text: "a "),
                                           TextSpan(
                                               text: " VERIFIED BUSINESS",
                                               style: TextStyle(
                                                   color: Colors.black,
                                                   fontWeight: FontWeight.bold))
                                         ])),
                                   ),
                                 ),
                                 Align(
                                   alignment: Alignment.centerLeft,
                                   child: Padding(
                                     padding: EdgeInsets.only(left: 20, top: 15),
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
                                         onPressed: () async {},
                                         child: Align(
                                             alignment: Alignment.centerLeft,
                                             child:
                                                 Text("Proceed KYC >>".toUpperCase())),
                                       ),
                                     ),
                                   ),
                                 )
                               ],
                             ),
                           ),
                         ),
                       ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                              width: 45,
                              height: 45,
                              child: Image.asset(
                                "assets/images/help.png",
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Help Guide",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    "A help guide for you to get loads & lorries",
                                    style: TextStyle(
                                        color: Colors.grey.shade500, fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        width: double.infinity,
                        color: Colors.grey.shade300,
                        height: 1.8,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                              width: 45,
                              height: 45,
                              child: Image.asset(
                                "assets/images/setting_page.png",
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Settings",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    "Fine tune your Vahak experience",
                                    style: TextStyle(
                                        color: Colors.grey.shade500, fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        width: double.infinity,
                        color: Colors.grey.shade300,
                        height: 1.8,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                              width: 45,
                              height: 45,
                              child: Image.asset(
                                "assets/images/star.png",
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Rate us on Play Store",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    "We would love to here from you",
                                    style: TextStyle(
                                        color: Colors.grey.shade500, fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        width: double.infinity,
                        color: Colors.grey.shade300,
                        height: 1.8,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                              width: 45,
                              height: 45,
                              child: Image.asset(
                                "assets/images/bullhorn.png",
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Refer a Friend",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    "Invite your friends through Facebook/Whatsapp",
                                    style: TextStyle(
                                        color: Colors.grey.shade500, fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        width: double.infinity,
                        color: Colors.grey.shade300,
                        height: 1.8,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                              width: 45,
                              height: 45,
                              child: Image.asset(
                                "assets/images/folder.png",
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Terms & Conditions",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    "Read what you've signed",
                                    style: TextStyle(
                                        color: Colors.grey.shade500, fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        width: double.infinity,
                        color: Colors.grey.shade300,
                        height: 1.8,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                              width: 45,
                              height: 45,
                              child: Image.asset(
                                "assets/images/privacy.png",
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Privacy Policy",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    "Compliance and regulations",
                                    style: TextStyle(
                                        color: Colors.grey.shade500, fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        width: double.infinity,
                        color: Colors.grey.shade300,
                        height: 1.8,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                              width: 45,
                              height: 45,
                              child: Image.asset(
                                "assets/images/operator.png",
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Contact us",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    "Facing an issue?We're there to help you",
                                    style: TextStyle(
                                        color: Colors.grey.shade500, fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        width: double.infinity,
                        color: Colors.grey.shade300,
                        height: 1.8,
                      ),
                    )
                    ],),
                  ),
                ),
              )
             
            ],
          ),
        ),
      ),
    );
  }
}
