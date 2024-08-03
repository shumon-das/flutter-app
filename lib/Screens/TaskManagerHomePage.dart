
import 'package:flutter/material.dart';
import 'package:practice/widgets/constant.dart';

class TaskManagerHomePage extends StatefulWidget {
  const TaskManagerHomePage({super.key});

  @override
  State<TaskManagerHomePage> createState() => _TaskManagerHomePageState();
}

class _TaskManagerHomePageState extends State<TaskManagerHomePage> {
  int activeIndex = 0;

  static const widgetList = <Widget>[
    Text("Home"),
    Text("Medium"),
    Text("Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Center(
        child: widgetList[activeIndex],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            currentIndex: activeIndex,
            backgroundColor: Colors.indigo,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.message),
                  label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: 'Medium',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: 'Profile',
              ),
            ],
            onTap: (index) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    backgroundColor: Colors.blue,
    elevation: 2,
    title: Row(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 10, right: 5),
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset('assets/images/flower.jpg'),
          ),
        ),
        const SizedBox(width: 20),
        const Text(
          'Hello, SomeOne',
          style: TextStyle(color: Colors.white70, fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    ),
    actions: <Widget>[
      IconButton(
          onPressed: () {
            print('actions');
          },
          icon: const Icon(Icons.more_vert, color: Colors.white70, size: 35,)
      ),
    ],
  );
}