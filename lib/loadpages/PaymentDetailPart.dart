import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentDetailPart extends StatefulWidget {
  const PaymentDetailPart(
      {required this.pickedtxt,
      required this.droppedtxt,
      required this.materialedtxt,
      required this.quanttxt,
      super.key});

  final String pickedtxt;
  final String droppedtxt;
  final String materialedtxt;
  final String quanttxt;

  @override
  State<PaymentDetailPart> createState() => _PaymentDetailPartState();
}

class _PaymentDetailPartState extends State<PaymentDetailPart> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
            child: Column(
              children: [
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //========================add new load========================

                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            children: [
                              InkWell(
                                child: const FaIcon(FontAwesomeIcons.xmark),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              const SizedBox(width: 20),
                              const Text(
                                'Add New Load',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      //========================load details========================

                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: SizedBox(
                          height: 150,
                          child: Card(
                            color: Colors.grey.shade100,
                            elevation: 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 15.0,
                                      bottom: 10.0,
                                      left: 10,
                                      right: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: const Padding(
                                    padding: EdgeInsets.only(
                                        top: 5.0,
                                        bottom: 5.0,
                                        left: 8,
                                        right: 8),
                                    child: Text(
                                      '1',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.only(
                                            top: 18.0,
                                            bottom: 10.0,
                                            left: 10,
                                            right: 10),
                                        child: Text(
                                          'Load Details',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey.shade700),
                                        )),
                                    Container(
                                        margin: const EdgeInsets.only(
                                            top: 5.0, left: 10, right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Icon(Icons.circle, size: 8),
                                            const SizedBox(width: 5),
                                            Text(
                                              widget.pickedtxt.toString(),
                                              style: const TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        )),
                                    Container(
                                        margin: const EdgeInsets.only(
                                            left: 13, right: 10),
                                        width: 1.5,
                                        color: Colors.black,
                                        height: 10),
                                    Container(
                                        margin: const EdgeInsets.only(
                                            bottom: 10.0, left: 10, right: 10),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.rectangle,
                                                size: 9),
                                            const SizedBox(width: 5),
                                            Text(
                                              widget.droppedtxt.toString(),
                                              style: const TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        )),
                                    Container(
                                        margin: const EdgeInsets.only(
                                            bottom: 10.0, left: 10, right: 10),
                                        child: Row(
                                          children: [
                                            Text(
                                              widget.materialedtxt.toString(),
                                              style: const TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.black),
                                            ),
                                            const Text('-'),
                                            Text(
                                              widget.quanttxt.toString(),
                                              style: const TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        top: 20.0,
                                        bottom: 10.0,
                                        left: 10,
                                        right: 10),
                                    child: const Text(
                                      'Edit',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w800,
                                          color: Color.fromARGB(
                                              255, 14, 100, 230)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

//========================vehicle details========================
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: SizedBox(
                          height: 100,
                          child: Card(
                            color: Colors.grey.shade100,
                            elevation: 5,
                            child: Center(
                              child: Row(

                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 15.0,
                                        bottom: 10.0,
                                        left: 10,
                                        right: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: const Padding(
                                      padding: EdgeInsets.only(
                                          top: 5.0,
                                          bottom: 5.0,
                                          left: 8,
                                          right: 8),
                                      child: Text(
                                        '2',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          margin: const EdgeInsets.only(
                                              top: 18.0,
                                              bottom: 10.0,
                                              left: 10,
                                              right: 10),
                                          child: Text(
                                            'Vehicle Type',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey.shade700),
                                          )),
                                      Container(
                                          margin: const EdgeInsets.only(
                                             left: 10, right: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                widget.pickedtxt.toString(),
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black),
                                              ),
                                              const SizedBox(width: 5),
                                              const Text(
                                                '-',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black),
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                widget.droppedtxt.toString(),
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 20.0,
                                          bottom: 10.0,
                                          left: 10,
                                          right: 10),
                                      child: const Text(
                                        'Edit',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w800,
                                            color: Color.fromARGB(
                                                255, 14, 100, 230)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),



                      //===================payment details====================================
                       Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Card(
                                color: Colors.grey.shade100,
                                elevation: 5,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            top: 10.0,
                                            bottom: 10.0,
                                            left: 10,
                                            right: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: const Padding(
                                          padding: EdgeInsets.only(
                                              top: 5.0,
                                              bottom: 5.0,
                                              left: 8,
                                              right: 8),
                                          child: Text(
                                            '3',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                margin: const EdgeInsets.only(
                                                    top: 13.0,
                                                    bottom: 10.0,
                                                    left: 10,
                                                    right: 10),
                                                child: Text(
                                                  'Payment Details',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color:
                                                          Colors.grey.shade700),
                                                          
                                                )),
                                          ])
                                    ])),
                          ),
                    ],
                  ),
                ))
              ],
            ),
          ))),
    );
  }
}
