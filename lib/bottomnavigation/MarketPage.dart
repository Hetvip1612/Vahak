import 'package:flutter/material.dart';
import 'package:vahak_clone/marketpages/MarketLoadPage.dart';
import 'package:vahak_clone/marketpages/MarketLorryPage.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({super.key});

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 0, length: 2);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade100,
          flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                TabBar(
                    controller: _tabController,
                    labelColor: const Color.fromARGB(255, 14, 100, 230),
                    unselectedLabelColor: const Color.fromARGB(255, 92, 92, 92),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(
                            width: 1.6,
                            color: Color.fromARGB(255, 14, 100, 230)),
                        insets: EdgeInsets.symmetric(horizontal: 25)),
                    tabs: [
                      Tab(
                          child: Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ImageIcon(
                                  const AssetImage('assets/images/load.png'),
                                  size: 18,
                                  color: _tabController.index == 0
                                      ? const Color.fromARGB(255, 14, 100, 230)
                                      : const Color.fromARGB(255, 92, 92, 92)),
                              const SizedBox(width: 8),
                              const Text('Load Market'),
                            ]),
                      )),
                      Tab(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            ImageIcon(
                                const AssetImage('assets/images/lorry.png'),
                                size: 22,
                                color: _tabController.index == 1
                                    ? const Color.fromARGB(255, 14, 100, 230)
                                    : const Color.fromARGB(255, 92, 92, 92)),
                            const SizedBox(width: 8),
                            const Text('Lorry Market'),
                          ]))
                    ])
              ]),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: const [
            MarketLoadPage(), 
          MarketLorryPage()],
        ),
      ),
    );
  }
}
