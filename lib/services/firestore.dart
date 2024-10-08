import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/models/user_model.dart';

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

  final CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future addUser(UserModel userModel) async {
    return users.add({
      'name': userModel.getName,
      'email': userModel.getEmail,
      'contact': userModel.getContact,
      'password': userModel.getPassword,
      'role': userModel.getRole,
      'image': userModel.getImage,
      'description': userModel.getDescription,
      'followers': userModel.getFollowers,
      'favourites': userModel.getFavourites,
      'reads': userModel.getReads,
      'writes': userModel.getWrites,
      'createdAt': userModel.getCreatedAt,
      'isDeleted': userModel.getIsDeleted,
    });
  }

  Stream<QuerySnapshot> getUsers() {
    final dataStream = users.orderBy('createdAt', descending: true).snapshots();
    return dataStream;
  }
}