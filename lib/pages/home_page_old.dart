import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/services/firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePageOld extends StatefulWidget {
  const HomePageOld({super.key});

  @override
  State<HomePageOld> createState() => _HomePageOldState();
}

class _HomePageOldState extends State<HomePageOld> {
  final FirestoreSerivce firestoreSerivce = FirestoreSerivce();

  final TextEditingController textController = TextEditingController();
  void openBox({String? docId}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: TextField(
            controller: textController,
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  if (docId == null) {
                    // add a new data
                    firestoreSerivce.addData(textController.text);
                  } else {
                    firestoreSerivce.updateData(docId, textController.text);
                  }
                  // clear text field
                  textController.clear();

                  // close the dialog
                  Navigator.pop(context);
                },
                child: Text('Add'),
            ),
          ],
        ),
    );
  }


  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> resumeData = {};
    resumeData['address'] = 'ajmiriganj, habiganj';
    resumeData['contact'] = '017490000';
    resumeData['description'] = 'i am developer.';
    resumeData['education'] = 'i have no degree';
    resumeData['job-seeker-id'] = '1';
    resumeData['name'] = 'shumon babu';
    resumeData['skills'] = 'php, javascript, flutter';

    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openBox,
        child: Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: firestoreSerivce.getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List dataList = snapshot.data!.docs;

              return ListView.builder(
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot document = dataList[index];
                    String docId = document.id;

                    Map<String, dynamic> value = document.data() as Map<String, dynamic>;
                    String name = value['name'];
                    Timestamp createdAt = value['createdAt'];
                    DateTime createdDate = createdAt.toDate();

                    return ListTile(
                      title: Text(name),
                      subtitle: Text(DateFormat('MMMM dd, yyyy').format(createdDate)),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () => openBox(docId: docId),
                                icon: Icon(Icons.edit)
                            ),
                            IconButton(
                                // onPressed: () => firestoreSerivce.deleteData(docId),
                                onPressed: () => firestoreSerivce.addResume(resumeData),
                                icon: Icon(Icons.delete)
                            ),
                            // DigitalClock(datetime: createdAt)
                          ],
                        ),
                      ),
                    );
                  },
              );
            } else {
              return const Text('No Data');
            }
          },
      ),
    );
  }
}
