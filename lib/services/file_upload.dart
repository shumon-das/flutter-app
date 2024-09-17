import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FileUpload {
  uploadToFirebase(file, imgName) {
    try {
      Reference sr = FirebaseStorage.instance.ref().child(
        'Images/$imgName'
      );

      sr.putFile(file).whenComplete(() => {
        Fluttertoast.showToast(msg: 'File Uploaded')
      });
      // final downloadUrl = await (
      //     await FirebaseStorage.instance
      //     .ref('images/$imgName')
      //     .putFile(file))
      //     .ref
      //     .getDownloadURL();
    } catch (e) {
      print('File upload error is: $e');
    }
  }
}
