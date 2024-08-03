
import 'package:flutter/material.dart';
import '../appBarWidgets/buildAppBar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<StatefulWidget> createState() =>_HomePageState();
}

class _HomePageState extends State<Homepage> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: const Center(child: Text('Home Page'),),
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          currentIndex: activeIndex,
          backgroundColor: Colors.grey,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.indigo,
          items: const [
            BottomNavigationBarItem(
              label: 'A',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'B',
              icon: Icon(Icons.trending_flat),
            ),
          ],
          onTap: (index) {
            setState(() {
              activeIndex = index;
            });
          },
        ),
      ),
    );
  }
}