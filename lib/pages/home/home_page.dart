import 'package:flutter/material.dart';

import 'categories/aphorism.dart';
import 'categories/jokes.dart';
import 'categories/natok.dart';
import 'categories/novel.dart';
import 'categories/poem.dart';
import 'categories/songs.dart';
import 'categories/stories.dart';
import 'categories/thesis.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List homePages = [
    {'title': 'গল্প', 'page': const Stories()},
    {'title': 'কবিতা', 'page': const Poem()},
    {'title': 'কৌতুক', 'page': const Jokes()},
    {'title': 'প্রবন্ধ', 'page': const Thesis()},
    {'title': 'উপন্যাস', 'page': const Novel()},
    {'title': 'উক্তি', 'page': const Aphorism()},
    {'title': 'নাটক', 'page': const Natok()},
    {'title': 'গান', 'page': const Songs()},
  ];

  static int? selectedChip = 0;

  final controller = PageController(initialPage: selectedChip ?? 0);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: homePages.length,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: TabBar(
                isScrollable: true,
                tabs: List.generate(homePages.length, (int index) {
                  return Tab(text: homePages[index]['title']);
                }),
              ),
          ),
          body: TabBarView(
              children: List.generate(homePages.length, (int index) {
                return homePages[index]['page'];
              }),
          ),
        ),
    );
  }
}
