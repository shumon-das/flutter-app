import 'package:flutter/material.dart';

import '../../main.dart';
import '../image_to_text.dart';
import 'add_new_book.dart';
import 'add_new_user.dart';
import 'users_list.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Section'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
              },
              icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            const SizedBox(width: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(
                          builder: (context) => const UsersList(),
                        ),
                    );
                  },
                  child: Container(
                    width: 180,
                    height: 100,
                    color: Colors.green,

                    child: Column(
                      children: [
                        Container(
                          width: 180,
                            color: Colors.lightGreenAccent,
                            child: const Center(
                                child: Text('Users', style: TextStyle(backgroundColor: Colors.lightGreenAccent))
                            ),
                        ),
                        const SizedBox(height: 10),
                        const Text('50', style: TextStyle(color: Colors.white, fontSize: 30),)
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: 180,
                    height: 100,
                    color: Colors.green,
                    child: const Text('Books'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 10),
                  Text('Add new user')
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddNewUser(userData: {},))
                );
              },
            ),
            const Divider(),
            ListTile(
              title: const Row(
                children: [
                  Icon(Icons.book),
                  SizedBox(width: 10),
                  Text('Add new book')
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddNewBook())
                );
              },
            ),
            const Divider(),
            ListTile(
              title: const Row(
                children: [
                  Icon(Icons.book),
                  SizedBox(width: 10),
                  Text('Upload Image')
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ImageToText())
                );
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
