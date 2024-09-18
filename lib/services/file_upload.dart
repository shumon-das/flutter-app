import 'package:firebase_storage/firebase_storage.dart';

class FileUpload {
  Future<String> uploadToFirebase(file, imgName) async {
    try {
      final downloadUrl = await (
          await FirebaseStorage.instance
          .ref('images/$imgName')
          .putFile(file))
          .ref
          .getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('File upload error is: $e');
      return 'File upload error is: $e';
    }
  }
}
