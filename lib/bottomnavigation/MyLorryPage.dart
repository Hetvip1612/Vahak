import 'package:flutter/material.dart';
import '/lorrypages/LorryListingpage.dart';
import '/lorrypages/LorrybidsPage.dart';

class MyLorryPage extends StatelessWidget {
  const MyLorryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue.shade100,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const TabBar(
                    labelColor: Color.fromARGB(255, 14, 100, 230),
                    unselectedLabelColor: Color.fromARGB(255, 92, 92, 92),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(
                            width: 1.6,
                            color: Color.fromARGB(255, 14, 100, 230)),
                        insets: EdgeInsets.symmetric(horizontal: 5)),
                    tabs: [Tab(text: 'Lorry Listing'), Tab(text: 'My Bids')])
              ],
            ),
          ),
          body: const TabBarView(
                    physics: NeverScrollableScrollPhysics(),

            children: [LorryListingPage(), LorrybidsPage()],
          )),
    );
  }
}
