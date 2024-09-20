import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/common/search_page.dart';
import 'package:crud/pages/Admin/add_new_user.dart';
import 'package:crud/services/firestore.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  FirestoreSerivce firestoreSerivce = FirestoreSerivce();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const AddNewUser(userData: {},))
              );
            },
            icon: const Icon(Icons.add)
        ),
        title:const Text('Users List'),
        backgroundColor: Colors.lightBlue,
        actions: [
          IconButton(
            style: IconButton.styleFrom(
              foregroundColor: Colors.white
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const SearchPage())
              );
            },
            icon: const Icon(Icons.search)
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: firestoreSerivce.getUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List users = snapshot.data!.docs;

              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot document = users[index];
                  String docId = document.id;
                  Map<String, dynamic> user = document.data() as Map<String, dynamic>;
                  Timestamp createdAt = user['createdAt'];
                  DateTime created = createdAt.toDate();
                  // String? userImage = user['image'];

                  return ExpansionTileCard(
                      trailing: IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => AddNewUser(userData: user))
                            );
                          },
                          icon: const Icon(Icons.edit)
                      ),
                      title: Row(
                        children: [
                          // ClipRRect(
                          //   borderRadius: BorderRadius.circular(50.0),
                          //   child: Image.network(
                          //     user['image'],
                          //     errorBuilder: (context, error, stackTrace) => Image.asset(
                          //       'assets/images/default-user-icon.png', width: 50, height: 50,
                          //     ),
                          //     width: 50,
                          //     height: 50,
                          //   ),
                          // ),
                          // const SizedBox(width: 10),
                          Text(user['name']),
                        ],
                      ),
                      subtitle: Text(
                        user['role'],
                        style: const TextStyle(
                            fontSize: 12, fontStyle: FontStyle.italic
                        ),
                      ),
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 20),
                            const Text('Desc: '),
                            const SizedBox(width: 5),
                            Text(user['description'] ?? '-'),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 20),
                            const Text('Email: '),
                            const SizedBox(width: 5),
                            Text(user['email'] ?? 'email'),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 20),
                            const Text('Contact: '),
                            const SizedBox(width: 5),
                            Text(user['contact'] ?? 'contact'),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 20),
                            const Text('Created: '),
                            const SizedBox(width: 5),
                            Text(DateFormat('MMMM dd, yyyy').format(created)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        OverflowBar(
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 25),
                                const Icon(Icons.people_alt_outlined),
                                const SizedBox(width: 5),
                                const Text('Followers: '),
                                Text('${user['followers'].length}'),

                                const SizedBox(width: 20),
                                const Icon(Icons.add_box_sharp),
                                const SizedBox(width: 5),
                                const Text('Writes: '),
                                Text('${user['writes'].length}'),

                                const SizedBox(width: 20),
                                const Icon(Icons.read_more),
                                const SizedBox(width: 5),
                                const Text('Reads: '),
                                Text('${user['reads'].length}'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    );
                },
              );
            }
            else {
              return const Text('No users found');
            }
          },
      ),
    );
  }
}
