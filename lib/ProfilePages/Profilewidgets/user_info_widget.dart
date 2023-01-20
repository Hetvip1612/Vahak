import 'package:flutter/material.dart';

Container buildUserInfo(company_name, user_roll, location) {
  return Container(
    child: ListTile(
      title: Row(
        children: [
          Text(
            company_name,
            // company_name!=null
            // ?company_name
            // :("Company Name"),
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
          SizedBox(
            width: 8,
          ),
          // InkWell(
          //   onTap: () {},
          //   child: Text(
          //     "Follow",
          //     style: TextStyle(color: Colors.blue, fontSize: 12),
          //   ),
          // ),
        ],
      ),
      subtitle: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                // Icon(
                //   Icons.home,
                //   color: Colors.grey.shade400,
                // ),
                Padding(padding: EdgeInsets.only(top:10),child:   Text(
                  user_roll,
                  style: TextStyle(fontSize: 13,color: Colors.black),
                ),)
              ,
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                // Icon(
                //   Icons.person,
                //   color: Colors.grey.shade400,
                // ),
                Padding(padding: EdgeInsets.only(top:5),child:   Text(
                location,
                  style: TextStyle(fontSize: 15,color: Colors.grey),
                ),),
              ],
            ),
          ),

          Padding(padding:EdgeInsets.only(top: 15),
          child: Card(
             shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          )
          ,
          
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
                )
                ,borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
                    Align(
                    //  alignment: Alignment.centerLeft,
                      child: Padding(padding: 
                      EdgeInsets.only(left: 20,top: 20),child: 
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(children: [
                          const Text("Complete your kyc and become ",
                          style: TextStyle(fontSize: 18),),
                        
                       
                        ]),
                      )),
                      
                    ),
                      Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20,top: 15.0),
                              child: RichText(text: const TextSpan(style: TextStyle(color: Colors.black,fontSize: 15.0),
                              children: [
                                TextSpan(text: "a "),
                                TextSpan(text: " VERIFIED BUSINESS",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold))
                              ])),
                            ),
                          ),
                           Align(
                            alignment: Alignment.centerLeft,
                             child: Padding(
                              padding: EdgeInsets.only(left: 20,top: 15),
                               child: ConstrainedBox(
                                constraints:
                                    BoxConstraints.tightFor(width: 150, height: 40),
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
                                   
                             
                                  },
                                  child: Align(alignment: Alignment.centerLeft,
                                    child: Text("Proceed KYC >>".toUpperCase())),
                                ),
                                                       ),
                             ),
                           )
              ],
            ),
          ),
         
        
          ),)
          
        ],
      ),
    ),
  );
}



