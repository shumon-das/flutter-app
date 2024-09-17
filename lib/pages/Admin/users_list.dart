import 'package:cloud_firestore/cloud_firestore.dart';
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
        title: const Text('Users List'),
        backgroundColor: Colors.lightBlue,
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

                  return ExpansionTileCard(
                      trailing: const Icon(Icons.person),
                      title: Text(user['name']),
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
                        const OverflowBar(
                          children: [
                            Icon(Icons.add),
                            Icon(Icons.add_a_photo),
                            Icon(Icons.add_alarm),
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
