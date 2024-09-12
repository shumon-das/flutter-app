import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreSerivce {
  final CollectionReference data = FirebaseFirestore.instance.collection('test');
  // CREATE
  Future<void> addData(String value) {
    return data.add({
      'name': value,
      'createdAt': DateTime.now(),
    });
  }

  // READ
  Stream<QuerySnapshot> getData() {
    final dataStream = data.orderBy('createdAt', descending: true).snapshots();
    return dataStream;
  }

  // UPDATE
  Future<void> updateData(String docId, String newValue) {
    return data.doc(docId).update({
      'name': newValue,
      'createdAt': DateTime.now(),
    });
  }

  // DELETE
  Future<void> deleteData(String docId) {
    return data.doc(docId).delete();
  }

  final CollectionReference resume = FirebaseFirestore.instance.collection('resume');
  Future<void> addResume(Map<String, dynamic> values) {
    return resume.add({
      'address': values['address'],
      'contact': values['contact'],
      'createdAt': Timestamp.now(),
      'description': values['description'],
      'education': values['education'],
      'job-seeker-id': values['job-seeker-id'],
      'name': values['name'],
      'skills': values['skills'],
    });
  }
}