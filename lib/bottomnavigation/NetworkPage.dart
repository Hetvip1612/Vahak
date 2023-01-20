import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vahak_clone/Api/Api.dart';
import 'package:http/http.dart' as http;
import 'package:vahak_clone/NetworkPage/NetWork_list.dart';

// class NetworkPage extends StatelessWidget{
//   const NetworkPage({super.key});

//   @override
//   Widget build(BuildContext context) {

//     return const Scaffold(
//       body: Center(child: Text("Network Page")),
//     );
//   }

// }
List<NetWorkList> netwirk_list = [];
List<Role>role_list = [];
List<String> role_name=[];
class NetworkPage extends StatefulWidget {
  const NetworkPage({super.key});

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  Future getPostLoadList(BuildContext context) async {
    //load_list = [];
    //getPostLoadList(context);
    Map<String, String> headers = {
      // "Authorization":"Bearer $token",
      // "Content-type": "multipart/form-data"
      'Content-Type': 'application/json',
      'authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzAzOTE2MjcwLCJpYXQiOjE2NzIzODAyNzAsImp0aSI6ImI5ZjVmZmVmYTcxNDQzZTA5ZWVjYTU2ZjcwYjQyNTJkIiwidXNlcl9pZCI6MX0.-IQkBaqBfGe0ihI6B7XMpvEX04V0-mvghu2twj5Ucug'
    };

    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.network_list);
    var response = await http.get(url, headers: headers);
    print(response.body);
    var jsonData = jsonDecode(response.body);

    List data = jsonData;
    for (var items in data) {
      netwirk_list.add(NetWorkList.fromJson(items));
    }

   // print(data);
    List datas = jsonData["role"];
    print(netwirk_list);
//  for (var items in datas) {
//       role_list.add(Role.fromJson(items));
//     }
// for(int i = 0;i<role_list.length;i++){
//   role_name.add(role_list[i].name);
// }
//     print(role_list);

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    netwirk_list = [];
    role_list=[];
    getPostLoadList(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          //shrinkWrap: true,
         // physics: const NeverScrollableScrollPhysics(),
          itemCount: netwirk_list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                  //height: 100,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                                    width: 50,
                                                    child: CircleAvatar(
                                                      
                                                      backgroundColor:
                                                          Colors.grey,
                                                      backgroundImage:NetworkImage(
                                            netwirk_list[index]
                                                .profileImage
                                                .toString(),
                                            )
                                                          // Image.network(
                                                          //   errorbu
                                                          //         //'http://192.168.1.22:8008' +
                                                          //         marketLorryList[
                                                          //                 index]
                                                          //             .profileImage)
                                                              as ImageProvider,
                                                    ),
                                                  ),
                            Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(netwirk_list[index].username,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                            Padding(
                              padding: const EdgeInsets.only(top:8.0),
                              child: Text(netwirk_list[index].currentLocation),
                             // child: Text(role_name[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                            ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ConstrainedBox(
              constraints:
                  const BoxConstraints.tightFor(width: double.infinity, height: 35),
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(shape: const StadiumBorder()),
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: ((context) {
                  //   return const PostLoadScreen();
                  // })
                  // )
                  // );
                },
                child: const Text('+ Connect'),
              ),
            ),
                      )
                    ],
                  )),
            );
          }),
    );
  }
}
