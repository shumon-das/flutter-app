import 'package:flutter/material.dart';

import '../../common/home_pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: HomeData.homePages.length,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: TabBar(
                isScrollable: true,
                tabs: List.generate(HomeData.homePages.length, (int index) {
                  return Tab(text: HomeData.homePages[index]['title']);
                }),
              ),
          ),
          body: TabBarView(
              children: List.generate(HomeData.homePages.length, (int index) {
                return HomeData.homePages[index]['page'];
              }),
          ),
        ),
    );
  }
}
