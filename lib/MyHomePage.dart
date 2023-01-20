import 'package:flutter/material.dart';
import 'package:vahak_clone/ProfilePages/MyProfile.dart';
import 'package:vahak_clone/Setting/Settingpage.dart';
import 'bottomnavigation/MarketPage.dart';
import 'bottomnavigation/MyLoadPage.dart';
import 'bottomnavigation/MyLorryPage.dart';
import 'bottomnavigation/NetworkPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

 bool ActiveConnection = false;
  String T = "";



  late TabController controller;
  int _selectedItem = 0;
  final _pageData = const [
    MyLoadPage(),
    MyLorryPage(),
    MarketPage(),
    NetworkPage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // ignore: prefer_const_literals_to_create_immutables
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                                Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MyProfile()));
                            },
                            child: const Padding(
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
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Text(
                                  "Username",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                const Text("not verified",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 12)),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.headphones),
                                color: Colors.black,
                                onPressed: (() {}),
                              ),
                              IconButton(
                                icon: const Icon(Icons.notifications),
                                color: Colors.black,
                                onPressed: (() {}),
                              ),
                              IconButton(
                                icon: const Icon(Icons.menu),
                                color: Colors.black,
                                onPressed: (() {
                                   Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SettingPage()));


                                }),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.grey.shade500,
                      height: 1.8,
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: _pageData[_selectedItem],
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon:
                      ImageIcon(AssetImage('assets/images/load.png'), size: 16),
                  label: "My Load"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/lorry.png'),
                      size: 20),
                  label: "My Lorry"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/market.png'),
                      size: 16),
                  label: "Market"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/network.png'),
                      size: 16),
                  label: "Network"),
            ],
            currentIndex: _selectedItem,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.blueGrey,
            selectedItemColor: const Color.fromARGB(255, 14, 100, 230),
            selectedFontSize: 13,
            unselectedFontSize: 12,
            onTap: _onItemTapped,
          ),
        ));
  }

  void _onItemTapped(int setvalue) {
    setState(() {
      _selectedItem = setvalue;
    });
  }
}
